import { Controller } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { MessagePattern } from '@nestjs/microservices';
import { CreateTraceCourseDTO } from './dto/createCoursesTrace.dto';
import {
	CreateTraceCourseCommand,
	UpdateTraceCourseCommand,
} from './commands/courses-trace.commands';

@Controller()
export class CourseTraceController {
	constructor(
		private readonly querybus: QueryBus,
		private readonly commandbus: CommandBus,
	) {}

	@MessagePattern({ cmd: 'create_trace_courses' })
	async createTraceCourse(
		createTraceCoursesDto: CreateTraceCourseDTO,
	): Promise<any> {
		return await this.commandbus.execute(
			new CreateTraceCourseCommand(createTraceCoursesDto),
		);
	}

	@MessagePattern({ cmd: 'update_trace_courses' })
	async updateTraceCourse(payload: {
		id: string;
		data: CreateTraceCourseDTO;
	}): Promise<any> {
		return await this.commandbus.execute(
			new UpdateTraceCourseCommand(payload.data, payload.id),
		);
	}
}

