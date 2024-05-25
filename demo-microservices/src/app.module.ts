import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import configuration from './configuration/configuration';
import { DatabaseModule } from './database/database.module';
import { CoursesModule } from './courses/courses.module';
import { CoursesCQRSModule } from './courses_cqrs/courses.module';

@Module({
	imports: [
		CoursesCQRSModule,
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

