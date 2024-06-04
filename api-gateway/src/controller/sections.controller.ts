import { Controller, Get, Inject, Param, Query } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';

@Controller('sections')
export class SectionsController {
	constructor(
		@Inject('COURSES_SERVICE')
		private readonly coursesServiceClient: ClientProxy,
	) {}

	@Get(':id')
	async getById(@Param('id') id) {
		return this.coursesServiceClient.send({ cmd: 'get_section' }, id);
	}

	@Get()
	async getByCourseId(@Query('courseId') courseId) {
		return this.coursesServiceClient.send(
			{ cmd: 'get_section_by_courseId' },
			courseId,
		);
	}
}

