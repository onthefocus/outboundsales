-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create all ENUM types in one block
CREATE TYPE campaign_status AS ENUM ('active', 'archived');
CREATE TYPE agent_status AS ENUM ('draft', 'active', 'archived');
CREATE TYPE contact_status AS ENUM ('active', 'archived');
CREATE TYPE call_goal_status AS ENUM ('success', 'failure',  'unknown');
CREATE TYPE call_status AS ENUM ('planned', 'busy', 'called');
CREATE TYPE order_status AS ENUM ('inprogress', 'failed', 'success');

-- Create agent_types table
CREATE TABLE agent_types (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Insert default agent types
INSERT INTO agent_types (name, description) VALUES
    ('sales', 'Sales calls and lead generation'),
    ('survey', 'Customer surveys and feedback collection'),
    ('consulting', 'Consulting and advisory calls');

-- Create accounts table
CREATE TABLE accounts (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    address TEXT,
    registration_code VARCHAR(50),
    country VARCHAR(2) NOT NULL,
    vat_code VARCHAR(50),
    minutes_balance DECIMAL(10, 2) NOT NULL DEFAULT 0,
    stripe_token VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create users table
CREATE TABLE users (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    full_name VARCHAR(255) NOT NULL,
    account_uuid UUID NOT NULL REFERENCES accounts(uuid),
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create campaigns table
CREATE TABLE campaigns (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    account_uuid UUID NOT NULL REFERENCES accounts(uuid),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status campaign_status NOT NULL DEFAULT 'active',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create agent_templates table
CREATE TABLE agent_templates (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    type_uuid UUID NOT NULL REFERENCES agent_types(uuid),
    description TEXT,
    configuration JSONB NOT NULL DEFAULT '{}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create agents table
CREATE TABLE agents (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    campaign_uuid UUID NOT NULL REFERENCES campaigns(uuid),
    name VARCHAR(255) NOT NULL,
    type_uuid UUID NOT NULL REFERENCES agent_types(uuid),
    description TEXT,
    configuration JSONB NOT NULL DEFAULT '{}',
    status agent_status NOT NULL DEFAULT 'draft',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create contacts table
CREATE TABLE contacts (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    campaign_uuid UUID NOT NULL REFERENCES campaigns(uuid),
    name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(255),
    notes TEXT,
    status contact_status NOT NULL DEFAULT 'active',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create calls table
CREATE TABLE calls (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    agent_uuid UUID NOT NULL REFERENCES agents(uuid),
    contact_uuid UUID NOT NULL REFERENCES contacts(uuid),
    duration_minutes DECIMAL(10, 2) NOT NULL DEFAULT 0,
    recording_url TEXT,
    transcript JSONB,
    summary JSONB,
    goal_status call_goal_status NOT NULL DEFAULT 'unknown',
    goal_summary TEXT,
    status call_status NOT NULL DEFAULT 'planned',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create orders table
CREATE TABLE orders (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    account_uuid UUID NOT NULL REFERENCES accounts(uuid),
    minutes_credit INTEGER NOT NULL,
    stripe_payment_id VARCHAR(255),
    amount DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL DEFAULT 'USD',
    status order_status NOT NULL DEFAULT 'draft',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes
CREATE INDEX idx_users_account_uuid ON users(account_uuid);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_campaigns_account_uuid ON campaigns(account_uuid);
CREATE INDEX idx_agents_campaign_uuid ON agents(campaign_uuid);
CREATE INDEX idx_agents_type_uuid ON agents(type_uuid);
CREATE INDEX idx_agent_templates_type_uuid ON agent_templates(type_uuid);
CREATE INDEX idx_contacts_campaign_uuid ON contacts(campaign_uuid);
CREATE INDEX idx_calls_agent_uuid ON calls(agent_uuid);
CREATE INDEX idx_calls_contact_uuid ON calls(contact_uuid);
CREATE INDEX idx_orders_account_uuid ON orders(account_uuid);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create updated_at triggers for relevant tables
CREATE TRIGGER update_accounts_updated_at
    BEFORE UPDATE ON accounts
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_campaigns_updated_at
    BEFORE UPDATE ON campaigns
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_agents_updated_at
    BEFORE UPDATE ON agents
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_agent_templates_updated_at
    BEFORE UPDATE ON agent_templates
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_contacts_updated_at
    BEFORE UPDATE ON contacts
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_orders_updated_at
    BEFORE UPDATE ON orders
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_agent_types_updated_at
    BEFORE UPDATE ON agent_types
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Enable Row Level Security for all tables
ALTER TABLE accounts ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE campaigns ENABLE ROW LEVEL SECURITY;
ALTER TABLE agents ENABLE ROW LEVEL SECURITY;
ALTER TABLE agent_templates ENABLE ROW LEVEL SECURITY;
ALTER TABLE agent_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;
ALTER TABLE calls ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

-- Create a function to get current user's account_uuid
CREATE OR REPLACE FUNCTION get_current_user_account_uuid()
RETURNS UUID AS $$
  SELECT account_uuid 
  FROM users 
  WHERE uuid = auth.uid();
$$ LANGUAGE sql SECURITY DEFINER;

-- Create policies for accounts table
CREATE POLICY "Users can view their own account"
  ON accounts FOR SELECT
  USING (uuid = get_current_user_account_uuid());

CREATE POLICY "Users can update their own account"
  ON accounts FOR UPDATE
  USING (uuid = get_current_user_account_uuid());

-- Create policies for users table
CREATE POLICY "Users can view users in their account"
  ON users FOR SELECT
  USING (account_uuid = get_current_user_account_uuid());

-- Create policies for campaigns table
CREATE POLICY "Users can view campaigns in their account"
  ON campaigns FOR SELECT
  USING (account_uuid = get_current_user_account_uuid());

CREATE POLICY "Users can insert campaigns in their account"
  ON campaigns FOR INSERT
  WITH CHECK (account_uuid = get_current_user_account_uuid());

CREATE POLICY "Users can update campaigns in their account"
  ON campaigns FOR UPDATE
  USING (account_uuid = get_current_user_account_uuid());

CREATE POLICY "Users can delete campaigns in their account"
  ON campaigns FOR DELETE
  USING (account_uuid = get_current_user_account_uuid());

-- Create policies for agents table
CREATE POLICY "Users can view agents in their campaigns"
  ON agents FOR SELECT
  USING (campaign_uuid IN (
    SELECT uuid 
    FROM campaigns 
    WHERE account_uuid = get_current_user_account_uuid()
  ));

CREATE POLICY "Users can insert agents in their campaigns"
  ON agents FOR INSERT
  WITH CHECK (campaign_uuid IN (
    SELECT uuid 
    FROM campaigns 
    WHERE account_uuid = get_current_user_account_uuid()
  ));

CREATE POLICY "Users can update agents in their campaigns"
  ON agents FOR UPDATE
  USING (campaign_uuid IN (
    SELECT uuid 
    FROM campaigns 
    WHERE account_uuid = get_current_user_account_uuid()
  ));

CREATE POLICY "Users can delete agents in their campaigns"
  ON agents FOR DELETE
  USING (campaign_uuid IN (
    SELECT uuid 
    FROM campaigns 
    WHERE account_uuid = get_current_user_account_uuid()
  ));

-- Create policies for agent_templates table
CREATE POLICY "All users can view agent templates"
  ON agent_templates FOR SELECT
  TO authenticated
  USING (true);

-- Create policies for agent_types table
CREATE POLICY "All users can view agent types"
  ON agent_types FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Only admins can modify agent types"
  ON agent_types
  FOR ALL
  TO authenticated
  USING (auth.jwt() ->> 'role' = 'admin');

-- Create policies for contacts table
CREATE POLICY "Users can view contacts in their campaigns"
  ON contacts FOR SELECT
  USING (campaign_uuid IN (
    SELECT uuid 
    FROM campaigns 
    WHERE account_uuid = get_current_user_account_uuid()
  ));

CREATE POLICY "Users can insert contacts in their campaigns"
  ON contacts FOR INSERT
  WITH CHECK (campaign_uuid IN (
    SELECT uuid 
    FROM campaigns 
    WHERE account_uuid = get_current_user_account_uuid()
  ));

CREATE POLICY "Users can update contacts in their campaigns"
  ON contacts FOR UPDATE
  USING (campaign_uuid IN (
    SELECT uuid 
    FROM campaigns 
    WHERE account_uuid = get_current_user_account_uuid()
  ));

CREATE POLICY "Users can delete contacts in their campaigns"
  ON contacts FOR DELETE
  USING (campaign_uuid IN (
    SELECT uuid 
    FROM campaigns 
    WHERE account_uuid = get_current_user_account_uuid()
  ));

-- Create policies for calls table
CREATE POLICY "Users can view calls in their campaigns"
  ON calls FOR SELECT
  USING (agent_uuid IN (
    SELECT a.uuid 
    FROM agents a
    JOIN campaigns c ON a.campaign_uuid = c.uuid
    WHERE c.account_uuid = get_current_user_account_uuid()
  ));

CREATE POLICY "Users can insert calls for their agents"
  ON calls FOR INSERT
  WITH CHECK (agent_uuid IN (
    SELECT a.uuid 
    FROM agents a
    JOIN campaigns c ON a.campaign_uuid = c.uuid
    WHERE c.account_uuid = get_current_user_account_uuid()
  ));

-- Create policies for orders table
CREATE POLICY "Users can view orders in their account"
  ON orders FOR SELECT
  USING (account_uuid = get_current_user_account_uuid());

CREATE POLICY "Users can insert orders in their account"
  ON orders FOR INSERT
  WITH CHECK (account_uuid = get_current_user_account_uuid());