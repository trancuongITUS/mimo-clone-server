import { CreateCourseDto } from "../dto/createCourse.dto";
import { UpdateCourseDto } from "../dto/updateCourse.dto";

export class CreateCourseCommand {
  constructor(public readonly createCourseDto: CreateCourseDto) {}
}

export class UpdateCourseCommand {
  constructor(public readonly updateCourseDto: UpdateCourseDto) {}
}