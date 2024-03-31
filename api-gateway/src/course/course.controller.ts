import {
  Controller,
  Get,
  HttpException,
  Inject,
  Param,
  ParseIntPipe,
} from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { Observable, catchError } from 'rxjs';

@Controller('course')
export class CourseController {
  constructor(@Inject('COURSE_SERVICE') private readonly client: ClientProxy) {}

  @Get()
  getAllCourses() {
    return this.client.send({ cmd: 'get_all_courses' }, {});
  }

  @Get(':id')
  getCourseById(@Param('id', ParseIntPipe) id: number): Observable<any> {
    return this.client.send({ cmd: 'get_course_by_id' }, { courseId: id }).pipe(
      catchError((error) => {
        throw new HttpException({ message: error.message }, error.statusCode);
      }),
    );
  }
}
