import { Module } from "@nestjs/common";
import { DatabaseModule } from "src/database/database.module";
import { CoursesController } from "./courses.controller";
import { GetChaptersHandler, GetCourseByIdHandler, GetCoursesHandler} from "./queries/handler/get-courses.handler";
import { coursesProviders } from "./courses.providers";
import { CqrsModule } from "@nestjs/cqrs";

import { CreateCourseHandler } from "./commands/handler/create-course.handler";
import { CourseCreatedEvent } from "./event/courses.event";
import { CourseCreatedHandler } from "./event/handler/course-created.handler";

export const CommandHandlers = [CreateCourseHandler];
export const QueryHandlers =  [
	GetCoursesHandler,
	GetCourseByIdHandler,
	GetChaptersHandler,
];
export const EventHandlers = [CourseCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...coursesProviders,
		...CommandHandlers,
		...QueryHandlers,
		...EventHandlers
	],
	controllers: [CoursesController],
})
export class CoursesCQRSModule {}
