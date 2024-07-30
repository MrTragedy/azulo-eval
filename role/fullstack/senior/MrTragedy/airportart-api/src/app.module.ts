import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { AirportsModule } from './airports/airports.module';
import { HttpModule } from '@nestjs/axios';
import { AirportOperatorsModule } from './airport-operators/airport-operators.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    HttpModule,
    AirportsModule,
    AirportOperatorsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
