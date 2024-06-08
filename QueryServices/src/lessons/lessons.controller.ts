import { Controller } from "@nestjs/common";
import { QueryBus, CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { Lessons } from "src/database/entities/Lessons.entity";
import { GetLessonQuery, GetLessonByChapterIdQuery } from "./queries/lessons.queries";


@Controller()
export class LessonsController {
    constructor(
        private readonly querybus: QueryBus,
        private readonly commandbus: CommandBus,
    ) {}

    @MessagePattern({ cmd: 'get_lesson' })
    async getLesson(lessonId: string): Promise<Lessons> {
        console.log('get lesson'+lessonId);
        return await this.querybus.execute(new GetLessonQuery(lessonId));
    }

    @MessagePattern({ cmd: 'get_lesson_by_chapterId' })
    async getLessonsByChapterId(chapterId: string): Promise<Lessons[]> {
        return await this.querybus.execute(
            new GetLessonByChapterIdQuery(chapterId),
        );
    }
}