import { CreateTraceCourseDTO } from '../dto/createCoursesTrace.dto';

export class CreateTraceCourseCommand {
	constructor(public readonly createTraceCoursesDto: CreateTraceCourseDTO) {}
}

export class UpdateTraceCourseCommand {
	constructor(
		public readonly updateTraceCoursesDto: CreateTraceCourseDTO,
		public readonly id: string,
	) {}
}

