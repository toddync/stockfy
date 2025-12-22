import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  root: '.', // Set the root to the current directory where index.html resides
  publicDir: 'public', // Specify the public directory for static assets
  build: {
    rollupOptions: {
      input: 'index.html', // Explicitly define index.html as the entry point
    },
  },
})
