import { Module } from "@nestjs/common";
import { DatabaseModule } from "src/database/database.module";
import { CoursesController } from "./courses.controller";
import { GetChaptersHandler, GetCourseByIdHandler, GetCoursesHandler, GetSectionsHandler, GetTurorailsHandler } from "./queries/handler/get-courses.handler";
import { coursesProviders } from "./courses.providers";
import { CqrsModule } from "@nestjs/cqrs";
import { CreateCourseCommand } from "./commands/course.command";
import { CreateCourseHandler } from "./commands/handler/create-course.handler";

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [...coursesProviders,
		GetCoursesHandler,
		GetCourseByIdHandler,
		GetChaptersHandler,
		GetSectionsHandler,
		GetTurorailsHandler,
		CreateCourseHandler],
	controllers: [CoursesController],
})
export class CoursesCQRSModule {}
