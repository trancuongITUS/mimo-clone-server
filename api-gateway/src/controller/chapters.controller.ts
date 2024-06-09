import { Controller, Inject, Get, Param, Query, Post, Body, Put } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { CreateChapterDto } from 'src/dto/request/createChapter.dto';
import { UpdateChapterDto } from 'src/dto/request/updateChapter.dto';

@Controller('chapters')
export class ChaptersController {
	constructor(
		@Inject('QUERY_SERVICE')
		private readonly coursesQueryClient: ClientProxy,
		@Inject('COMMAND_SERVICE')
		private readonly coursesCommandClient: ClientProxy,
	) {}

	@Get(':id')
	async getById(@Param('id') id) {
		return this.coursesQueryClient.send({ cmd: 'get_chapter' }, id);
	}

	@Get()
	async getChapterByTutorialId(@Query('tutorialId') tutorialId) {
		return this.coursesQueryClient.send(
			{ cmd: 'get_chapters_by_tutorialId' },
			tutorialId,
		);
	}

	@Post()
	async createChapter(@Body() createChapterDto: CreateChapterDto): Promise<any> {
		return this.coursesCommandClient.send(
			{ cmd: 'create_chapter' },
			createChapterDto,
		);
	}

	@Put(':id')
	async updateChapter(@Param('id') id,@Body() updateChapterDto: UpdateChapterDto): Promise<any> {
		updateChapterDto.chapterId=id;
		return this.coursesCommandClient.send(
			{ cmd: 'update_chapter' },
		 updateChapterDto,
		);
	}
}

