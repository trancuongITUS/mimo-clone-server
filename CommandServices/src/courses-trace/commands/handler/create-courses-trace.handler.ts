import { Repository } from 'typeorm';
import { CreateTraceCourseCommand } from './../courses-trace.commands';
import { CommandHandler, ICommandHandler } from '@nestjs/cqrs';
import { UserCourseTraces } from 'src/database/entities/UserCourseTraces.entity';
import { Inject } from '@nestjs/common';
import { Users } from 'src/database/entities/Users.entity';
import { Courses } from 'src/database/entities/Courses.entity';

@CommandHandler(CreateTraceCourseCommand)
export class CreateTraceCourseHandler
	implements ICommandHandler<CreateTraceCourseCommand>
{
	constructor(
		@Inject('COURSES_TRACE_REPOSITORY')
		private readonly repository: Repository<UserCourseTraces>,
	) {}

	async execute(
		command: CreateTraceCourseCommand,
	): Promise<UserCourseTraces> {
		const { courseId, key, isFavourite, userId } =
			command.createTraceCoursesDto;

		const courseTrace = new UserCourseTraces();

		courseTrace.id = this.mongoObjectId();

		courseTrace.userUid = userId;
		courseTrace.key = key;

		const course = new Courses();
		course.id = courseId;

		courseTrace.course = course;
		courseTrace.isFavourite = isFavourite;
		this.repository.save(courseTrace);

		return courseTrace;
	}

	private mongoObjectId = function () {
		var timestamp = ((new Date().getTime() / 1000) | 0).toString(16);
		return (
			timestamp +
			'xxxxxxxxxxxxxxxx'
				.replace(/[x]/g, function () {
					return ((Math.random() * 16) | 0).toString(16);
				})
				.toLowerCase()
		);
	};
}

