import { Courses } from "src/database/entities/Courses.entity";

export class CourseCreatedEvent {
    constructor(
        public readonly course:Courses 
    ) {}
}