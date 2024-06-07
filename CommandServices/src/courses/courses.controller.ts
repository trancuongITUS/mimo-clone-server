import { Controller } from '@nestjs/common';
import { CommandBus } from '@nestjs/cqrs';
import { MessagePattern } from '@nestjs/microservices';
import { Courses } from 'src/database/entities/Courses.entity';
import { CreateCourseDto } from './dto/createCourse.dto';
import { CreateCourseCommand } from './commands/course.command';

@Controller()
export class CoursesController {
	constructor(private readonly commandbus: CommandBus) {}

	@MessagePattern({ cmd: 'create_course' })
	async createCourse(createCourseDto: CreateCourseDto): Promise<Courses> {
		return await this.commandbus.execute(
			new CreateCourseCommand(createCourseDto),
		);
	}
}

