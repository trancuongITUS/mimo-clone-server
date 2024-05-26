import { CommandHandler, EventBus, ICommandHandler } from "@nestjs/cqrs";
import { CreateSectionCommand } from "../section.command";
import { Repository } from "typeorm";
import { Sections } from "src/database/entities/Sections.entity";
import { Inject } from "@nestjs/common";
import { Courses } from "src/database/entities/Courses.entity";

@CommandHandler(CreateSectionCommand)
export class CreateSectionHandler
  implements ICommandHandler<CreateSectionCommand> {
    constructor(
        @Inject('SECTIONS_REPOSITORY')
        private readonly repository: Repository<Sections>,
        private readonly eventBus: EventBus
    ) {}

  async execute(command: CreateSectionCommand): Promise<Sections> {
    const { name, isLocked, description, index, courseId} = command.createSectionDto;
    const section = new Sections();
    section.name = name;
    section.description = description;
    section.index = index;
    section.isLocked = isLocked;
    section.id=this.mongoObjectId();
    const course = new Courses();
    course.id = courseId;
    section.course = course; 
    this.repository.save(section);
    this.sendEvent(section,this.eventBus);
    return section;
  }

  private async sendEvent(section: Sections, eventBus: EventBus) {
    if(section !== undefined) {
        console.log("send event SectionCreatedEvent");
        // eventBus.publish(new CourseCreatedEvent(course));
        //     console.log("sent");
    }
}

  private mongoObjectId = function () {
    var timestamp = (new Date().getTime() / 1000 | 0).toString(16);
    return timestamp + 'xxxxxxxxxxxxxxxx'.replace(/[x]/g, function() {
        return (Math.random() * 16 | 0).toString(16);
    }).toLowerCase();
};
}