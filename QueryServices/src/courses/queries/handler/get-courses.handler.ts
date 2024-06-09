import { IQueryHandler, QueryHandler } from '@nestjs/cqrs';
import {
	GetChapterByTutorialId,
	GetChaptersQuery,
	GetCourseByIdQuery,
	GetCoursesQuery,
	GetTraceCourses,
	GetTutorialsQuery,
} from '../courses.queries';
import { Repository } from 'typeorm';
import { Courses } from 'src/database/entities/Courses.entity';
import { Inject } from '@nestjs/common';
import { Chapters } from 'src/database/entities/Chapters.entity';
import { Sections } from 'src/database/entities/Sections.entity';
import { Tutorials } from 'src/database/entities/Tutorials.entity';
import { UserCourseTraces } from 'src/database/entities/UserCourseTraces.entity';

@QueryHandler(GetCoursesQuery)
export class GetCoursesHandler implements IQueryHandler<GetCoursesQuery> {
	constructor(
		@Inject('COURSES_REPOSITORY')
		private readonly repository: Repository<Courses>,
	) {}

	async execute(query: GetCoursesQuery): Promise<Courses[]> {
		return this.repository
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
}

@QueryHandler(GetCourseByIdQuery)
export class GetCourseByIdHandler implements IQueryHandler<GetCourseByIdQuery> {
	constructor(
		@Inject('COURSES_REPOSITORY')
		private readonly repository: Repository<Courses>,
	) {}

	async execute(query: GetCourseByIdQuery): Promise<Courses> {
		return this.repository
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
			.where('courses.id= :id', { id: query.courseId })
			.getOne();
	}
}

@QueryHandler(GetChaptersQuery)
export class GetChaptersHandler implements IQueryHandler<GetChaptersQuery> {
	constructor(
		@Inject('CHAPTERS_REPOSITORY')
		private readonly repository: Repository<Chapters>,
	) {}
	execute(query: GetChaptersQuery): Promise<Chapters> {
		return this.repository
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
			.where('chapters.id= :id', { id: query.chapterId })
			.getOne();
	}
}

@QueryHandler(GetChapterByTutorialId)
export class GetChapterByByTutorialIdHandler
	implements IQueryHandler<GetChapterByTutorialId>
{
	constructor(
		@Inject('CHAPTERS_REPOSITORY')
		private readonly repository: Repository<Chapters>,
	) {}
	execute(query: GetChapterByTutorialId): Promise<Chapters[]> {
		return this.repository
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
			.where('tutorial_id= :id', { id: query.tutorialId })
			.getMany();
	}
}

@QueryHandler(GetTraceCourses)
export class GetTraceCoursesHandler implements IQueryHandler<GetTraceCourses> {
	constructor(
		@Inject('USER_COURSE_TRACES_REPOSITORY')
		private readonly repository: Repository<UserCourseTraces>,
	) {}
	execute(query: GetTraceCourses): Promise<UserCourseTraces> {
		return this.repository
			.createQueryBuilder('user_course_trace')
			.where('course_id= :id AND user_uid= :userId', {
				id: query.courseId,
				userId: query.userId,
			})
			.getOne();
	}
}

