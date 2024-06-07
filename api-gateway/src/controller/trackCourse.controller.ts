import {
	Body,
	Controller,
	Get,
	Inject,
	Param,
	Post,
	Put,
	Req,
} from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { Auth } from 'src/decorators/auth.decorator';
import { CreateTraceCourseDTO } from 'src/dto/request/createTraceCourse.dto';

@Controller('trace-course')
export class TraceCourseController {
	constructor(
		@Inject('QUERY_SERVICE')
		private readonly traceCourseQueryServiceClient: ClientProxy,
		@Inject('COMMAND_SERVICE')
		private readonly traceCourseCommandServiceClient: ClientProxy,
	) {}

	@Get(':courseId')
	@Auth('user')
	async getTraceCourse(
		@Param('courseId') courseId,
		@Req() req: any,
	): Promise<any> {
		return this.traceCourseQueryServiceClient.send(
			{ cmd: 'get_trace_courses' },
			{ courseId, userId: req.user.uid },
		);
	}

	@Post()
	@Auth('user')
	async createTraceCourse(
		@Req() req: any,
		@Body() body: CreateTraceCourseDTO,
	): Promise<any> {
		return this.traceCourseCommandServiceClient.send(
			{ cmd: 'create_trace_courses' },
			{
				...body,
				userId: req.user.uid,
			},
		);
	}

	@Put(':id')
	@Auth('user')
	async updateTraceCourse(
		@Req() req: any,
		@Body() body: CreateTraceCourseDTO,
		@Param(':id') id: string,
	): Promise<any> {
		return this.traceCourseCommandServiceClient.send(
			{ cmd: 'update_trace_courses' },
			{
				id,
				data: {
					...body,
					userId: req.user.uid,
				},
			},
		);
	}
}

