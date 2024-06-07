import { CommandHandler, ICommandHandler } from '@nestjs/cqrs';
import { UpdateTraceCourseCommand } from '../courses-trace.commands';
import { Repository } from 'typeorm';
import { UserCourseTraces } from 'src/database/entities/UserCourseTraces.entity';
import { Inject } from '@nestjs/common';

@CommandHandler(UpdateTraceCourseCommand)
export class UpdateTraceCourseHandler
	implements ICommandHandler<UpdateTraceCourseCommand>
{
	constructor(
		@Inject('COURSES_TRACE_REPOSITORY')
		private readonly repository: Repository<UserCourseTraces>,
	) {}

	async execute(
		command: UpdateTraceCourseCommand,
	): Promise<UserCourseTraces> {
		const res = await this.repository.findOne({
			where: { id: command.id },
		});

		return this.repository.save({
			...res,
			...command.updateTraceCoursesDto,
		});
	}
}

