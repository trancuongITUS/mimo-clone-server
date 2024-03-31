import { NestFactory } from '@nestjs/core';
import { Transport, MicroserviceOptions } from '@nestjs/microservices';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';

async function bootstrap() {
  const appConfig = await NestFactory.create(AppModule);
  const app = await appConfig.connectMicroservice<MicroserviceOptions>({
    transport: Transport.TCP,
    options: {
      port: appConfig.get(ConfigService).get('PORT'),
    },
  });
  await app.listen();
}
bootstrap();
