import { Module } from '@nestjs/common';
import { SequelizeModule } from '@nestjs/sequelize';
import { Course } from './course.model';
import { CourseController } from './course.controller';
import { CourseService } from './course.service';

@Module({
  imports: [SequelizeModule.forFeature([Course])],
  providers: [CourseService],
  controllers: [CourseController],
})
export class CourseModule {}
