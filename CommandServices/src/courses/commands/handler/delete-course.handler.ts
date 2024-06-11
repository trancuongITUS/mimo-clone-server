import { CommandHandler, EventBus, ICommandHandler } from '@nestjs/cqrs';
import { DeleteCourseCommand } from '../course.command';
import { Inject } from '@nestjs/common';
import { Courses } from 'src/database/entities/Courses.entity';
import { Repository } from 'typeorm';

@CommandHandler(DeleteCourseCommand)
export class DeleteCourseHandler
	implements ICommandHandler<DeleteCourseCommand>
{
	constructor(
		@Inject('COURSES_REPOSITORY')
		private readonly repository: Repository<Courses>,
	) {}

	async execute(command: DeleteCourseCommand): Promise<any> {
		const id = command.courseId;
		await this.repository.delete(id);
		return { message: `Delete course with id: ${id} successfully.` };
	}
}

