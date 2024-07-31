<template>
  <button
    @click="openSelect"
    :class="buttonClass"
    class="mt-2 p-2 text-white rounded"
  >
    {{ buttonText }}
  </button>
</template>

<script lang="ts" setup>
import { computed } from "vue";

const props = defineProps<{
  airportId: number;
}>();

const emit = defineEmits<{
  (event: "open-select", airportId: number): void;
}>();

const buttonText = computed(() => "Cambiar operador");

const buttonClass = computed(() => "bg-blue-500");

const openSelect = () => {
  emit("open-select", props.airportId);
};
</script>
