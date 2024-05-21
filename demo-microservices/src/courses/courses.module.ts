import { Module } from '@nestjs/common';
import { coursesProviders } from './courses.providers';
import { CoursesService } from './courses.service';
import { DatabaseModule } from 'src/database/database.module';
import { CoursesController } from './courses.controller';

@Module({
	imports: [DatabaseModule],
	providers: [...coursesProviders, CoursesService],
	controllers: [CoursesController],
})
export class CoursesModule {}
