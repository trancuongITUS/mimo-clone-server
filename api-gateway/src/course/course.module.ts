import { Module } from '@nestjs/common';
import { CourseController } from './course.controller';
import { ConnectionModule } from '../connection/connection.module';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [ConfigModule, ConnectionModule],
  controllers: [CourseController],
})
export class CourseModule {}
