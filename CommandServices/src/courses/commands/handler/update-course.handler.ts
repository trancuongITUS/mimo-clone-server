import { CommandHandler, EventBus, ICommandHandler } from '@nestjs/cqrs';
import { UpdateCourseCommand } from '../course.command';
import { Inject } from '@nestjs/common';
import { Courses } from 'src/database/entities/Courses.entity';
import { Repository } from 'typeorm';


@CommandHandler(UpdateCourseCommand)
export class UpdateCourseHandler
  implements ICommandHandler<UpdateCourseCommand> {
    constructor(
        @Inject('COURSES_REPOSITORY')
        private readonly repository: Repository<Courses>,
        private readonly eventBus: EventBus
    ) {}

  async execute(command: UpdateCourseCommand): Promise<Courses> {
    const { courseId, name, description, isPublished, iconUrl } = command.updateCourseDto;
    const course = new Courses();
    course.id= courseId
    course.description= description
    course.name=name
    course.iconUrl=iconUrl
    course.isPublished=isPublished
    this.repository.save(course);
    //this.sendEvent(course,this.eventBus);
    return course;
  }

  private async sendEvent(course: Courses, eventBus: EventBus) {
    if(course !== undefined) {
        console.log("send event UpdateCreatedEvent");
        // eventBus.publish(new CourseCreatedEvent(course));
        //     console.log("sent");
    }
}
}
