import { Controller } from "@nestjs/common";
import { CoursesService } from "./courses.service";
import { Courses } from "src/database/entities/Courses.entity";
import { MessagePattern } from "@nestjs/microservices";
import { Chapters } from "src/database/entities/Chapters.entity";

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

    @MessagePattern({cmd: 'get_chapter'}) 
    async  getChapter(chapterId: string): Promise<Chapters> {
      return await this.coursesService.getChapter(chapterId);
    }
}