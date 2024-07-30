// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devServer: {
    port: 8000
  },
  devtools: { enabled: true },
  css: ['~/assets/css/main.css'],
  plugins: [
    '~/plugins/sortable.config.ts'
  ],
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
  runtimeConfig: {
		public: {
			VITE_NEST_BACKEND: "",
      VITE_DIRECTUS_BACKEND: "",
		},
	},
  vue: {
		compilerOptions: {
			isCustomElement: (tag) => tag.includes("-"),
		},
	},

  compatibilityDate: '2024-07-27',
})