import { Injectable, Logger } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { lastValueFrom } from 'rxjs';
import { ConfigService } from '@nestjs/config';
import { MoveAirportDTO } from './dto/moveAirportDTO';
import { UpdatePrioritiesDTO } from './dto/airportPriorityDTO';

@Injectable()
export class AirportsService {
  private readonly directusApiUrl: string;
  private readonly logger = new Logger(AirportsService.name);

  constructor(
    private readonly httpService: HttpService,
    private readonly configService: ConfigService
  ) {
    this.directusApiUrl = this.configService.get<string>('DIRECTUS_API_URL') + '/items/Airport';

    if (!this.directusApiUrl) {
      throw new Error('DIRECTUS_API_URL is not configured');
    }
  }

  async findAll() {
    try {
      const response = await lastValueFrom(this.httpService.get(this.directusApiUrl + '?fields=*.*'));
      return response.data;
    } catch (error) {
      this.logger.error('Error conectando con Directus:', error.message);
      throw error;
    }
  }

  async moveAirport(dto: MoveAirportDTO) {
    try {
      const response = await lastValueFrom(
        this.httpService.patch(`${this.directusApiUrl}/${dto.airportId}`, {
          AirportOperatorId: dto.newOperatorId,
        })
      );
      return response.data;
    } catch (error) {
      this.logger.error('Error al mover aeropuerto de operador:', error.message);
      throw error;
    }
  }

  async updatePriorities(dto: UpdatePrioritiesDTO) {
    try {
      const { airports } = dto;

      const updatePromises = airports.map(airport => {
        const { airportId, priorityOrder } = airport;
        return lastValueFrom(
          this.httpService.patch(`${this.directusApiUrl}/${airportId}`, {
            PriorityOrder: priorityOrder,  
          })
        );
      });

      const results = await Promise.all(updatePromises);
      return results.map(result => result.data);
    } catch (error) {
      this.logger.error('Error al actualizar prioridades:', error.message);
      throw error;
    }
  }

  findOne(id: number) {
    return `This action returns a #${id} airport`;
  }

  remove(id: number) {
    return `This action removes a #${id} airport`;
  }
}




