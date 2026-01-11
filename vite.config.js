import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'path'

export default defineConfig({
  plugins: [vue()],
  build: {
    outDir: 'aiHelper360.com',
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'index.html'),
        outline_tool: resolve(__dirname, 'outline_tool/index.html')
      }
    }
  }
})

