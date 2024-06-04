import { Controller, Inject, Get, Param, Query } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';

@Controller('chapters')
export class ChaptersController {
	constructor(
		@Inject('COURSES_SERVICE')
		private readonly coursesServiceClient: ClientProxy,
	) {}

	@Get(':id')
	async getById(@Param('id') id) {
		return this.coursesServiceClient.send({ cmd: 'get_chapter' }, id);
	}

	@Get()
	async getChapterByTutorialId(@Query('tutorialId') tutorialId) {
		return this.coursesServiceClient.send(
			{ cmd: 'get_chapters_by_tutorialId' },
			tutorialId,
		);
	}
}

