/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  safelist: [
    {
      pattern: /^(bg|border|text)-(blue|green|purple|orange|red|teal|yellow|indigo)-(500|600)$/,
      variants: ['hover', 'group-hover'],
    },
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
