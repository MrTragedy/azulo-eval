<template>
  <div
    class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4"
    ref="sortableList"
  >
    <TempCard
      v-for="airport in airports"
      :key="airport.id"
      :airport="airport"
      :operators="operators"
      :selected-airport-id="selectedAirportId"
      :new-operator-id="newOperatorId"
      @open-select="openSelect"
      @change-operator="changeOperator"
    />
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from "vue";
import Sortable from "sortablejs";
import { AirportsClient } from "../services/http/directus-api.http";
import type { Airport } from "../interfaces/IAirport";
import type { Operator } from "../interfaces/IOperator";

const airports = ref<Airport[]>([]);
const operators = ref<Operator[]>([]);
const sortableList = ref<HTMLElement | null>(null);
const selectedAirportId = ref<number | null>(null);
const newOperatorId = ref<number | null>(null);

onMounted(async () => {
  try {
    const [airportsData, operatorsData] = await Promise.all([
      AirportsClient.getAirports(),
      AirportsClient.getOperators(),
    ]);
    airports.value = airportsData.sort(
      (a: { PriorityOrder: number }, b: { PriorityOrder: number }) =>
        a.PriorityOrder - b.PriorityOrder
    );
    operators.value = operatorsData;

    if (sortableList.value) {
      Sortable.create(sortableList.value, {
        onEnd: async (event: { oldIndex: number; newIndex: any }) => {
          if (
            typeof event.oldIndex === "number" &&
            typeof event.newIndex === "number"
          ) {
            const movedItem = airports.value[event.oldIndex];
            const newIndex = event.newIndex;
            const updatedAirports = [...airports.value];

            updatedAirports.splice(event.oldIndex, 1);
            updatedAirports.splice(newIndex, 0, movedItem);

            updatedAirports.forEach((airport, index) => {
              airport.PriorityOrder = index + 1;
            });

            try {
              await AirportsClient.updatePriorities({
                airports: updatedAirports.map(({ id, PriorityOrder }) => ({
                  airportId: id,
                  priorityOrder: PriorityOrder,
                })),
              });
              airports.value = updatedAirports;
            } catch (error) {
              console.error("Error updating priorities:", error);
            }
          } else {
            console.error("Invalid indices:", event.oldIndex, event.newIndex);
          }
        },
      });
    }
  } catch (error) {
    console.error("Error fetching data:", error);
  }
});

const openSelect = (airportId: number) => {
  selectedAirportId.value =
    selectedAirportId.value === airportId ? null : airportId;
};

const changeOperator = async (airportId: number, newOperatorId: number) => {
  if (newOperatorId !== null) {
    try {
      await AirportsClient.moveAirport({
        airportId,
        newOperatorId,
      });
      await fetchAirports();
      selectedAirportId.value = null;
    } catch (error) {
      console.error("Error changing operator:", error);
    }
  }
};

const fetchAirports = async () => {
  try {
    const data = await AirportsClient.getAirports();
    airports.value = data.sort((a, b) => a.PriorityOrder - b.PriorityOrder);
  } catch (error) {
    console.error("Error fetching airports:", error);
  }
};
</script>
