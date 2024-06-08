import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { CreateLessonHandler } from "./command/handler/create-lesson.handler";
import { UpdateLessonHandler } from "./command/handler/update-lesson.handler";
import { LessonsController } from "./lesson.controller";
import { lessonsProviders } from "./lesson.providers";

export const CommandHandlers = [CreateLessonHandler, UpdateLessonHandler];
//export const EventHandlers = [LessonCreatedHandler];

@Module({
    imports: [DatabaseModule, CqrsModule],
    providers: [
        ...lessonsProviders,
        ...CommandHandlers,
        //...EventHandlers
    ],
    controllers: [LessonsController],
})
export class LessonsCQRSModule {}