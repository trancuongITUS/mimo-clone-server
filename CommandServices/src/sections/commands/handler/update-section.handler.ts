import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { Courses } from "src/database/entities/Courses.entity";
import { Sections } from "src/database/entities/Sections.entity";
import { Repository } from "typeorm";
import { UpdateSectionCommand } from "../section.command";

@CommandHandler(UpdateSectionCommand)
export class UpdateSectionHandler
  implements ICommandHandler<UpdateSectionCommand> {
    constructor(
        @Inject('SECTIONS_REPOSITORY')
        private readonly repository: Repository<Sections>,
        private readonly eventBus: EventBus
    ) {}

  async execute(command: UpdateSectionCommand): Promise<Sections> {
    const { sectionId, name, isLocked, description, index, courseId} = command.updateSectionDto;
    const section = new Sections();
    section.id=sectionId;
    section.name = name;
    section.description = description;
    section.index = index;
    section.isLocked = isLocked;
    const course = new Courses();
    course.id = courseId;
    section.course = course; 
    this.repository.save(section);
   // this.sendEvent(section,this.eventBus);
    return section;
  }

//   private async sendEvent(section: Sections, eventBus: EventBus) {
//     if(section !== undefined) {
//         console.log("send event SectionUpdatedEvent");
//          eventBus.publish(new SectionUpdatedEvent(section));
//         //     console.log("sent");
//     }
// }

}