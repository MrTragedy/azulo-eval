<template>
  <div
    class="relative p-4 min-w-[160px] min-h-[80px] border rounded shadow-md cursor-pointer flex flex-col justify-center"
  >
    <h2 class="text-xl font-bold">
      {{ airport.AirportCode }} - {{ airport.Name }}
    </h2>
    <p>
      Ubicación: {{ airport.LocationId.Country }},
      {{ airport.LocationId.ProviceOrState }}
    </p>
    <p>Administrado por: {{ airport.AirportOperatorId.Name }}</p>

    <TempButton
      :airport-id="airport.id"
      @click="$emit('open-select', airport.id)"
    />

    <div
      v-if="selectedAirportId === airport.id"
      class="absolute top-full left-0 mt-2 p-4 bg-white border rounded shadow-lg z-10"
    >
      <label for="newOperator" class="block text-sm font-medium text-gray-700">
        Nuevo Operador:
      </label>
      <select
        :value="newOperatorId"
        @change="handleOperatorChange"
        id="newOperator"
        class="block w-full mt-1 border-gray-300 rounded-md shadow-sm"
      >
        <option
          v-for="operator in operators"
          :key="operator.id"
          :value="operator.id"
        >
          {{ operator.Name }}
        </option>
      </select>
    </div>
  </div>
</template>

<script lang="ts" setup>
import type { Airport } from "../../interfaces/IAirport";
import type { Operator } from "../../interfaces/IOperator";

const props = defineProps<{
  airport: Airport;
  operators: Operator[];
  selectedAirportId: number | null;
  newOperatorId: number | null;
}>();

const emit = defineEmits<{
  (event: "open-select", airportId: number): void;
  (event: "change-operator", airportId: number, newOperatorId: number): void;
}>();

const handleOperatorChange = (event: Event) => {
  const target = event.target as HTMLSelectElement;
  emit("change-operator", props.airport.id, Number(target.value));
};

const handleChangeOperator = () => {
  if (props.newOperatorId !== null) {
    emit("change-operator", props.airport.id, props.newOperatorId);
  }
};
</script>
