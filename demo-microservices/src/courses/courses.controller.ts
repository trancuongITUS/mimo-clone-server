import { Controller } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { MessagePattern } from '@nestjs/microservices';
import { Chapters } from 'src/database/entities/Chapters.entity';
import { Courses } from 'src/database/entities/Courses.entity';
import { Tutorials } from 'src/database/entities/Tutorials.entity';
import { GetChaptersQuery, GetCourseByIdQuery, GetCoursesQuery, GetTutorialsQuery } from './queries/courses.queries';
import { CreateCourseDto } from './dto/createCourse.dto';
import { CreateCourseCommand } from './commands/course.command';

@Controller()
export class CoursesController {
	constructor(
		private readonly querybus: QueryBus,
		private readonly commandbus: CommandBus
	) {}

	@MessagePattern({ cmd: 'get_all_courses' })
	async allCourse(): Promise<Courses[]> {
		console.log("this shit");
		return await this.querybus.execute(new GetCoursesQuery);
	}

	@MessagePattern({ cmd: 'get_course' })
	async getCourse(courseId: string): Promise<Courses> {
		return await this.querybus.execute(new GetCourseByIdQuery(courseId));
	}

	@MessagePattern({ cmd: 'create_course' })
	async createCourse(createCourseDto: CreateCourseDto): Promise<Courses> {
		console.log("create course");
		return await this.commandbus.execute(new CreateCourseCommand(createCourseDto));
	}

	@MessagePattern({ cmd: 'get_chapter' })
	async getChapter(chapterId: string): Promise<Chapters> {
		console.log("get chapter")
		return await this.querybus.execute(new GetChaptersQuery(chapterId));
	}


	@MessagePattern({ cmd: 'get_tutorial' })
	async getTutorial(tutorialId: string): Promise<Tutorials> {
		return await this.querybus.execute(new GetTutorialsQuery(tutorialId));
	}
}
