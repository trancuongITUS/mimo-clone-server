import {
	Body,
	Controller,
	Get,
	Inject,
	Param,
	Post,
	Put,
	Query,
} from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { CreateSectionDto } from 'src/dto/request/createSection.dto';
import { UpdateSectionDto } from 'src/dto/request/updateSection.dto';

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

	@Put(':id')
	async updateSection(@Param('id') id, @Body() updateSectionDto: UpdateSectionDto): Promise<any> {
		updateSectionDto.sectionId=id;
		return this.coursesCommandClient.send(
			{ cmd: 'update_section' },
			updateSectionDto
		);
	}

}

