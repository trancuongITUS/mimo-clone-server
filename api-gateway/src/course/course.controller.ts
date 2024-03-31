import { Controller, Get, Inject } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';

@Controller('course')
export class CourseController {
  constructor(@Inject('COURSE_SERVICE') private readonly client: ClientProxy) {}

  @Get()
  getAllCourses() {
    return this.client.send({ cmd: 'get_all_courses' }, {});
  }
}
