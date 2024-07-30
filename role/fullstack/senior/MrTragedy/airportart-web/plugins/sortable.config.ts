import Sortable from 'sortablejs';
import { defineNuxtPlugin } from 'nuxt/app';

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.provide('sortable', Sortable);
});