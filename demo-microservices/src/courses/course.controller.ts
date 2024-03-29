import { Controller, Get } from '@nestjs/common';

import { Course } from './course.model';
import { CourseService } from './course.service';

@Controller('User')
export class CourseController {
  constructor(private readonly userService: CourseService) {}

  @Get()
  getAll(): Promise<Course[]> {
    return this.userService.findAll();
  }
}
