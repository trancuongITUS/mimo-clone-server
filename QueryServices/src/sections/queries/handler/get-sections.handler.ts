import { Inject } from '@nestjs/common';
import { QueryHandler, IQueryHandler } from '@nestjs/cqrs';
import { Sections } from 'src/database/entities/Sections.entity';
import { Repository } from 'typeorm';
import {
	GetSectionsByCourseIdQuery,
	GetSectionsQuery,
} from '../sections.query';

@QueryHandler(GetSectionsQuery)
export class GetSectionsHandler implements IQueryHandler<GetSectionsQuery> {
	constructor(
		@Inject('SECTIONS_REPOSITORY')
		private readonly repository: Repository<Sections>,
	) {}
	execute(query: GetSectionsQuery): Promise<Sections> {
		return this.repository
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
			.where('sections.id= :id', { id: query.sectionId })
			.getOne();
	}
}

@QueryHandler(GetSectionsByCourseIdQuery)
export class GetSectionsByCourseIdHandler
	implements IQueryHandler<GetSectionsByCourseIdQuery>
{
	constructor(
		@Inject('SECTIONS_REPOSITORY')
		private readonly repository: Repository<Sections>,
	) {}
	execute(query: GetSectionsByCourseIdQuery): Promise<Sections[]> {
		return this.repository
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
			.where('sections.course_id= :id', { id: query.courseId })
			.getMany();
	}
}

