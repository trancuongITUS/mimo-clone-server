import { CommandHandler, ICommandHandler } from '@nestjs/cqrs';
import { CreateCourseCommand } from '../course.command';
import { Inject } from '@nestjs/common';
import { Courses } from 'src/database/entities/Courses.entity';
import { Repository } from 'typeorm';


@CommandHandler(CreateCourseCommand)
export class CreateCourseHandler
  implements ICommandHandler<CreateCourseCommand> {
    constructor(
        @Inject('COURSES_REPOSITORY')
        private readonly repository: Repository<Courses>
    ) {}

  async execute(command: CreateCourseCommand): Promise<Courses> {
    const course = this.repository.create(command.createCourseDto);
    return this.repository.save(course);
  }
}
