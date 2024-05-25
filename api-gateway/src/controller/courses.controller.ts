import { Body, Controller, Get, Inject, Param, Post } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { Auth } from 'src/decorators/auth.decorator';
import { CreateCourseDto } from 'src/dto/request/createCourse.dto';

@Controller('courses')
export class CoursesController {
	constructor(
		@Inject('COURSES_SERVICE')
		private readonly coursesServiceClient: ClientProxy,
	) {}

	@Get()
	@Auth('user')
	async getAll(): Promise<any> {
		return this.coursesServiceClient.send({ cmd: 'get_all_courses' }, {});
	}

	@Get(':id')
	async getById(@Param('id') id) {
		return this.coursesServiceClient.send({ cmd: 'get_course' }, id);
	}

	@Post()
	async createCourse(@Body() createCourseDto: CreateCourseDto): Promise<any> {
		return this.coursesServiceClient.send({ cmd: 'create_course'}, createCourseDto);
	}
}
