import { Module } from '@nestjs/common';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DemoModule } from './demo/demo.module';
import { FirebaseAdmin } from 'firebase.setup';

@Module({
	imports: [
		DemoModule,
		ClientsModule.register([
			{
				name: 'COURSES_SERVICE',
				transport: Transport.TCP,
				options: {
					host: 'localhost',
					port: 3001,
				},
			},
		]),
	],
	controllers: [AppController],
	providers: [AppService],
})
export class AppModule {}

