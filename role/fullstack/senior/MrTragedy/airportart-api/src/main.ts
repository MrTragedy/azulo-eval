import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors({
    origin: process.env.CORS_ALLOWED_ORIGIN || '*',
    allowedHeaders: process.env.CORS_ALLOWED_HEADERS || '*',
  });
  await app.listen(process.env.SERVER_PORT || 3000);
}
bootstrap();
