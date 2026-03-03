<script setup>
import { ref, computed } from 'vue'

// 1. 分类定义 (根据 PRD)
const categories = [
  '全部',
  '智能对话大模型',
  'AI Agent 自动化',
  'AI 绘画 / 文生图',
  'AI 语音 / TTS',
  'AI 音乐 / 歌声合成',
  'AI video / 数字人',
  'AI 编程 / 开发',
  'AI 办公 / 效率工具'
]

// 2. 决策标签定义 (根据 PRD)
const filterOptions = [
  { label: '国内直连', value: '国内直连', icon: '🇨🇳' },
  { label: '免费可用', value: '免费可用', icon: '🆓' },
  { label: '无需翻墙', value: '无需翻墙', icon: '🔒' },
  { label: '中文界面', value: '中文界面', icon: '📶' },
  { label: '新手友好', value: '新手友好', icon: '🧑‍🎨' },
  { label: '可商用', value: '可商用', icon: '💼' }
]

// 3. 场景方案定义 (根据 PRD)
const scenarios = [
  { id: 'video', title: '短视频创作', icon: '🎥', desc: '0 基础做短视频成片' },
  { id: 'draw', title: 'AI 绘画变现', icon: '🎨', desc: '自媒体封面与配图' },
  { id: 'avatar', title: '数字人口播', icon: '🗣️', desc: '数字人口播快速出片' },
  { id: 'office', title: '办公自动提效', icon: '📊', desc: '长文档阅读与总结' },
  { id: 'writing', title: '文案脚本生成', icon: '✍️', desc: 'AI 文案/脚本/标题生成' },
  { id: 'coding', title: '程序员开发提效', icon: '💻', desc: 'AI 辅助编程与 Bug 修复' }
]

const activeCategory = ref('全部')
const activeListTab = ref('全部') // 榜单标签: 全部 | 新手必用 | 免费神器 | 国产优选 | 近期上新
const searchQuery = ref('')
const selectedTags = ref([])

// 4. 工具数据 (示例，需根据 PRD 补充)
const tools = [
  // 智能对话
  {
    name: 'ChatGPT',
    url: 'https://chat.openai.com',
    description: 'OpenAI 最强对话模型，AI 行业标杆',
    icon: '🟢',
    color: '#74aa9c',
    category: '智能对话大模型',
    tags: ['免费可用', '新手友好', '无需翻墙'], // 注意：ChatGPT 通常需要翻墙，这里标签仅供演示筛选逻辑
    features: ['语义理解强', '多模态', '代码生成'],
    scenarios: '复杂任务处理、创意写作、编程辅助',
    isHot: true,
    isNew: false,
    isFree: true,
    isCN: false
  },
  {
    name: 'DeepSeek',
    url: 'https://chat.deepseek.com',
    description: '深度求索 开源之光，推理能力极强',
    icon: '🐋',
    color: '#4e6ef2',
    category: '智能对话大模型',
    tags: ['国内直连', '免费可用', '中文界面', '新手友好'],
    features: ['开源模型', '代码能力强', '数学推理'],
    scenarios: '学术研究、代码开发、逻辑推理',
    isHot: true,
    isNew: false,
    isFree: true,
    isCN: true
  },
  {
    name: 'Kimi',
    url: 'https://kimi.com',
    description: '月之暗面 Kimi 智能助手，超长无损记忆',
    icon: '🌙',
    color: '#00d3ff',
    category: '智能对话大模型',
    tags: ['国内直连', '免费可用', '中文界面', '新手友好'],
    features: ['超长无损记忆', '联网搜索', '文件解读'],
    scenarios: '长篇财报分析、法律合同审查、资料整理',
    isHot: true,
    isNew: false,
    isFree: true,
    isCN: true
  },
  {
    name: '豆包',
    url: 'https://www.doubao.com',
    description: '字节跳动 AI 助手，语音交互体验极佳',
    icon: '🫘',
    color: '#4080ff',
    category: '智能对话大模型',
    tags: ['国内直连', '免费可用', '中文界面', '新手友好'],
    features: ['语音交互', '实时搜索', '多智能体'],
    scenarios: '日常问答、口语练习、信息检索',
    isHot: true,
    isNew: false,
    isFree: true,
    isCN: true
  },
  {
    name: 'Claude',
    url: 'https://claude.ai',
    description: 'Anthropic 智能助手，拟人化程度高',
    icon: '🟣',
    color: '#d97757',
    category: '智能对话大模型',
    tags: ['无需翻墙', '免费可用'],
    features: ['超长上下文', '逻辑推理', '拟人化'],
    scenarios: '论文阅读、代码架构分析、自然对话',
    isHot: true,
    isNew: false,
    isFree: true,
    isCN: false
  },
  {
    name: 'Gemini',
    url: 'https://gemini.google.com',
    description: 'Google 多模态 AI 助手',
    icon: '✨',
    color: '#4b90ff',
    category: '智能对话大模型',
    tags: ['无需翻墙', '免费可用'],
    features: ['原生多模态', '谷歌生态集成', '长文本分析'],
    scenarios: '文档分析、数据处理、跨应用协作',
    isHot: true,
    isNew: false,
    isFree: true,
    isCN: false
  },
  
  // AI Agent
  {
    name: 'Manus',
    url: 'https://manus.im/',
    description: '通用自主智能体，可自动完成复杂任务',
    icon: '🤖',
    color: '#00bcd4',
    category: 'AI Agent 自动化',
    tags: ['无需翻墙', '自动化'],
    features: ['自主执行', '任务规划', '工具调用'],
    scenarios: '工作流自动化、应用构建、复杂任务协作',
    isHot: true,
    isNew: true,
    isFree: false,
    isCN: false
  },
  {
    name: 'Coze',
    url: 'https://www.coze.com/',
    description: '字节跳动 AI Agent 平台',
    icon: '🧩',
    color: '#ff6b6b',
    category: 'AI Agent 自动化',
    tags: ['国内直连', '免费可用', '中文界面'],
    features: ['可视化工作流', '插件生态', '跨平台发布'],
    scenarios: '企业智能体搭建、业务流程自动化、数据协同',
    isHot: true,
    isNew: false,
    isFree: true,
    isCN: true
  },
  
  // AI 绘画
  {
    name: 'Midjourney',
    url: 'https://www.midjourney.com/',
    description: '艺术感极强，光影构图大师',
    icon: '🎨',
    color: '#f0f',
    category: 'AI 绘画 / 文生图',
    tags: ['无需翻墙', '高质量'],
    features: ['艺术风格', '光影构图', '高质量细节'],
    scenarios: '高端插画、商业摄影、UI/UX 设计构思',
    isHot: true,
    isNew: false,
    isFree: false,
    isCN: false
  },
  {
    name: '即梦 AI',
    url: 'https://jimeng.jianying.com/',
    description: '字节出品，中文语境完美理解',
    icon: '☁️',
    color: '#ff4757',
    category: 'AI 绘画 / 文生图',
    tags: ['国内直连', '免费可用', '中文界面', '新手友好'],
    features: ['中文理解', '修图扩图', '动效画板'],
    scenarios: '自媒体配图、快速中文创作、海报设计',
    isHot: true,
    isNew: false,
    isFree: true,
    isCN: true
  }
]

// 筛选逻辑
const filteredTools = computed(() => {
  let result = tools

  // 1. 类目筛选
  if (activeCategory.value !== '全部') {
    result = result.filter(tool => tool.category === activeCategory.value)
  }

  // 2. 榜单筛选
  if (activeListTab.value !== '全部') {
    if (activeListTab.value === '新手必用') result = result.filter(t => t.tags.includes('新手友好'))
    if (activeListTab.value === '免费神器') result = result.filter(t => t.isFree)
    if (activeListTab.value === '国产优选') result = result.filter(t => t.isCN)
    if (activeListTab.value === '近期上新') result = result.filter(t => t.isNew)
  }

  // 3. 标签筛选 (AND 逻辑)
  if (selectedTags.value.length > 0) {
    result = result.filter(tool => 
      selectedTags.value.every(tag => tool.tags.includes(tag))
    )
  }

  // 4. 搜索筛选
  if (searchQuery.value) {
    const query = searchQuery.value.toLowerCase()
    result = result.filter(tool => 
      tool.name.toLowerCase().includes(query) || 
      tool.description.toLowerCase().includes(query) ||
      tool.scenarios.toLowerCase().includes(query)
    )
  }

  return result
})

const toggleTag = (tag) => {
  const index = selectedTags.value.indexOf(tag)
  if (index === -1) {
    selectedTags.value.push(tag)
  } else {
    selectedTags.value.splice(index, 1)
  }
}

const getTagClass = (tag) => {
  if (tag === '国内直连') return 'badge-cn'
  if (tag === '免费可用') return 'badge-free'
  if (tag === '无需翻墙') return 'badge-safe'
  return 'badge-default'
}
</script>

<template>
  <div class="home-container">
    <!-- Hero Section -->
    <section class="hero-section">
      <div class="hero-content">
        <h1 class="main-title">AI 工具一站式决策平台</h1>
        <p class="main-subtitle">精选实测 ｜ 国内可用 ｜ 免费透明</p>
        
        <div class="search-container">
          <div class="search-bar">
            <span class="search-icon">🔍</span>
            <input 
              v-model="searchQuery" 
              type="text" 
              placeholder="输入工具 / 场景 / 功能搜索..." 
              class="search-input"
            />
          </div>
          <div class="quick-filters">
            <button 
              v-for="opt in filterOptions" 
              :key="opt.value"
              :class="['quick-filter-btn', { active: selectedTags.includes(opt.value) }]"
              @click="toggleTag(opt.value)"
            >
              {{ opt.icon }} {{ opt.label }}
            </button>
          </div>
        </div>
      </div>
    </section>

    <!-- King Kong Area (High-frequency shortcuts) -->
    <section class="king-kong-section">
      <div class="section-inner">
        <div class="shortcut-grid">
          <a v-for="tool in tools.filter(t => t.isHot).slice(0, 6)" 
             :key="tool.name" 
             :href="tool.url" 
             target="_blank" 
             class="shortcut-item">
            <div class="shortcut-icon">{{ tool.icon }}</div>
            <span class="shortcut-name">{{ tool.name }}</span>
          </a>
          <a href="#" class="shortcut-item more">
            <div class="shortcut-icon">➜</div>
            <span class="shortcut-name">更多</span>
          </a>
        </div>
      </div>
    </section>

    <!-- Scenarios Section -->
    <section class="scenarios-section">
      <div class="section-inner">
        <h2 class="section-title">按你的需求，直接给方案</h2>
        <div class="scenario-grid">
          <div v-for="scene in scenarios" :key="id" class="scenario-card">
            <div class="scenario-icon">{{ scene.icon }}</div>
            <div class="scenario-info">
              <h3>{{ scene.title }}</h3>
              <p>{{ scene.desc }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Main List Section -->
    <section class="main-list-section">
      <div class="section-inner">
        <!-- List Tabs -->
        <div class="list-tabs-container">
          <div class="list-tabs">
            <button 
              v-for="tab in ['全部', '新手必用', '免费神器', '国产优选', '近期上新']" 
              :key="tab"
              :class="['list-tab-btn', { active: activeListTab === tab }]"
              @click="activeListTab = tab"
            >
              {{ tab }}
            </button>
          </div>
          
          <div class="category-tabs">
            <button 
              v-for="cat in categories" 
              :key="cat"
              :class="['cat-tab-btn', { active: activeCategory === cat }]"
              @click="activeCategory = cat"
            >
              {{ cat }}
            </button>
          </div>
        </div>

        <!-- Tool Cards -->
        <div class="tool-grid">
          <div v-for="tool in filteredTools" :key="tool.name" class="tool-card">
            <div class="card-top">
              <div class="tool-icon-large">{{ tool.icon }}</div>
              <div class="tool-meta">
                <h4 class="tool-name">{{ tool.name }}</h4>
                <div class="tool-badges">
                  <span v-for="tag in tool.tags" :key="tag" :class="['badge', getTagClass(tag)]">
                    {{ tag }}
                  </span>
                </div>
              </div>
            </div>
            <p class="tool-desc">{{ tool.description }}</p>
            <div class="card-footer">
              <a :href="tool.url" target="_blank" class="btn-primary">立即使用</a>
              <button class="btn-secondary">查看详情</button>
            </div>
          </div>
          
          <div v-if="filteredTools.length === 0" class="no-data">
             <p>暂无匹配工具，尝试换个筛选条件吧～</p>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.home-container {
  width: 100%;
  /* color: #fff;  Removed to inherit from body */
}

.section-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
}

/* Hero Section */
.hero-section {
  padding: 6rem 0 4rem;
  background: radial-gradient(circle at 50% 0%, rgba(100, 108, 255, 0.1) 0%, transparent 70%);
  text-align: center;
}

.main-title {
  font-size: 3.5rem;
  font-weight: 800;
  margin-bottom: 1rem;
  background: linear-gradient(315deg, #42d392 25%, #647eff);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.main-subtitle {
  font-size: 1.5rem;
  color: #888;
  margin-bottom: 3rem;
  letter-spacing: 0.2rem;
}

.search-container {
  max-width: 800px;
  margin: 0 auto;
  position: relative;
  z-index: 10; /* Fix click issue */
}

.search-bar {
  display: flex;
  align-items: center;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 50px;
  padding: 0.8rem 1.5rem;
  margin-bottom: 1.5rem;
  transition: all 0.3s;
  position: relative; /* Ensure z-index works */
}

.search-bar:focus-within {
  border-color: #646cff;
  background: rgba(255, 255, 255, 0.08);
  box-shadow: 0 0 20px rgba(100, 108, 255, 0.2);
}

.search-input {
  background: transparent;
  border: none;
  color: inherit; /* Inherit text color */
  font-size: 1.2rem;
  width: 100%;
  padding-left: 1rem;
  outline: none;
}

.quick-filters {
  display: flex;
  justify-content: center;
  gap: 0.8rem;
  flex-wrap: wrap;
}

.quick-filter-btn {
  padding: 0.5rem 1.2rem;
  border-radius: 20px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  background: rgba(255, 255, 255, 0.03);
  color: #aaa;
  cursor: pointer;
  transition: all 0.2s;
  font-size: 0.9rem;
}

.quick-filter-btn:hover {
  background: rgba(255, 255, 255, 0.08);
  color: inherit;
}

.quick-filter-btn.active {
  background: #646cff;
  color: #fff;
  border-color: #646cff;
}

/* King Kong Area */
.king-kong-section {
  padding: 2rem 0;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}

.shortcut-grid {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 1rem;
}

.shortcut-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
  text-decoration: none;
  color: #ccc;
  width: 80px;
  transition: all 0.3s;
}

.shortcut-item:hover {
  color: #646cff;
  transform: translateY(-5px);
}

.shortcut-icon {
  width: 56px;
  height: 56px;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.8rem;
  transition: background 0.3s;
}

.shortcut-name {
  font-size: 0.85rem;
}

/* Scenarios Section */
.scenarios-section {
  padding: 4rem 0;
}

.section-title {
  font-size: 1.8rem;
  font-weight: 700;
  margin-bottom: 2rem;
  text-align: left;
}

.scenario-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 1.5rem;
}

.scenario-card {
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 20px;
  padding: 1.5rem;
  display: flex;
  align-items: center;
  gap: 1.2rem;
  cursor: pointer;
  transition: all 0.3s;
}

.scenario-card:hover {
  background: rgba(100, 108, 255, 0.05);
  border-color: #646cff;
  transform: scale(1.02);
}

.scenario-icon {
  font-size: 2.2rem;
}

.scenario-info h3 {
  font-size: 1.1rem;
  margin-bottom: 0.3rem;
}

.scenario-info p {
  font-size: 0.85rem;
  color: #888;
}

/* Main List Section */
.main-list-section {
  padding-bottom: 6rem;
}

.list-tabs-container {
  margin-bottom: 3rem;
}

.list-tabs {
  display: flex;
  gap: 1rem;
  margin-bottom: 2rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  padding-bottom: 1rem;
}

.list-tab-btn {
  background: transparent;
  border: none;
  color: #888;
  font-size: 1.1rem;
  font-weight: 600;
  cursor: pointer;
  position: relative;
  padding: 0 0.5rem;
}

.list-tab-btn.active {
  color: inherit; /* Use inherited color */
}

.list-tab-btn.active::after {
  content: '';
  position: absolute;
  bottom: -1rem;
  left: 0;
  width: 100%;
  height: 3px;
  background: #646cff;
}

.category-tabs {
  display: flex;
  gap: 0.8rem;
  flex-wrap: wrap;
}

.cat-tab-btn {
  padding: 0.4rem 1rem;
  border-radius: 8px;
  border: none;
  background: rgba(255, 255, 255, 0.05);
  color: #aaa;
  font-size: 0.9rem;
  cursor: pointer;
}

.cat-tab-btn.active {
  background: rgba(100, 108, 255, 0.2);
  color: #646cff;
  font-weight: 600;
}

/* Tool Grid */
.tool-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
  gap: 2rem;
}

.tool-card {
  background: #1a1a1a;
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: 24px;
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
  transition: all 0.3s;
}

.tool-card:hover {
  transform: translateY(-8px);
  border-color: rgba(100, 108, 255, 0.3);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

.card-top {
  display: flex;
  gap: 1rem;
  margin-bottom: 1rem;
}

.tool-icon-large {
  font-size: 3rem;
}

.tool-meta {
  display: flex;
  flex-direction: column;
  gap: 0.4rem;
}

.tool-name {
  font-size: 1.3rem;
  font-weight: 700;
}

.tool-badges {
  display: flex;
  gap: 0.4rem;
  flex-wrap: wrap;
}

.badge {
  font-size: 0.7rem;
  padding: 2px 6px;
  border-radius: 4px;
}

.badge-cn { background: rgba(66, 211, 146, 0.1); color: #42d392; }
.badge-free { background: rgba(255, 193, 7, 0.1); color: #ffc107; }
.badge-safe { background: rgba(100, 108, 255, 0.1); color: #a5a9ff; }
.badge-default { background: rgba(255, 255, 255, 0.05); color: #888; }

.tool-desc {
  color: #aaa;
  font-size: 0.95rem;
  line-height: 1.5;
  margin-bottom: 1.5rem;
  flex-grow: 1;
}

.card-footer {
  display: flex;
  gap: 1rem;
}

.btn-primary {
  flex: 1;
  background: #646cff;
  color: #fff;
  text-align: center;
  padding: 0.7rem;
  border-radius: 12px;
  text-decoration: none;
  font-weight: 600;
}

.btn-secondary {
  flex: 1;
  background: rgba(255, 255, 255, 0.05);
  color: inherit;
  border: 1px solid rgba(255, 255, 255, 0.1);
  padding: 0.7rem;
  border-radius: 12px;
  font-weight: 600;
  cursor: pointer;
}

.no-data {
  grid-column: 1 / -1;
  text-align: center;
  padding: 4rem;
  color: #666;
}

@media (max-width: 768px) {
  .main-title { font-size: 2.5rem; }
  .main-subtitle { font-size: 1.1rem; }
  .shortcut-grid { justify-content: center; }
  .tool-grid { grid-template-columns: 1fr; }
}

/* Light Mode Support */
@media (prefers-color-scheme: light) {
  .main-subtitle { color: #555; }
  
  .search-bar {
    background: #fff;
    border-color: #e5e7eb;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
  }
  .search-bar:focus-within {
    background: #fff;
    border-color: #646cff;
  }
  
  .quick-filter-btn {
    background: #fff;
    border-color: #e5e7eb;
    color: #4b5563;
  }
  .quick-filter-btn:hover {
    background: #f9fafb;
  }
  
  .king-kong-section {
    border-bottom-color: #e5e7eb;
  }
  .shortcut-item { color: #4b5563; }
  .shortcut-item:hover { color: #646cff; }
  .shortcut-icon {
    background: #fff;
    border: 1px solid #e5e7eb;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
  }
  
  .scenario-card {
    background: #fff;
    border-color: #e5e7eb;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
  }
  .scenario-info p { color: #6b7280; }
  
  .list-tabs { border-bottom-color: #e5e7eb; }
  .list-tab-btn { color: #6b7280; }
  .list-tab-btn.active { color: #111827; }
  
  .cat-tab-btn {
    background: #fff;
    border: 1px solid #e5e7eb;
    color: #4b5563;
  }
  .cat-tab-btn.active {
    background: #eff6ff;
    border-color: #bfdbfe;
    color: #2563eb;
  }
  
  .tool-card {
    background: #fff;
    border-color: #e5e7eb;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
  }
  .tool-card:hover {
    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
  }
  .tool-desc { color: #4b5563; }
  
  .btn-secondary {
    background: #fff;
    border-color: #e5e7eb;
    color: #374151;
  }
  .btn-secondary:hover {
    background: #f9fafb;
  }
  
  .badge-cn { background: #ecfdf5; color: #059669; }
  .badge-free { background: #fffbeb; color: #d97706; }
  .badge-safe { background: #eff6ff; color: #2563eb; }
  .badge-default { background: #f3f4f6; color: #6b7280; }
}
</style>
