import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { AirportsService } from './airports.service';
import { MoveAirportDTO } from './dto/moveAirportDTO';
import { UpdatePrioritiesDTO } from './dto/airportPriorityDTO';

@Controller('airports')
export class AirportsController {
  constructor(private readonly airportsService: AirportsService) {}


  @Get()
  async findAll() {
   try {
    const response = await this.airportsService.findAll();
    return response.data;
   } catch (error) {
    console.log(error);
   }
  }

  @Patch('move')
  async moveAirport(@Body() moveAirportDto: MoveAirportDTO) {
    return this.airportsService.moveAirport(moveAirportDto);
  }

  @Patch('update-priorities')
  async updatePriorities(@Body() updatePrioritiesDto: UpdatePrioritiesDTO) {
    return this.airportsService.updatePriorities(updatePrioritiesDto);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.airportsService.findOne(+id);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.airportsService.remove(+id);
  }
}
