<script setup>
const downloadUrl = '/download/ai-chat-outline.zip'
const features = [
  '在 AI 聊天页面右上角实时生成消息导航目录',
  '支持对当前会话的用户消息做分层结构索引',
  '点击目录项快速定位对应消息，提升长对话阅读效率',
  '零权限读取仅限当前页面内容，安全可控'
]
const steps = [
  '下载插件压缩包并解压',
  '打开 Chrome，访问 chrome://extensions',
  '右上角开启“开发者模式”',
  '点击“加载已解压的扩展程序”，选择解压后的文件夹'
]
</script>

<template>
  <div class="page">
    <header class="hero">
      <h2>AI Chat Outline — Chrome 插件</h2>
      <p>为长对话提供清晰的目录导航，快速定位每条消息</p>
      <a class="cta" :href="downloadUrl" download>立即下载插件</a>
    </header>

    <section class="content">
      <div class="card">
        <h3>主要功能</h3>
        <ul class="list">
          <li v-for="f in features" :key="f">{{ f }}</li>
        </ul>
      </div>

      <div class="card">
        <h3>安装步骤</h3>
        <ol class="list">
          <li v-for="s in steps" :key="s">{{ s }}</li>
        </ol>
        <p class="tip">提示：插件安装后，会在支持的 AI 聊天页面右上角出现“消息目录”按钮。</p>
      </div>

      <div class="card">
        <h3>下载地址</h3>
        <p>
          稳定版本：<a :href="downloadUrl" download>/download/ai-chat-outline.zip</a>
        </p>
      </div>
    </section>
  </div>
  </template>

<style scoped>
.page {
  max-width: 960px;
  margin: 0 auto;
  padding: 2rem 1rem 3rem;
}
.hero {
  text-align: center;
  margin-bottom: 2rem;
}
.hero h2 {
  margin: 0;
  font-size: 2rem;
  font-weight: 800;
}
.hero p {
  color: #888;
  margin: 0.5rem 0 1rem;
}
.cta {
  display: inline-block;
  padding: 0.8rem 1.4rem;
  border-radius: 999px;
  background: #42d392;
  color: #0b1e1b;
  text-decoration: none;
  font-weight: 700;
  box-shadow: 0 6px 16px rgba(66, 211, 146, 0.35);
}
.cta:hover {
  filter: brightness(1.05);
}
.content {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}
.card {
  background: rgba(255, 255, 255, 0.06);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 16px;
  padding: 1.2rem 1.2rem 1rem;
}
.card h3 {
  margin: 0 0 0.6rem 0;
  font-size: 1.2rem;
  font-weight: 700;
}
.list {
  margin: 0;
  padding-left: 1.2rem;
  line-height: 1.7;
  color: #aaa;
}
.tip {
  margin-top: 0.6rem;
  color: #888;
}

@media (prefers-color-scheme: light) {
  .hero p { color: #555; }
  .card { background: #fff; border-color: rgba(0, 0, 0, 0.08); }
  .list { color: #555; }
  .tip { color: #666; }
}
</style>
