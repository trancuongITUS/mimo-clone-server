import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DemoModule } from './demo/demo.module';
import { ConfigModule } from '@nestjs/config';
import configuration from './configuration/configuration';
import { DatabaseModule } from './database/database.module';
import { CoursesController } from './courses/courses.controller';
import { CoursesService } from './courses/courses.service';
import { CoursesModule } from './courses/courses.module';

@Module({
	imports: [
		CoursesModule,
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
