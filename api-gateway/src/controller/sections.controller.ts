import {
	Body,
	Controller,
	Get,
	Inject,
	Param,
	Post,
	Query,
} from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { CreateSectionDto } from 'src/dto/request/createSection.dto';

@Controller('sections')
export class SectionsController {
	constructor(
		@Inject('QUERY_SERVICE')
		private readonly coursesQueryClient: ClientProxy,
		@Inject('COMMAND_SERVICE')
		private readonly coursesCommandClient: ClientProxy,
	) {}

	@Get(':id')
	async getById(@Param('id') id) {
		return this.coursesQueryClient.send({ cmd: 'get_section' }, id);
	}

	@Get()
	async getByCourseId(@Query('courseId') courseId) {
		return this.coursesQueryClient.send(
			{ cmd: 'get_section_by_courseId' },
			courseId,
		);
	}

	@Post()
	async createSection(
		@Body() createSectionDto: CreateSectionDto,
	): Promise<any> {
		return this.coursesCommandClient.send(
			{ cmd: 'create_section' },
			createSectionDto,
		);
	}
}

