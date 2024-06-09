import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler } from "@nestjs/cqrs";
import { Lessons } from "src/database/entities/Lessons.entity";
import { Repository } from "typeorm";
import { UpdateLessonCommand } from "../lessons.commands";
import { Chapters } from "src/database/entities/Chapters.entity";

@CommandHandler(UpdateLessonCommand)
export class UpdateLessonHandler implements ICommandHandler<UpdateLessonCommand> {
    constructor(
        @Inject('LESSONS_REPOSITORY')
        private readonly repository: Repository<Lessons>,
    ) {}

    async execute(command: UpdateLessonCommand): Promise<Lessons> {
        const { lessonId, type, index, chapterId } = command.updateLessonDto;

        let lesson = new Lessons();
        lesson.id=lessonId
        lesson.type = type;
        lesson.index = index;
        const chapter = new Chapters();
        chapter.id = chapterId;
        lesson.chapter = chapter;
        return await this.repository.save(lesson);
    }
}
