import { CreateCourseDto } from "../dto/createCourse.dto";

export class CreateCourseCommand {
  constructor(public readonly createCourseDto: CreateCourseDto) {}
}

