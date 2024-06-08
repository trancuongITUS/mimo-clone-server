import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { ChaptersController } from "./chapters.controller";
import { CreateChapterHandler } from "./commands/handlers/create-chapter.handler";
import { chaptersProviders } from "./chapters.provider";
import { UpdateChapterHandler } from "./commands/handlers/update-chapter.handler";

export const CommandHandlers = [CreateChapterHandler, UpdateChapterHandler];
//export const EventHandlers = [ChapterCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...chaptersProviders,
		...CommandHandlers,
		//...EventHandlers
	],
	controllers: [ChaptersController],
})
export class ChaptersCQRSModule {}