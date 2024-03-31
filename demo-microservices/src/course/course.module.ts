import { Module } from '@nestjs/common';
import { CourseController } from './course.controller';
import { CourseService } from './course.service';
import { PrismaService } from '../prisma.service';

@Module({
  controllers: [CourseController],
  providers: [CourseService, PrismaService],
})
export class CourseModule {}
