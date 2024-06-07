import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { Sections } from "src/database/entities/Sections.entity";
import { Tutorials } from "src/database/entities/Tutorials.entity";
import { Repository } from "typeorm";
import { UpdateTutorialCommand } from "../tutorial.command";

@CommandHandler(UpdateTutorialCommand)
export class UpdateTutorialHandler
  implements ICommandHandler<UpdateTutorialCommand> {
    constructor(
        @Inject('TUTORIALS_REPOSITORY')
        private readonly repository: Repository<Tutorials>,
        private readonly eventBus: EventBus
    ) {}

  async execute(command: UpdateTutorialCommand): Promise<Tutorials> {
    const { tutorialId, bannerIconUrl, codeLanguage, descriptionContent, index, iscompleted, title, type, version, sectionId} = command.updateTutorialDto;
    const tutorial = new Tutorials;
    tutorial.bannerIconUrl=bannerIconUrl;
    tutorial.codeLanguage=codeLanguage;
    tutorial.descriptionContent=descriptionContent;
    tutorial.index=index;
    tutorial.iscompleted=iscompleted;
    tutorial.title=title;
    tutorial.type=type;
    tutorial.version=version;
    const section = new Sections;
    section.id=sectionId;
    tutorial.section = section;
    tutorial.id = tutorialId;
    this.repository.save(tutorial);
  //  this.sendEvent(tutorial,this.eventBus);
    return tutorial;
  }

    //   private async sendEvent(tutorial: Tutorials, eventBus: EventBus) {
    //     if(tutorial !== undefined) {
    //         console.log("send event TutorialUpdatedEvent");
    //          eventBus.publish(new TutorialUpdatedEvent(tutorial));
    //         //     console.log("sent");
    //     }
    // }

}