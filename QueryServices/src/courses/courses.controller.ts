import { Controller } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { MessagePattern } from '@nestjs/microservices';
import { Chapters } from 'src/database/entities/Chapters.entity';
import { Courses } from 'src/database/entities/Courses.entity';
import {
	GetChapterByTutorialId,
	GetChaptersQuery,
	GetCourseByIdQuery,
	GetCoursesQuery,
} from './queries/courses.queries';

@Controller()
export class CoursesController {
	constructor(
		private readonly querybus: QueryBus,
		private readonly commandbus: CommandBus,
	) {}

	@MessagePattern({ cmd: 'get_all_courses' })
	async allCourse(): Promise<Courses[]> {
		console.log('this shit');
		return await this.querybus.execute(new GetCoursesQuery());
	}

	@MessagePattern({ cmd: 'get_course' })
	async getCourse(courseId: string): Promise<Courses> {
		return await this.querybus.execute(new GetCourseByIdQuery(courseId));
	}

	// @MessagePattern({ cmd: 'get_chapter' })
	// async getChapter(chapterId: string): Promise<Chapters> {
	// 	console.log('get chapter');
	// 	return await this.querybus.execute(new GetChaptersQuery(chapterId));
	// }

	// @MessagePattern({ cmd: 'get_chapters_by_tutorialId' })
	// async getChapterByTutorialId(tutorialId: string): Promise<Chapters[]> {
	// 	return await this.querybus.execute(
	// 		new GetChapterByTutorialId(tutorialId),
	// 	);
	// }
}

