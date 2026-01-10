<script setup>
import AiToolsGrid from './components/AiToolsGrid.vue'
</script>

<template>
  <header>
    <div class="logo-container">
      <h1>AI Helper 360</h1>
      <p class="subtitle">您的 AI 工具一站式导航</p>
    </div>
  </header>

  <main>
    <AiToolsGrid />
  </main>

  <footer>
    <p>&copy; 2026 AI Helper 360. All rights reserved.</p>
  </footer>
</template>

<style scoped>
header {
  padding: 4rem 0 2rem;
}

.logo-container h1 {
  font-size: 3.5rem;
  font-weight: 700;
  background: -webkit-linear-gradient(315deg, #42d392 25%, #647eff);
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  margin: 0;
}

.subtitle {
  font-size: 1.2rem;
  color: #888;
  margin-top: 0.5rem;
}

footer {
  margin-top: 4rem;
  padding: 2rem;
  color: #666;
  font-size: 0.9rem;
}

@media (prefers-color-scheme: light) {
  .subtitle {
    color: #555;
  }
}
</style>
