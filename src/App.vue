<script setup>
</script>

<template>
  <header>
    <nav class="top-nav">
      <RouterLink class="nav-link" to="/">首页</RouterLink>
      <RouterLink class="nav-link" to="/outline_tool">Chrome 插件：AI Chat Outline 下载</RouterLink>
    </nav>
    <div class="logo-container">
      <h1>AI Helper 360</h1>
      <p class="subtitle">您的 AI 工具一站式导航</p>
    </div>
  </header>

  <main>
    <RouterView />
  </main>

  <footer>
    <p>&copy; 2026 AI Helper 360. All rights reserved.</p>
  </footer>
</template>

<style scoped>
header {
  padding: 2rem 0 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
}

.top-nav {
  position: absolute;
  top: 0.75rem;
  right: 2rem;
  display: flex;
  gap: 0.75rem;
  flex-wrap: wrap;
  justify-content: flex-end;
}

.nav-link {
  display: inline-block;
  padding: 0.6rem 1rem;
  border-radius: 999px;
  background: #646cff;
  color: #fff;
  text-decoration: none;
  font-size: 0.95rem;
  box-shadow: 0 6px 16px rgba(100, 108, 255, 0.3);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.nav-link:hover {
  transform: translateY(-1px);
  box-shadow: 0 10px 20px rgba(100, 108, 255, 0.35);
}

.logo-container {
  display: flex;
  flex-direction: column;
  align-items: center;
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

@media (max-width: 640px) {
  header {
    padding: 0.8rem 0 1.6rem;
  }
  .top-nav {
    position: static;
    align-self: center;
    margin: 0.4rem 0 0.6rem;
  }
  .nav-link {
    padding: 0.5rem 0.9rem;
    font-size: 0.85rem;
  }
  .logo-container h1 {
    font-size: 2.8rem;
    line-height: 1.1;
  }
}
</style>
