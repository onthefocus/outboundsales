# Outbound Call Campaign Platform

## Project Overview
A SaaS platform enabling businesses to manage outbound call campaigns using AI agents. The system allows users to create campaigns, manage contacts, configure AI agents, and execute automated calls while tracking usage and billing.

## Core Features

### Authentication & Authorization
- User registration with email confirmation
- Multi-user accounts (one account can have multiple users)
- Role-based access control
- Session management

### Dashboard Interface
- Left sidebar layout (no top header)
- Components:
  - Logo (top)
  - Main navigation menu (Dashboard, Campaigns, Contacts, Assistants)
  - Profile section
  - Billing section
  - Available minutes display
  - Top-up link

### Data Architecture

#### Users
- Basic user information (name, email, password)
- Account association
- Role/permissions
- Status (active/inactive)
- Email verification status

#### Accounts
- Company/organization information
- Available minutes balance
- Status
- Subscription information
- Multiple users association

#### Campaigns
- Name and description
- Status (draft, active, completed)
- Account association
- Creation/modification dates
- Campaign settings
- Performance metrics
- Deletion restrictions when calls exist

#### Agents
- Configuration settings
- Instructions/scripts
- Campaign association
- Performance metrics
- Status

#### Contacts
- Basic contact information
- Campaign association
- Optional agent association
- Status
- Import/export capabilities
- Modification restrictions after calls

#### Calls
- Recording URL
- Transcript
- Status
- Duration
- User association
- Agent association
- Contact association
- Timestamp
- Cost (minutes used)

#### Orders
- Amount paid
- Minutes purchased
- Stripe transaction ID
- Status
- Timestamp
- Account association
- Plan reference

#### Plans
- Name
- Minutes included
- Price
- Status
- Description

## Business Logic

### Campaign Management
- CRUD operations for campaigns
- Campaign duplication (with associated contacts and agents)
- Status tracking
- Performance analytics
- Deletion restrictions

### Contact Management
- Manual entry
- Bulk import
- Modification restrictions
- Status tracking
- Campaign association

### Call Execution
- Integration with VAPI API
- Minutes balance checking
- Call recording
- Transcription
- Status tracking
- Performance analytics

### Billing System
- Free tier (20 minutes)
- Minute packages:
  - 50 minutes: $30
  - 100 minutes: $50
  - 200 minutes: $80
  - 500 minutes: $200
- Stripe integration
- Order tracking
- Balance management

## Technical Architecture

### Frontend (Nuxt.js)
- Latest version without Nitro server
- Component-based architecture
- Tailwind CSS for styling
- Module-based organization in /app folder
- Responsive design based on OpenUp template

### Backend (Supabase)
- Database design
- Authentication
- Storage
- Real-time capabilities
- API integration

### Integrations
- Stripe for payments
- VAPI for calls
- Email service for notifications

### Deployment
- Laravel Forge for deployment
- Digital Ocean hosting
- CI/CD pipeline

## Project Structure
```
├── app/
│   ├── components/
│   │   ├── dashboard/
│   │   ├── campaigns/
│   │   ├── contacts/
│   │   ├── agents/
│   │   ├── billing/
│   │   └── shared/
│   ├── layouts/
│   ├── pages/
│   ├── stores/
│   └── utils/
├── business/
│   ├── services/
│   ├── models/
│   └── repositories/
├── config/
├── public/
└── tests/
```

## Security Requirements
- Authentication
- Authorization
- Data encryption
- API security
- Rate limiting
- Audit logging

## Performance Requirements
- Page load times < 2s
- Real-time updates
- Efficient data pagination
- Optimized API calls
- Caching strategy

## Monitoring and Analytics
- Error tracking
- Usage metrics
- Performance monitoring
- Business analytics
- User behavior tracking

## Future Considerations
- Scalability planning
- Multi-language support
- Additional payment methods
- Advanced analytics
- API access for customers