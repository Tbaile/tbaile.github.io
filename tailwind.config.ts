import type { Config } from 'tailwindcss'
import colors = require('tailwindcss/colors')

export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        primary: colors.gray
      }
    }
  },
  plugins: []
} satisfies Config
