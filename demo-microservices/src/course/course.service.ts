import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';

@Injectable()
export class CourseService {
  constructor(private readonly prismaService: PrismaService) {}

  async getAllCourses() {
    const courses = await this.prismaService.courses.findMany();
    return {
      courses: courses,
    };
  }
}
