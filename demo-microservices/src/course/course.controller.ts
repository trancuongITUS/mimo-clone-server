import { Controller } from '@nestjs/common';
import { CourseService } from './course.service';
import { MessagePattern, Payload } from '@nestjs/microservices';

@Controller('course')
export class CourseController {
  constructor(private readonly courseService: CourseService) {}

  @MessagePattern({ cmd: 'get_all_courses' })
  async getAllCourses() {
    return await this.courseService.getAllCourses();
  }

  @MessagePattern({ cmd: 'get_course_by_id' })
  async getCourseById(@Payload('courseId') data: number) {
    return await this.courseService.getCourseById(data);
  }
}
