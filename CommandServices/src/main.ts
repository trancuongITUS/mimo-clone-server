import { NestFactory } from '@nestjs/core';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';
import { AppModule } from './app.module';
import configuration from './configuration/configuration';
import { connect as connectToEventStore } from './evenstore';

async function bootstrap() {
	const config = configuration();
	const app = await NestFactory.createMicroservice<MicroserviceOptions>(
		AppModule,
		{
			transport: Transport.TCP,
			options: {
				port: 3002,
			},
		},
	);
	//await connectToEventStore();
	await app.listen();
}

bootstrap();

