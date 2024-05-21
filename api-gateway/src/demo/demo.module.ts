import { Module } from '@nestjs/common';
import { DemoController } from './demo.controller';
import { DemoService } from './demo.service';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { ChaptersController } from '../controller/chapters.controller';
import { SectionsController } from '../controller/sections.controller';
import { TutorialsController } from '../controller/tutorials.controller';
import { CoursesController } from '../controller/courses.controller';
import { AuthController } from 'src/controller/auth.controller';
import { FirebaseAuthService } from 'src/service/auth.service';
import { HttpModule } from '@nestjs/axios';

@Module({
	imports: [
		ClientsModule.register([
			{
				name: 'DEMO-SERVICE',
				transport: Transport.TCP,
				options: {
					host: 'localhost',
					port: 3000,
				},
			},
			{
				name: 'COURSES_SERVICE',
				transport: Transport.TCP,
				options: {
					host: 'localhost',
					port: 3001,
				},
			},
		]),
		HttpModule,
	],
	controllers: [
		DemoController,
		CoursesController,
		ChaptersController,
		SectionsController,
		TutorialsController,
		AuthController,
	],
	providers: [DemoService, FirebaseAuthService],
})
export class DemoModule {}

