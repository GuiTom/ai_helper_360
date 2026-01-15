import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import './style.css'
import App from './App.vue'
import AiToolsGrid from './components/AiToolsGrid.vue'
import PluginDownload from './pages/PluginDownload.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: AiToolsGrid },
    {
      path: '/outline_tool',
      component: PluginDownload,
      alias: ['/outline_tool/', '/outline_tool/index.html'],
    },
  ],
})

createApp(App).use(router).mount('#app')
