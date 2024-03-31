import { Module } from '@nestjs/common';
import { CourseModule } from './course/course.module';
import { ConfigModule } from '@nestjs/config';
import { SectionModule } from './section/section.module';
@Module({
  imports: [ConfigModule.forRoot(), CourseModule, SectionModule],
})
export class AppModule {}
