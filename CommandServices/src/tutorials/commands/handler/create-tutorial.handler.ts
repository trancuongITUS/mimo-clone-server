import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { Tutorials } from "src/database/entities/Tutorials.entity";
import { Repository } from "typeorm";
import { CreateTutorialCommand } from "../tutorial.command";
import { Sections } from "src/database/entities/Sections.entity";
import { TutorialCreatedEvent } from "src/tutorials/events/tutorials.event";

@CommandHandler(CreateTutorialCommand)
export class CreateTutorialHandler
  implements ICommandHandler<CreateTutorialCommand> {
    constructor(
        @Inject('TUTORIALS_REPOSITORY')
        private readonly repository: Repository<Tutorials>,
        private readonly eventBus: EventBus
    ) {}

  async execute(command: CreateTutorialCommand): Promise<Tutorials> {
    const { bannerIconUrl, codeLanguage, descriptionContent, index, iscompleted, title, type, version, sectionId} = command.createTutorialDto;
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
    tutorial.id = this.mongoObjectId();
    this.repository.save(tutorial);
    //this.sendEvent(tutorial,this.eventBus);
    return tutorial;
  }

  private async sendEvent(tutorial: Tutorials, eventBus: EventBus) {
    if(tutorial !== undefined) {
        console.log("send event TutorialCreatedEvent");
         eventBus.publish(new TutorialCreatedEvent(tutorial));
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