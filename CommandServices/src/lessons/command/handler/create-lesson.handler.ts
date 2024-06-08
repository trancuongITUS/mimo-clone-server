import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { Lessons } from "src/database/entities/Lessons.entity";
import { Repository } from "typeorm";
import { CreateLessonCommand } from "../lessons.commands";
import { Chapters } from "src/database/entities/Chapters.entity";

@CommandHandler(CreateLessonCommand)
export class CreateLessonHandler implements ICommandHandler<CreateLessonCommand> {
    constructor(
        @Inject('LESSONS_REPOSITORY')
        private readonly repository: Repository<Lessons>,
        private readonly eventBus: EventBus,
    ) {}

    async execute(command: CreateLessonCommand): Promise<Lessons> {
        const { type, index, chapterId } = command.createLessonDto;

        const lesson = new Lessons();
        lesson.type = type;
        lesson.index = index;
        const chapter = new Chapters();
        chapter.id = chapterId;
        lesson.chapter = chapter;
        lesson.id = this.generateObjectId();
        const savedLesson = await this.repository.save(lesson);
        return savedLesson;
    }

    private generateObjectId(): string {
        const timestamp = (new Date().getTime() / 1000 | 0).toString(16);
        return timestamp + 'xxxxxxxxxxxxxxxx'.replace(/[x]/g, () => (Math.random() * 16 | 0).toString(16)).toLowerCase();
    }

}
