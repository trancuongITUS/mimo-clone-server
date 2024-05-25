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
    const { name, description, isPublished, iconUrl } = command.createCourseDto;
    const course = new Courses();
    course.name = name;
    course.description = description;
    course.isPublished = isPublished;
    course.iconUrl = iconUrl;
    course.id=this.mongoObjectId();
    return this.repository.save(course);
  }

  private mongoObjectId = function () {
    var timestamp = (new Date().getTime() / 1000 | 0).toString(16);
    return timestamp + 'xxxxxxxxxxxxxxxx'.replace(/[x]/g, function() {
        return (Math.random() * 16 | 0).toString(16);
    }).toLowerCase();
};
}
