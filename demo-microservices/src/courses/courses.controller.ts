import { Controller } from "@nestjs/common";
import { CoursesService } from "./courses.service";
import { Courses } from "src/database/entities/Courses.entity";
import { MessagePattern } from "@nestjs/microservices";

@Controller()
export class CoursesController {
    constructor(private readonly coursesService: CoursesService) {}

    @MessagePattern({cmd: 'get_all_courses'})
    async newBook(): Promise<Courses[]> {
        return await this.coursesService.getAll();
    }

    @MessagePattern({cmd: 'get_course'})
    async getBook(courseId: string): Promise<Courses> {
      //return "getCourse "+courseId;
      return await this.coursesService.getById(courseId);
    }
}