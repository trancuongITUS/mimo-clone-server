import { Controller } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { MessagePattern } from '@nestjs/microservices';
import { Chapters } from 'src/database/entities/Chapters.entity';
import {
	GetChapterByTutorialId,
	GetChaptersQuery,
} from './queries/chapters.queries';

@Controller()
export class ChaptersController {
	constructor(
		private readonly querybus: QueryBus,
		private readonly commandbus: CommandBus,
	) {}

	@MessagePattern({ cmd: 'get_chapter' })
	async getChapter(chapterId: string): Promise<Chapters> {
		console.log('get chapter');
		return await this.querybus.execute(new GetChaptersQuery(chapterId));
	}

	@MessagePattern({ cmd: 'get_chapters_by_tutorialId' })
	async getChapterByTutorialId(tutorialId: string): Promise<Chapters[]> {
		return await this.querybus.execute(
			new GetChapterByTutorialId(tutorialId),
		);
	}
}

