import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import configuration from './configuration/configuration';
import { DatabaseModule } from './database/database.module';
import { CoursesCQRSModule } from './courses/courses.module';
import { SectionsCQRSModule } from './sections/sections.module';
import { TutorialsCQRSModule } from './tutorials/tutorials.module';

@Module({
	imports: [
		CoursesCQRSModule,
		SectionsCQRSModule,
		TutorialsCQRSModule,
		ConfigModule.forRoot({
			load: [configuration],
			cache: true,
			isGlobal: true,
		}),
		DatabaseModule,
	],
	controllers: [AppController],
	providers: [AppService],
})
export class AppModule {}
