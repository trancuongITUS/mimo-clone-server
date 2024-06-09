import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { Chapters } from "src/database/entities/Chapters.entity";
import { Repository } from "typeorm";
import { CreateChapterCommand } from "../chapter.command";
import { Tutorials } from "src/database/entities/Tutorials.entity";

@CommandHandler(CreateChapterCommand)
export class CreateChapterHandler
  implements ICommandHandler<CreateChapterCommand> {
    constructor(
        @Inject('CHAPTERS_REPOSITORY')
        private readonly repository: Repository<Chapters>,
        private readonly eventBus: EventBus
    ) {}

  async execute(command: CreateChapterCommand): Promise<Chapters> {
    const { type, title, index, tutorialId } = command.createChapterDto;
    const chapter = new Chapters();
    chapter.type = type
    chapter.title = title;
    chapter.index = index;
    const tutorial = new Tutorials();
    tutorial.id = tutorialId;
    chapter.tutorial=tutorial;
    chapter.id=this.mongoObjectId();
    this.repository.save(chapter);
   // this.sendEvent(chapter,this.eventBus);
    return chapter;
  }

//   private async sendEvent(chapter: Chapters, eventBus: EventBus) {
//     if(chapter !== undefined) {
//         console.log("send event ChapterCreatedEvent");
//         eventBus.publish(new ChapterCreatedEvent(chapter));
//             console.log("sent");
//     }
//}

  private mongoObjectId = function () {
    var timestamp = (new Date().getTime() / 1000 | 0).toString(16);
    return timestamp + 'xxxxxxxxxxxxxxxx'.replace(/[x]/g, function() {
        return (Math.random() * 16 | 0).toString(16);
    }).toLowerCase();
};
}
