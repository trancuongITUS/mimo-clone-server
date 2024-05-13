import { NestFactory } from '@nestjs/core';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';
import { AppModule } from './app.module';
import configuration from './configuration/configuration';

async function bootstrap() {
	const config = configuration();
	const app = await NestFactory.createMicroservice<MicroserviceOptions>(
		AppModule,
		{
			transport: Transport.TCP,
			options: {
				port: config.port,
			},
		},
	);

	await app.listen();
}

bootstrap();
