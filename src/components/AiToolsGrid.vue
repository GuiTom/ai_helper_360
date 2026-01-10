<script setup>
const tools = [
  {
    name: 'ChatGPT',
    url: 'https://chat.openai.com',
    description: 'OpenAI 最强对话模型',
    icon: '🟢',
    color: '#74aa9c'
  },
  {
    name: 'Gemini',
    url: 'https://gemini.google.com',
    description: 'Google 多模态 AI 助手',
    icon: '✨',
    color: '#4b90ff'
  },
  {
    name: 'Claude',
    url: 'https://claude.ai',
    description: 'Anthropic 智能助手',
    icon: '🟣',
    color: '#d97757'
  },
  {
    name: '豆包',
    url: 'https://www.doubao.com',
    description: '字节跳动 AI 助手',
    icon: '🫘',
    color: '#4080ff'
  },
  {
    name: '通义千问',
    url: 'https://www.qianwen.com/',
    description: '阿里云大模型',
    icon: '☁️',
    color: '#624aff'
  },
  {
    name: 'DeepSeek',
    url: 'https://chat.deepseek.com',
    description: '深度求索 开源之光',
    icon: '🐋',
    color: '#4e6ef2'
  },
  {
    name: '文心一言',
    url: 'https://yiyan.baidu.com',
    description: '百度智能体与对话助手',
    icon: '🔵',
    color: '#2962ff'
  }
]
</script>

<template>
  <div class="grid-container">
    <a 
      v-for="tool in tools" 
      :key="tool.name" 
      :href="tool.url" 
      target="_blank" 
      class="card"
      :style="{ '--hover-color': tool.color }"
    >
      <div class="icon">{{ tool.icon }}</div>
      <h3>{{ tool.name }}</h3>
      <p>{{ tool.description }}</p>
    </a>
  </div>
</template>

<style scoped>
.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  padding: 2rem 0;
  width: 100%;
}

.card {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2rem;
  background-color: #1a1a1a;
  border-radius: 12px;
  text-decoration: none;
  color: inherit;
  transition: transform 0.2s, box-shadow 0.2s, background-color 0.2s;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
  background-color: #242424;
  border-color: var(--hover-color);
}

.icon {
  font-size: 4rem;
  margin-bottom: 1rem;
}

h3 {
  margin: 0.5rem 0;
  font-size: 1.5rem;
  font-weight: 600;
}

p {
  margin: 0;
  color: #888;
  font-size: 0.9rem;
}

@media (prefers-color-scheme: light) {
  .card {
    background-color: #f9f9f9;
    border: 1px solid rgba(0, 0, 0, 0.1);
  }
  .card:hover {
    background-color: #fff;
  }
  p {
    color: #666;
  }
}
</style>
