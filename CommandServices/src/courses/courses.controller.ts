import { Controller } from '@nestjs/common';
import { CommandBus } from '@nestjs/cqrs';
import { MessagePattern } from '@nestjs/microservices';
import { Courses } from 'src/database/entities/Courses.entity';
import { CreateCourseDto } from './dto/createCourse.dto';
import {
	CreateCourseCommand,
	UpdateCourseCommand,
} from './commands/course.command';
import { UpdateCourseDto } from './dto/updateCourse.dto';

@Controller()
export class CoursesController {
	constructor(private readonly commandbus: CommandBus) {}

	@MessagePattern({ cmd: 'create_course' })
	async createCourse(createCourseDto: CreateCourseDto): Promise<Courses> {
		return await this.commandbus.execute(
			new CreateCourseCommand(createCourseDto),
		);
	}
	@MessagePattern({ cmd: 'update_course' })
	async updateCourse(updateCourseDto: UpdateCourseDto): Promise<Courses> {
		console.log('update course');
		return await this.commandbus.execute(
			new UpdateCourseCommand(updateCourseDto),
		);
	}
}

