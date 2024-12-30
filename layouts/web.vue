<template>
  <div class="web-layout">
    <Header />
    <main>
      <slot />
    </main>
    <Footer />
  </div>
</template>

<script setup lang="ts">
import Header from '~/components/shared/Header.vue'
import Footer from '~/components/shared/Footer.vue'
</script>

<style>
.web-layout {
  @apply min-h-screen flex flex-col;
}

main {
  @apply flex-1;
}
</style>
