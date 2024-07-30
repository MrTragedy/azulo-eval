import { Type } from "class-transformer";
import { IsArray, IsNotEmpty, IsNumber, ValidateNested } from "class-validator";

class AirportPriorityDTO {

    @IsNotEmpty()
    @IsNumber()
    airportId: number;

    @IsNotEmpty()
    @IsNumber()
    priorityOrder: number;
}

export class UpdatePrioritiesDTO {
    @IsArray()
    @ValidateNested({ each: true})
    @Type(() => AirportPriorityDTO)
    airports: AirportPriorityDTO[];
}