import { Module } from '@nestjs/common';
import { DatabaseModule } from 'src/database/database.module';
import { CoursesController } from './courses.controller';
import {
	GetChapterByByTutorialIdHandler,
	GetChaptersHandler,
	GetCourseByIdHandler,
	GetCoursesHandler,
	GetTraceCoursesHandler,
} from './queries/handler/get-courses.handler';
import { coursesProviders } from './courses.providers';
import { CqrsModule } from '@nestjs/cqrs';

export const QueryHandlers = [
	GetCoursesHandler,
	GetCourseByIdHandler,
	GetChaptersHandler,
	GetChapterByByTutorialIdHandler,
	GetTraceCoursesHandler,
];

@Module({
	imports: [DatabaseModule, CqrsModule],
	providers: [...coursesProviders, ...QueryHandlers],
	controllers: [CoursesController],
})
export class CoursesCQRSModule {}

