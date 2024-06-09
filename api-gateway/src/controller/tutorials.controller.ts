import {
	Controller,
	Inject,
	Get,
	Param,
	Body,
	Post,
	Query,
	Put,
} from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { CreateTutorialDto } from 'src/dto/request/createTutorial.dto';
import { UpdateTutorialDto } from 'src/dto/request/updateTutorial.dto';

@Controller('tutorials')
export class TutorialsController {
	constructor(
		@Inject('QUERY_SERVICE')
		private readonly coursesQueryClient: ClientProxy,
		@Inject('COMMAND_SERVICE')
		private readonly coursesCommandClient: ClientProxy,
	) {}

	@Get(':id')
	async getById(@Param('id') id) {
		return this.coursesQueryClient.send({ cmd: 'get_tutorial' }, id);
	}

	@Get()
	async getBySectionId(@Query('sectionId') sectionId) {
		return this.coursesQueryClient.send(
			{ cmd: 'get_tutorials_by_sectionId' },
			sectionId,
		);
	}

	@Post()
	async createTutorial(
		@Body() createTutorialDto: CreateTutorialDto,
	): Promise<any> {
		return this.coursesCommandClient.send(
			{ cmd: 'create_tutorial' },
			createTutorialDto,
		);
	}
	
	@Put(':id')
	async updateTutorial(
		@Param('id') id,
		@Body() updateTutorialDto: UpdateTutorialDto,
	): Promise<any> {
		updateTutorialDto.tutorialId=id;
		return this.coursesCommandClient.send(
			{ cmd: 'update_tutorial' },
			updateTutorialDto,
		);
	}



}

