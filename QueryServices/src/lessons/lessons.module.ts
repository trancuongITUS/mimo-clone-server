import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { LessonsController } from "./lessons.controller";
import { lessonsProviders } from "./lessons.provider";
import { GetLessonByChapterIdHandler, GetLessonHandler } from "./queries/handler/get-lessons.handler";

export const QueryHandlers = [
    GetLessonHandler,
    GetLessonByChapterIdHandler,
];

@Module({
    imports: [DatabaseModule, CqrsModule],
    providers: [...lessonsProviders, ...QueryHandlers],
    controllers: [LessonsController],
})
export class LessonsCQRSModule {}
