import { CreateLessonDto } from "../dto/createLesson.dto";
import { UpdateLessonDto } from "../dto/updateLesson.dto";

export class CreateLessonCommand {
    constructor(public readonly createLessonDto: CreateLessonDto) {}
}

export class UpdateLessonCommand {
    constructor(public readonly updateLessonDto: UpdateLessonDto) {}
}