import { Inject } from '@nestjs/common';
import { QueryHandler, IQueryHandler } from '@nestjs/cqrs';
import { Tutorials } from 'src/database/entities/Tutorials.entity';
import { Repository } from 'typeorm';
import { GetTutorialsBySectionId, GetTutorialsQuery } from '../tutorials.query';

@QueryHandler(GetTutorialsQuery)
export class GetTutorialsHandler implements IQueryHandler<GetTutorialsQuery> {
	constructor(
		@Inject('TUTORIALS_REPOSITORY')
		private readonly repository: Repository<Tutorials>,
	) {}
	execute(query: GetTutorialsQuery): Promise<Tutorials> {
		return this.repository
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
			.where('tutorials.id= :id', { id: query.tutorialId })
			.getOne();
	}
}

@QueryHandler(GetTutorialsBySectionId)
export class GetTutorialsBySectionIdHandler
	implements IQueryHandler<GetTutorialsBySectionId>
{
	constructor(
		@Inject('TUTORIALS_REPOSITORY')
		private readonly repository: Repository<Tutorials>,
	) {}
	execute(query: GetTutorialsBySectionId): Promise<Tutorials[]> {
		return this.repository
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
			.where('section_id= :id', { id: query.sectionId })
			.getMany();
	}
}
