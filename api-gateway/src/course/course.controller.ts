import {
  Controller,
  Get,
  HttpException,
  Inject,
  Param,
  ParseIntPipe,
} from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { catchError } from 'rxjs';

@ApiTags('course')
@Controller('course')
export class CourseController {
  constructor(@Inject('COURSE_SERVICE') private readonly client: ClientProxy) {}

  @ApiOperation({ summary: 'Get all courses' })
  @Get()
  getAllCourses() {
    return this.client.send({ cmd: 'get_all_courses' }, {});
  }

  @ApiOperation({ summary: 'Get course by id' })
  @Get(':id')
  getCourseById(@Param('id', ParseIntPipe) id: number) {
    return this.client.send({ cmd: 'get_course_by_id' }, { courseId: id }).pipe(
      catchError((error) => {
        throw new HttpException({ message: error.message }, error.statusCode);
      }),
    );
  }
}
