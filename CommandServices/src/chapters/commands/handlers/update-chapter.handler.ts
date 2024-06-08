import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { Chapters } from "src/database/entities/Chapters.entity";
import { Sections } from "src/database/entities/Sections.entity";
import { Repository } from "typeorm";
import { UpdateChapterCommand } from "../chapter.command";
import { Tutorials } from "src/database/entities/Tutorials.entity";

@CommandHandler(UpdateChapterCommand)
export class UpdateChapterHandler
  implements ICommandHandler<UpdateChapterCommand> {
    constructor(
        @Inject('CHAPTERS_REPOSITORY')
        private readonly repository: Repository<Chapters>,
        private readonly eventBus: EventBus
    ) {}

  async execute(command: UpdateChapterCommand): Promise<Chapters> {
    const { chapterId, type, title, index, tutorialId} = command.updateChapterDto;
    const chapter = new Chapters;
    chapter.index=index;
    chapter.title=title;
    chapter.type=type;
    chapter.id = chapterId;
    const tutorial = new Tutorials();
    tutorial.id = tutorialId;
    chapter.tutorial = tutorial;
    console.log(chapter);
    this.repository.save(chapter);
  //  this.sendEvent(chapter,this.eventBus);
    return chapter;
  }

    //   private async sendEvent(chapter: Chapters, eventBus: EventBus) {
    //     if(chapter !== undefined) {
    //         console.log("send event ChapterUpdatedEvent");
    //          eventBus.publish(new ChapterUpdatedEvent(chapter));
    //         //     console.log("sent");
    //     }
    // }

}