import { Controller, Inject, Get, Param, Query } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';

@Controller('tutorials')
export class TutorialsController {
	constructor(
		@Inject('COURSES_SERVICE')
		private readonly coursesServiceClient: ClientProxy,
	) {}

	@Get(':id')
	async getById(@Param('id') id) {
		return this.coursesServiceClient.send({ cmd: 'get_tutorial' }, id);
	}
	@Get()
	async getByCourseId(@Query('sectionId') sectionId) {
		return this.coursesServiceClient.send(
			{ cmd: 'get_tutorials_by_sectionId' },
			sectionId,
		);
	}
}

