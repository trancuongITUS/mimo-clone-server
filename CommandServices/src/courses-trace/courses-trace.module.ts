import { Module } from '@nestjs/common';
import { CqrsModule } from '@nestjs/cqrs';
import { DatabaseModule } from 'src/database/database.module';
import { CreateTraceCourseHandler } from './commands/handler/create-courses-trace.handler';
import { coursesTraceProvider } from './courses-trace.provider';
import { CourseTraceController } from './courses-trace.controller';
import { UpdateTraceCourseHandler } from './commands/handler/update-courses-trace.handler';
export const CommandHandlers = [
	CreateTraceCourseHandler,
	UpdateTraceCourseHandler,
];

@Module({
	imports: [DatabaseModule, CqrsModule],
	providers: [...coursesTraceProvider, ...CommandHandlers],
	controllers: [CourseTraceController],
})
export class CoursesTraceModule {}

