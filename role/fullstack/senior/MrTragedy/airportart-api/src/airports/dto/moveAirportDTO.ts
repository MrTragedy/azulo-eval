import { IsNotEmpty, IsNumber } from 'class-validator';

export class MoveAirportDTO {
  @IsNotEmpty()
  @IsNumber()
  airportId: number;

  @IsNotEmpty()
  @IsNumber()
  newOperatorId: number;
}
