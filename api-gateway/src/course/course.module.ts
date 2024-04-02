import { Module } from '@nestjs/common';
import { CourseController } from './course.controller';
import { ConnectionModule } from '../connection/connection.module';

@Module({
  imports: [ConnectionModule],
  controllers: [CourseController],
})
export class CourseModule {}