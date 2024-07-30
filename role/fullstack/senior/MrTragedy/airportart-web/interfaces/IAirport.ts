export interface Airport {
  id: number;
  AirportCode: string;
  Name: string;
  PriorityOrder: number;
  AirportOperatorId: {
    id: number;
    Name: string;
  };
  LocationId: {
    Country: string;
    ProviceOrState: string; 
  };
}