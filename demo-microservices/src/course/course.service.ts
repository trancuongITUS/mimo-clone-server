import { HttpStatus, Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { RpcException } from '@nestjs/microservices';

@Injectable()
export class CourseService {
  constructor(private readonly prismaService: PrismaService) {}

  async getAllCourses() {
    const courses = await this.prismaService.courses.findMany();
    return {
      courses: courses,
    };
  }

  async getCourseById(courseId: number) {
    const course = await this.prismaService.courses.findUnique({
      where: {
        id: courseId,
      },
    });
    if (!course)
      throw new RpcException({
        statusCode: HttpStatus.NOT_FOUND,
        message: `Couldn't find course with id = ${courseId}`,
      });
    const sections = await this.prismaService.sections.findMany({
      where: {
        courseId: courseId,
      },
    });
    return {
      course: {
        ...course,
        sections: sections,
      },
    };
  }
}
