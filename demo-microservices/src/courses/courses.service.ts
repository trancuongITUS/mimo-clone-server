import { Inject, Injectable } from '@nestjs/common';
import { Chapters } from 'src/database/entities/Chapters.entity';
import { Courses } from 'src/database/entities/Courses.entity';
import { Files } from 'src/database/entities/Files.entity';
import { Sections } from 'src/database/entities/Sections.entity';
import { Tutorials } from 'src/database/entities/Tutorials.entity';
import { Repository } from 'typeorm';

@Injectable()
export class CoursesService {
	constructor(
		@Inject('COURSES_REPOSITORY')
		private coursesRepository: Repository<Courses>,
		@Inject('CHAPTERS_REPOSITORY')
		private chaptersRepository: Repository<Chapters>,
		@Inject('SECTIONS_REPOSITORY')
		private sectionsRepository: Repository<Sections>,
		@Inject('TUTORIALS_REPOSITORY')
		private tutorialsRepository: Repository<Tutorials>,
	) {}

	async getAll(): Promise<Courses[]> {
		// return this.coursesRepository
		// .createQueryBuilder("courses")
		// .leftJoinAndSelect("courses.sections", "sections")
		// .leftJoinAndSelect("sections.tutorials", "tutorials")
		// .leftJoinAndSelect("tutorials.chapters", "chapters")
		// .leftJoinAndSelect("chapters.lessons", "lessons")
		// .leftJoinAndSelect("lessons.interactionModules", "interaction_module")
		// .leftJoinAndSelect("lessons.prePostInteractionModules", "pre_post_interaction_modules")
		// .leftJoinAndSelect("interaction_module.files", "files")
		// .leftJoinAndSelect("interaction_module.interactionOptions", "interaction_option")
		// .leftJoinAndSelect("interaction_module.items", "items")
		// .leftJoinAndSelect("pre_post_interaction_modules.files", "files")
		// .getMany();

		return this.coursesRepository
			.createQueryBuilder('courses')
			.leftJoinAndSelect('courses.sections', 'sections')
			.leftJoinAndSelect('sections.tutorials', 'tutorials')
			.leftJoinAndSelect('tutorials.chapters', 'chapters')
			.leftJoinAndSelect('chapters.lessons', 'lessons')
			.leftJoinAndSelect(
				'lessons.interactionModules',
				'interaction_module',
			)
			.leftJoinAndSelect('interaction_module.files', 'interaction_files')
			.leftJoinAndSelect(
				'interaction_module.interactionOptions',
				'interaction_option',
			)
			.leftJoinAndSelect('interaction_module.items', 'items')
			.leftJoinAndSelect(
				'lessons.prePostInteractionModules',
				'pre_post_interaction_modules',
			)
			.leftJoinAndSelect(
				'pre_post_interaction_modules.files',
				'pre_post_files',
			)
			.getMany();
	}

	async getById(courseId: string): Promise<Courses> {
		return this.coursesRepository
			.createQueryBuilder('courses')
			.leftJoinAndSelect('courses.sections', 'sections')
			.leftJoinAndSelect('sections.tutorials', 'tutorials')
			.leftJoinAndSelect('tutorials.chapters', 'chapters')
			.leftJoinAndSelect('chapters.lessons', 'lessons')
			.leftJoinAndSelect(
				'lessons.interactionModules',
				'interaction_module',
			)
			.leftJoinAndSelect('interaction_module.files', 'interaction_files')
			.leftJoinAndSelect(
				'interaction_module.interactionOptions',
				'interaction_option',
			)
			.leftJoinAndSelect('interaction_module.items', 'items')
			.leftJoinAndSelect(
				'lessons.prePostInteractionModules',
				'pre_post_interaction_modules',
			)
			.leftJoinAndSelect(
				'pre_post_interaction_modules.files',
				'pre_post_files',
			)
			.where('courses.id= :id', { id: courseId })
			.getOne();
	}

	async getChapter(chapterId: string): Promise<Chapters> {
		return this.chaptersRepository
			.createQueryBuilder('chapters')
			.leftJoinAndSelect('chapters.lessons', 'lessons')
			.leftJoinAndSelect(
				'lessons.interactionModules',
				'interaction_module',
			)
			.leftJoinAndSelect('interaction_module.files', 'interaction_files')
			.leftJoinAndSelect(
				'interaction_module.interactionOptions',
				'interaction_option',
			)
			.leftJoinAndSelect('interaction_module.items', 'items')
			.leftJoinAndSelect(
				'lessons.prePostInteractionModules',
				'pre_post_interaction_modules',
			)
			.leftJoinAndSelect(
				'pre_post_interaction_modules.files',
				'pre_post_files',
			)
			.where('chapters.id= :id', { id: chapterId })
			.getOne();
	}

	async getChapterByByTutorialId(tutorialId: string): Promise<Chapters[]> {
		return this.chaptersRepository
			.createQueryBuilder('chapters')
			.leftJoinAndSelect('chapters.lessons', 'lessons')
			.leftJoinAndSelect(
				'lessons.interactionModules',
				'interaction_module',
			)
			.leftJoinAndSelect('interaction_module.files', 'interaction_files')
			.leftJoinAndSelect(
				'interaction_module.interactionOptions',
				'interaction_option',
			)
			.leftJoinAndSelect('interaction_module.items', 'items')
			.leftJoinAndSelect(
				'lessons.prePostInteractionModules',
				'pre_post_interaction_modules',
			)
			.leftJoinAndSelect(
				'pre_post_interaction_modules.files',
				'pre_post_files',
			)
			.where('tutorial_id= :id', { id: tutorialId })
			.getMany();
	}

	async getSectionByCourseId(courseId: string): Promise<Sections[]> {
		return this.sectionsRepository
			.createQueryBuilder('sections')
			.leftJoinAndSelect('sections.tutorials', 'tutorials')
			.leftJoinAndSelect('tutorials.chapters', 'chapters')
			.leftJoinAndSelect('chapters.lessons', 'lessons')
			.leftJoinAndSelect(
				'lessons.interactionModules',
				'interaction_module',
			)
			.leftJoinAndSelect('interaction_module.files', 'interaction_files')
			.leftJoinAndSelect(
				'interaction_module.interactionOptions',
				'interaction_option',
			)
			.leftJoinAndSelect('interaction_module.items', 'items')
			.leftJoinAndSelect(
				'lessons.prePostInteractionModules',
				'pre_post_interaction_modules',
			)
			.leftJoinAndSelect(
				'pre_post_interaction_modules.files',
				'pre_post_files',
			)
			.where('sections.course_id= :id', { id: courseId })
			.getMany();
	}

	async getSection(sectionId: string): Promise<Sections> {
		return this.sectionsRepository
			.createQueryBuilder('sections')
			.leftJoinAndSelect('sections.tutorials', 'tutorials')
			.leftJoinAndSelect('tutorials.chapters', 'chapters')
			.leftJoinAndSelect('chapters.lessons', 'lessons')
			.leftJoinAndSelect(
				'lessons.interactionModules',
				'interaction_module',
			)
			.leftJoinAndSelect('interaction_module.files', 'interaction_files')
			.leftJoinAndSelect(
				'interaction_module.interactionOptions',
				'interaction_option',
			)
			.leftJoinAndSelect('interaction_module.items', 'items')
			.leftJoinAndSelect(
				'lessons.prePostInteractionModules',
				'pre_post_interaction_modules',
			)
			.leftJoinAndSelect(
				'pre_post_interaction_modules.files',
				'pre_post_files',
			)
			.where('sections.id= :id', { id: sectionId })
			.getOne();
	}

	async getTutorial(tutorialId: string): Promise<Tutorials> {
		return await this.tutorialsRepository
			.createQueryBuilder('tutorials')
			.leftJoinAndSelect('tutorials.chapters', 'chapters')
			.leftJoinAndSelect('chapters.lessons', 'lessons')
			.leftJoinAndSelect(
				'lessons.interactionModules',
				'interaction_module',
			)
			.leftJoinAndSelect('interaction_module.files', 'interaction_files')
			.leftJoinAndSelect(
				'interaction_module.interactionOptions',
				'interaction_option',
			)
			.leftJoinAndSelect('interaction_module.items', 'items')
			.leftJoinAndSelect(
				'lessons.prePostInteractionModules',
				'pre_post_interaction_modules',
			)
			.leftJoinAndSelect(
				'pre_post_interaction_modules.files',
				'pre_post_files',
			)
			.where('tutorials.id= :id', { id: tutorialId })
			.getOne();
	}

	async getTutorialBySectionId(sectionId: string): Promise<Tutorials[]> {
		return await this.tutorialsRepository
			.createQueryBuilder('tutorials')
			.leftJoinAndSelect('tutorials.chapters', 'chapters')
			.leftJoinAndSelect('chapters.lessons', 'lessons')
			.leftJoinAndSelect(
				'lessons.interactionModules',
				'interaction_module',
			)
			.leftJoinAndSelect('interaction_module.files', 'interaction_files')
			.leftJoinAndSelect(
				'interaction_module.interactionOptions',
				'interaction_option',
			)
			.leftJoinAndSelect('interaction_module.items', 'items')
			.leftJoinAndSelect(
				'lessons.prePostInteractionModules',
				'pre_post_interaction_modules',
			)
			.leftJoinAndSelect(
				'pre_post_interaction_modules.files',
				'pre_post_files',
			)
			.where('section_id= :id', { id: sectionId })
			.getMany();
	}
}

