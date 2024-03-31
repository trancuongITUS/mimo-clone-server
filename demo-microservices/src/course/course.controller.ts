import { Controller } from '@nestjs/common';
import { CourseService } from './course.service';
import { MessagePattern } from '@nestjs/microservices';

@Controller('course')
export class CourseController {
  constructor(private readonly courseService: CourseService) {}

  @MessagePattern({ cmd: 'get_all_courses' })
  async getAllCourses() {
    return await this.courseService.getAllCourses();
  }
}
