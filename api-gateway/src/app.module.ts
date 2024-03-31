import { Module } from '@nestjs/common';
import { CourseModule } from './course/course.module';
import { ConfigModule } from '@nestjs/config';
import { SectionModule } from './section/section.module';
import { ConnectionModule } from './connection/connection.module';

@Module({
  imports: [ConfigModule.forRoot(), CourseModule, SectionModule, ConnectionModule],
})
export class AppModule {}
