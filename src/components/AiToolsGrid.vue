<script setup>
import { ref, computed } from 'vue'

const categories = ['全部', '智能对话', 'AI Agent', '文生图', '文生音乐', '视频生成', '编程', 'UI 设计']
const activeCategory = ref('全部')

const tools = [
  // 智能对话
  {
    name: 'ChatGPT',
    url: 'https://chat.openai.com',
    description: 'OpenAI 最强对话模型',
    icon: '🟢',
    color: '#74aa9c',
    category: '智能对话',
    features: ['语义理解强', '多模态', '代码生成'],
    scenarios: '复杂任务处理、创意写作、编程辅助'
  },
  {
    name: 'Gemini',
    url: 'https://gemini.google.com',
    description: 'Google 多模态 AI 助手',
    icon: '✨',
    color: '#4b90ff',
    category: '智能对话',
    features: ['原生多模态', '谷歌生态集成', '长文本分析'],
    scenarios: '文档分析、数据处理、跨应用协作'
  },
  {
    name: 'Claude',
    url: 'https://claude.ai',
    description: 'Anthropic 智能助手',
    icon: '🟣',
    color: '#d97757',
    category: '智能对话',
    features: ['超长上下文', '逻辑推理', '拟人化'],
    scenarios: '论文阅读、代码架构分析、自然对话'
  },
  {
    name: '豆包',
    url: 'https://www.doubao.com',
    description: '字节跳动 AI 助手',
    icon: '🫘',
    color: '#4080ff',
    category: '智能对话',
    features: ['语音交互', '实时搜索', '多智能体'],
    scenarios: '日常问答、口语练习、信息检索'
  },
  {
    name: '通义千问',
    url: 'https://www.qianwen.com/',
    description: '阿里云大模型',
    icon: '☁️',
    color: '#624aff',
    category: '智能对话',
    features: ['文档解析', '图片理解', '长文档处理'],
    scenarios: '办公文档处理、数据分析、行业应用'
  },
  {
    name: 'DeepSeek',
    url: 'https://chat.deepseek.com',
    description: '深度求索 开源之光',
    icon: '🐋',
    color: '#4e6ef2',
    category: '智能对话',
    features: ['开源模型', '代码能力强', '数学推理'],
    scenarios: '学术研究、代码开发、逻辑推理'
  },
  {
    name: '文心一言',
    url: 'https://yiyan.baidu.com',
    description: '百度智能体与对话助手',
    icon: '🔵',
    color: '#2962ff',
    category: '智能对话',
    features: ['中文理解', '知识增强', '多模态生成'],
    scenarios: '中文创作、知识问答、商业文案'
  },
  {
    name: 'Kimi',
    url: 'https://kimi.com',
    description: '月之暗面 Kimi 智能助手',
    icon: '🌙',
    color: '#00d3ff',
    category: '智能对话',
    features: ['超长无损记忆', '联网搜索', '文件解读'],
    scenarios: '长篇财报分析、法律合同审查、资料整理'
  },
  {
    name: 'Grok',
    url: 'https://grok.com',
    description: 'xAI 多模态智能助手',
    icon: '⚡️',
    color: '#1d9bf0',
    category: '智能对话',
    features: ['多模态', '联网搜索', '编程辅助'],
    scenarios: '日常问答、图文理解、代码开发'
  },

  {
    name: 'Manus',
    url: 'https://manus.im/',
    description: '通用自主智能体，可自动完成复杂任务',
    icon: '🤖',
    color: '#00bcd4',
    category: 'AI Agent',
    features: ['自主执行', '任务规划', '工具调用'],
    scenarios: '工作流自动化、应用构建、复杂任务协作'
  },
  {
    name: 'Coze',
    url: 'https://www.coze.com/',
    description: '字节跳动 AI Agent 平台，低代码搭建与部署',
    icon: '🧩',
    color: '#ff6b6b',
    category: 'AI Agent',
    features: ['可视化工作流', '插件生态', '跨平台发布'],
    scenarios: '企业智能体搭建、业务流程自动化、数据协同'
  },

  // 文生图
  {
    name: 'Midjourney',
    url: 'https://www.midjourney.com/',
    description: '艺术感极强，光影构图大师',
    icon: '🎨',
    color: '#f0f',
    category: '文生图',
    features: ['艺术风格', '光影构图', '高质量细节'],
    scenarios: '高端插画、商业摄影、UI/UX 设计构思'
  },
  {
    name: 'DALL-E 3',
    url: 'https://chat.openai.com',
    description: '集成于 ChatGPT，语义理解最强',
    icon: '🖼️',
    color: '#ff9900',
    category: '文生图',
    features: ['语义精准', '对话式修改', '易用性'],
    scenarios: '头脑风暴、概念图设计、快速配图'
  },
  {
    name: 'Stable Diffusion',
    url: 'https://stability.ai/',
    description: '开源生态，精准控制',
    icon: '🌊',
    color: '#7f5af0',
    category: '文生图',
    features: ['ControlNet', '本地部署', '高度定制'],
    scenarios: '电商模特替换、建筑效果图、角色定制'
  },
  {
    name: '即梦 AI',
    url: 'https://jimeng.jianying.com/',
    description: '字节出品，中文语境完美理解',
    icon: '☁️',
    color: '#ff4757',
    category: '文生图',
    features: ['中文理解', '修图扩图', '动效画板'],
    scenarios: '自媒体配图、快速中文创作、海报设计'
  },

  {
    name: 'Suno',
    url: 'https://suno.com',
    description: '文生音乐与歌声合成，风格与结构强',
    icon: '🎵',
    color: '#e91e63',
    category: '文生音乐',
    features: ['文生音乐', '人声合成', '风格多样'],
    scenarios: '短视频配乐、原创歌曲、广告音效'
  },
  {
    name: 'Udio',
    url: 'https://www.udio.com',
    description: '快速生成高质量歌曲，歌词旋律一体化',
    icon: '🎶',
    color: '#3b82f6',
    category: '文生音乐',
    features: ['一键生成', '歌词旋律', '高保真'],
    scenarios: '音乐创作草稿、播客片头、社媒内容'
  },
  {
    name: 'Mureka',
    url: 'https://www.mureka.ai/',
    description: '多工具一体的 AI 音乐平台，版权友好',
    icon: '🎼',
    color: '#10b981',
    category: '文生音乐',
    features: ['文生音乐', '人声合成', '可商用'],
    scenarios: '版权安全配乐、风格化音轨、专业混音素材'
  },
  {
    name: 'Boomy',
    url: 'https://boomy.com',
    description: '零门槛 AI 作曲，快速发布与分发',
    icon: '🎧',
    color: '#8b5cf6',
    category: '文生音乐',
    features: ['快速创作', '风格模板', '平台分发'],
    scenarios: '个人创作、独立音乐发行、背景音乐'
  },

  // 视频生成
  {
    name: 'Sora',
    url: 'https://openai.com/sora',
    description: '世界模拟器，分钟级长视频',
    icon: '🎥',
    color: '#000',
    category: '视频生成',
    features: ['超长视频', '物理规律', '多镜头一致性'],
    scenarios: '电影短片、复杂叙事视频、创意广告'
  },
  {
    name: '海螺 AI',
    url: 'https://hailuoai.com/',
    description: '动作爆发力强，肢体自然',
    icon: '🐚',
    color: '#2ed573',
    category: '视频生成',
    features: ['大幅度动作', '表情捕捉', '高清画质'],
    scenarios: '舞蹈视频、动作戏、夸张表情模拟'
  },
  {
    name: '智谱清影',
    url: 'https://chatglm.cn/video',
    description: '生成速度快，秒级响应',
    icon: '📽️',
    color: '#3742fa',
    category: '视频生成',
    features: ['快速生成', '图生视频', '多风格'],
    scenarios: '快速素材产出、自媒体初剪、新闻配图'
  },
  {
    name: '可灵 AI',
    url: 'https://klingai.kuaishou.com/',
    description: '国产标杆，人脸保真度高',
    icon: '🎬',
    color: '#ffa502',
    category: '视频生成',
    features: ['人脸保真', '动作流畅', '长视频'],
    scenarios: '让照片说话、老照片修复、生活化场景'
  },
  {
    name: 'Runway',
    url: 'https://runwayml.com/',
    description: '专业级控制，运动笔刷',
    icon: '🎞️',
    color: '#ff6b81',
    category: '视频生成',
    features: ['运动笔刷', '局部控制', '影视特效'],
    scenarios: '专业影视特效、局部动态控制、创意转场'
  },
  {
    name: 'Luma Dream Machine',
    url: 'https://lumalabs.ai/dream-machine',
    description: '物理模拟真实，免费额度友好',
    icon: '🌌',
    color: '#70a1ff',
    category: '视频生成',
    features: ['物理模拟', '写实风格', '快速迭代'],
    scenarios: '生活化场景模拟、写实短片、产品展示'
  },

  // 编程
  {
    name: 'Claude Code',
    url: 'https://www.anthropic.com/claude-code',
    description: '终端式AI交互，自动化脚本与任务',
    icon: '🟣',
    color: '#d97757',
    category: '编程',
    type: '终端工具',
    features: ['项目构建', '脚本生成', '自动化任务'],
    scenarios: '命令行爱好者、自动化任务开发'
  },
  {
    name: 'Antigravity',
    url: 'https://antigravity.google/',
    description: '谷歌多Agent编码，跨表面并行任务编排',
    icon: '🛰️',
    color: '#34a853',
    category: '编程',
    type: '独立IDE',
    features: ['双界面', '多模型支持', '并行编排'],
    scenarios: '大项目/多任务并行、Google生态'
  },
  {
    name: 'Trae.ai',
    url: 'https://trae.ai',
    description: '免费AI IDE，对话式改功能与API集成',
    icon: '�',
    color: '#4080ff',
    category: '编程',
    type: '独立IDE',
    features: ['对话式改代码', 'API集成', '中文友好'],
    scenarios: '国内开发者、快速迭代项目'
  },
  {
    name: 'Windsurf',
    url: 'https://windsurf.ai',
    description: 'Cascade Agent，多智能体协作与内联编辑',
    icon: '🌊',
    color: '#00bcd4',
    category: '编程',
    type: '独立IDE',
    features: ['智能补全', '内联编辑', '多智能体协作'],
    scenarios: '复杂项目、架构设计'
  },
  {
    name: 'Cursor',
    url: 'https://www.cursor.sh',
    description: 'AI原生IDE，对话式生成与自动diff回退',
    icon: '✨',
    color: '#7c3aed',
    category: '编程',
    type: '独立IDE',
    features: ['对话生成', '重构与调试', '项目级上下文'],
    scenarios: '全栈开发、原型迭代'
  },
  {
    name: 'Replit',
    url: 'https://replit.com',
    description: '浏览器IDE+AI，零配置协作与部署',
    icon: '🌐',
    color: '#ff6b6b',
    category: '编程',
    type: '浏览器IDE',
    features: ['在线IDE', '协作共享', '自主错误检测'],
    scenarios: '学生、快速原型、Web应用开发'
  },
  {
    name: '通义灵码',
    url: 'https://tongyi.aliyun.com/lingma/',
    description: '阿里系中文原生代码助手',
    icon: '🧠',
    color: '#42d392',
    category: '编程',
    type: 'IDE插件',
    features: ['代码生成', '重构与调试', '多IDE插件'],
    scenarios: '阿里云生态集成、全栈开发'
  },
  {
    name: 'Qoder AI IDE',
    url: 'https://qoder.com/',
    description: 'AI原生IDE，长任务规划与协同',
    icon: '⚙️',
    color: '#3b82f6',
    category: '编程',
    type: '独立IDE',
    features: ['Quest规划', 'Repo文档', '本地+云协同'],
    scenarios: '复杂项目、架构设计'
  },
  {
    name: '通义百炼 + AgentScope',
    url: 'https://bailian.aliyun.com/',
    description: '多智能体编排与企业级Agent平台',
    icon: '🛠️',
    color: '#624aff',
    category: '编程',
    type: '平台/SDK',
    features: ['Agent编排', '通义+第三方模型', 'SDK/Docker部署'],
    scenarios: '企业级AI应用、多步骤任务'
  },
  {
    name: 'CodeBuddy AI IDE',
    url: 'https://www.codebuddy.ai/',
    description: '腾讯云全栈AI IDE，微信生态深度集成',
    icon: '🧰',
    color: '#2962ff',
    category: '编程',
    type: '独立IDE',
    features: ['前后端一体', 'BaaS集成', '设计稿转代码'],
    scenarios: '小程序/公众号、全栈快速开发'
  },
  {
    name: 'CloudBase AI CLI',
    url: 'https://cloud.tencent.com/product/cloudbase',
    description: '腾讯云命令行AI工作流，与云资源打通',
    icon: '🖥️',
    color: '#10b981',
    category: '编程',
    type: '终端工具',
    features: ['自然语言调度', '云函数', '数据库与存储'],
    scenarios: '终端爱好者、云原生开发'
  },
  {
    name: '混元 Code 插件',
    url: 'https://cloud.tencent.com/product/hunyuan-code',
    description: '代码补全与重构，中文环境友好',
    icon: '�',
    color: '#3742fa',
    category: '编程',
    type: 'IDE插件',
    features: ['代码补全', '解释说明', '重构'],
    scenarios: '存量IDE用户、中文环境开发者'
  },
  {
    name: 'Cline (VS Code)',
    url: 'https://cline.ai',
    description: 'IDE+终端一体，连接MCP生成与重构',
    icon: '🧩',
    color: '#2563eb',
    category: '编程',
    type: 'IDE插件',
    features: ['MCP连接', '生成与补全', '代码重构'],
    scenarios: 'VS Code用户、API开发'
  },
  {
    name: 'GitHub Copilot',
    url: 'https://github.com/features/copilot',
    description: '成熟生态的代码补全与解释',
    icon: '🐙',
    color: '#0b5fff',
    category: '编程',
    type: 'IDE插件',
    features: ['代码补全', '生成解释', '多语言支持'],
    scenarios: '全栈开发者、存量项目维护'
  },
  {
    name: 'vibe-coding-toolbox',
    url: 'https://www.npmjs.com/package/vibe-coding-toolbox',
    description: '提示增强与项目扫描的开源工具箱',
    icon: '🧰',
    color: '#a5a9ff',
    category: '编程',
    type: '终端工具',
    features: ['提示增强', '项目扫描', '语义搜索'],
    scenarios: '全栈开发者、项目梳理'
  },
  {
    name: 'OpenCode',
    url: 'https://opencode.ai/',
    description: 'API驱动的代码生成与重构',
    icon: '🔷',
    color: '#1d9bf0',
    category: '编程',
    type: 'API/CLI',
    features: ['生成与重构', '调试支持', 'API集成'],
    scenarios: 'OpenAI生态用户、API驱动开发'
  },
  {
    name: 'Warp',
    url: 'https://www.warp.dev/',
    description: '终端内集成AI，支持并行任务与文件操作',
    icon: '⚡️',
    color: '#ff9900',
    category: '编程',
    type: '终端工具',
    features: ['读写文件', '并行任务', '错误检测'],
    scenarios: '终端重度用户、全栈开发'
  }
]

// UI 设计
tools.push(
  {
    name: 'UI UX Pro Max',
    url: 'https://ui-ux-pro-max-skill.nextlevelbuilder.io/',
    description: '面向 Claude Code等AI IDE 的设计智能，UI 样式与色彩库',
    icon: '🎨',
    color: '#ff6b6b',
    category: 'UI 设计',
    features: ['设计智能', '样式库', '配色推荐'],
    scenarios: '生成高质量界面、风格选型、设计规范'
  },
  {
    name: 'Stitch',
    url: 'https://stitch.withgoogle.com/',
    description: 'Google 设计系统与组件方案',
    icon: '🧵',
    color: '#1d9bf0',
    category: 'UI 设计',
    features: ['设计系统', '组件库', '最佳实践'],
    scenarios: '快速搭建一致性 UI'
  }
)

const filteredTools = computed(() => {
  if (activeCategory.value === '全部') {
    return tools
  }
  return tools.filter(tool => tool.category === activeCategory.value)
})
</script>

<template>
  <div class="container">
    <div class="tabs">
      <button 
        v-for="cat in categories" 
        :key="cat"
        :class="['tab-btn', { active: activeCategory === cat }]"
        @click="activeCategory = cat"
      >
        {{ cat }}
      </button>
    </div>

    <div class="grid-container">
      <a 
        v-for="tool in filteredTools" 
        :key="tool.name" 
        :href="tool.url" 
        target="_blank" 
        class="card"
        :style="{ '--hover-color': tool.color }"
      >
        <div class="card-content">
          <div class="card-header">
            <div class="icon">{{ tool.icon }}</div>
            <div class="title-area">
              <h3>{{ tool.name }}</h3>
              <span class="category-tag">{{ tool.category }}</span>
              <span v-if="tool.type" class="type-tag">{{ tool.type }}</span>
            </div>
          </div>
          
          <p class="description">{{ tool.description }}</p>
          
          <div class="tags">
            <span v-for="feature in tool.features" :key="feature" class="tag">
              {{ feature }}
            </span>
          </div>
        </div>

        <div class="scenarios">
          <strong>适用场景：</strong>{{ tool.scenarios }}
        </div>
      </a>
    </div>
  </div>
</template>

<style scoped>
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
}

.tabs {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin-bottom: 2.5rem;
  flex-wrap: wrap;
}

.tab-btn {
  padding: 0.8rem 1.8rem;
  border: none;
  background: rgba(255, 255, 255, 0.05);
  color: #888;
  border-radius: 24px;
  cursor: pointer;
  font-size: 1rem;
  font-weight: 500;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.tab-btn:hover {
  background: rgba(255, 255, 255, 0.1);
  color: #fff;
  transform: translateY(-2px);
}

.tab-btn.active {
  background: #646cff;
  color: #fff;
  font-weight: 600;
  box-shadow: 0 4px 12px rgba(100, 108, 255, 0.3);
}

.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
  gap: 2rem;
  padding: 0.5rem;
}

.card {
  display: flex;
  flex-direction: column;
  background-color: #1e1e1e;
  border-radius: 20px;
  text-decoration: none;
  color: inherit;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  border: 1px solid rgba(255, 255, 255, 0.08);
  position: relative;
  overflow: hidden;
  height: 100%;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
}

.card:hover {
  transform: translateY(-8px);
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.2), 0 10px 10px -5px rgba(0, 0, 0, 0.1);
  background-color: #252525;
  border-color: var(--hover-color);
}

.card-content {
  padding: 1.5rem;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
}

.card-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1rem;
}

.icon {
  font-size: 2.8rem;
  flex-shrink: 0;
  line-height: 1;
}

.title-area {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 4px;
}

h3 {
  margin: 0;
  font-size: 1.35rem;
  font-weight: 700;
  color: #fff;
  line-height: 1.2;
}

.category-tag {
  font-size: 0.75rem;
  background: rgba(255, 255, 255, 0.1);
  padding: 2px 10px;
  border-radius: 12px;
  color: #aaa;
  font-weight: 500;
}

.type-tag {
  font-size: 0.75rem;
  background: rgba(255, 255, 255, 0.08);
  padding: 2px 10px;
  border-radius: 12px;
  color: #bbb;
  font-weight: 500;
  margin-left: 8px;
  border: 1px solid rgba(255, 255, 255, 0.06);
}

.description {
  margin: 0 0 1.2rem 0;
  color: #ccc;
  font-size: 0.95rem;
  line-height: 1.6;
}

.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.6rem;
  margin-top: auto;
}

.tag {
  font-size: 0.75rem;
  background: rgba(100, 108, 255, 0.1);
  color: #a5a9ff;
  padding: 4px 10px;
  border-radius: 8px;
  font-weight: 500;
  border: 1px solid rgba(100, 108, 255, 0.1);
}

.card:hover .tag {
  background: rgba(100, 108, 255, 0.2);
  border-color: rgba(100, 108, 255, 0.3);
}

.scenarios {
  font-size: 0.85rem;
  color: #888;
  padding: 1rem 1.5rem;
  background: rgba(0, 0, 0, 0.2);
  border-top: 1px solid rgba(255, 255, 255, 0.05);
  line-height: 1.5;
}

.scenarios strong {
  color: #aaa;
  display: inline-block;
  margin-bottom: 2px;
}

@media (prefers-color-scheme: light) {
  .card {
    background-color: #ffffff;
    border: 1px solid rgba(229, 231, 235, 1);
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03);
  }
  
  .card:hover {
    background-color: #ffffff;
    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  }
  
  h3 {
    color: #1a1a1a;
  }
  
  .description {
    color: #4b5563;
  }
  
  .tab-btn {
    background: #ffffff;
    color: #6b7280;
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  }
  
  .tab-btn:hover {
    background: #f9fafb;
    color: #111827;
  }
  
  .category-tag {
    background: #f3f4f6;
    color: #6b7280;
  }
  
  .tag {
    background: #eff6ff;
    color: #2563eb;
    border-color: #dbeafe;
  }
  
  .card:hover .tag {
    background: #dbeafe;
    border-color: #bfdbfe;
  }
  
  .scenarios {
    background: #f9fafb;
    border-top-color: #f3f4f6;
    color: #6b7280;
  }
  
  .scenarios strong {
    color: #374151;
  }
}
</style>
