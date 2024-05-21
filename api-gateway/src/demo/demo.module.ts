import { Module } from '@nestjs/common';
import { DemoController } from './demo.controller';
import { DemoService } from './demo.service';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { ChaptersController } from '../courses/chapters.controller';
import { SectionsController } from '../courses/sections.controller';
import { TutorialsController } from '../courses/tutorials.controller';
import { CoursesController } from '../courses/courses.controller';

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
	],
	controllers: [
		DemoController,
		CoursesController,
		ChaptersController,
		SectionsController,
		TutorialsController,
	],
	providers: [DemoService],
})
export class DemoModule {}

