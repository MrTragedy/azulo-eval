import { HTTPClient } from '../http.service';
import type { Airport } from '../../interfaces/IAirport';
import type { UpdatePriorities } from '../../interfaces/IUpdatePriority';
import type { MoveAirport } from '../../interfaces/IMoveAirport';
import type { Operator } from '../../interfaces/IOperator';

export const AirportsClient = new (class AirportsClient extends HTTPClient {
  constructor() {
    super('airports');
  }

  public async getAirports() {
    try {
      const response = await this.http.get<Airport[]>("");
      console.log('Airports data:', response.data); 
      return response.data; 
    } catch (error) {
      console.error('Error fetching airports:', error);
      throw error;
    }
  }


  public async updatePriorities(dto: UpdatePriorities) {
    try {
      const response = await this.http.patch(`/update-priorities`, 
        { airports: dto.airports.map(({ airportId, priorityOrder }) => ({
            airportId,
            priorityOrder
          }))
        }
      );
      return response.data;
    } catch (error) {
      console.error('Error updating priorities:', error);
      throw error;
    }
  }

  public async moveAirport(dto: MoveAirport) {
    try {
      const response = await this.http.patch(`/move`, {
        airportId: dto.airportId,
        newOperatorId: dto.newOperatorId,
      });
      return response.data;
    } catch (error) {
      console.error('Error moving airport:', error);
      throw error;
    }
  }

  public async getOperators() {
    try {
      const response = await this.http.get<{ data: Operator[] }>(import.meta.env.VITE_DIRECTUS_BACKEND + 'items/AirportOperator');
      return response.data.data; 
    } catch (error) {
      console.error('Error fetching operators:', error);
      throw error;
    }
  }
})();

