import { Controller } from '@nestjs/common';
import { CoursesService } from './courses.service';
import { Courses } from 'src/database/entities/Courses.entity';
import { MessagePattern } from '@nestjs/microservices';
import { Chapters } from 'src/database/entities/Chapters.entity';
import { Sections } from 'src/database/entities/Sections.entity';
import { Tutorials } from 'src/database/entities/Tutorials.entity';

@Controller()
export class CoursesController {
	constructor(private readonly coursesService: CoursesService) {}

	@MessagePattern({ cmd: 'get_all_courses' })
	async newBook(): Promise<Courses[]> {
		return await this.coursesService.getAll();
	}

	@MessagePattern({ cmd: 'get_course' })
	async getBook(courseId: string): Promise<Courses> {
		return await this.coursesService.getById(courseId);
	}

	@MessagePattern({ cmd: 'get_chapter' })
	async getChapter(chapterId: string): Promise<Chapters> {
		return await this.coursesService.getChapter(chapterId);
	}

	@MessagePattern({ cmd: 'get_section' })
	async getSection(sectionId: string): Promise<Sections> {
		return await this.coursesService.getSection(sectionId);
	}

	@MessagePattern({ cmd: 'get_tutorial' })
	async getTutorial(tutorialId: string): Promise<Tutorials> {
		return await this.coursesService.getTutorial(tutorialId);
	}
}
