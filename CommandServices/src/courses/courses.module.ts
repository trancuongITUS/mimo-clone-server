import { Module } from "@nestjs/common";
import { DatabaseModule } from "src/database/database.module";
import { CoursesController } from "./courses.controller";
import { coursesProviders } from "./courses.providers";
import { CqrsModule } from "@nestjs/cqrs";

import { CreateCourseHandler } from "./commands/handler/create-course.handler";
import { CourseCreatedHandler } from "./event/handler/course-created.handler";

export const CommandHandlers = [CreateCourseHandler];
export const EventHandlers = [CourseCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...coursesProviders,
		...CommandHandlers,
		...EventHandlers
	],
	controllers: [CoursesController],
})
export class CoursesCQRSModule {}
