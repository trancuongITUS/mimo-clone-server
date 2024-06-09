import { IQueryHandler, QueryHandler } from '@nestjs/cqrs';
import {
	GetChapterByTutorialId,
	GetChaptersQuery,
} from '../chapters.queries';
import { Repository } from 'typeorm';
import { Inject } from '@nestjs/common';
import { Chapters } from 'src/database/entities/Chapters.entity';


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

