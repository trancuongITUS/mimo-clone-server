import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { ChaptersController } from "./chapters.controller";
import { chaptersProviders } from "./chapters.providers";
import { GetChaptersHandler, GetChapterByByTutorialIdHandler } from "./queries/handler/get-chapters.handler";

export const QueryHandlers = [
	GetChaptersHandler,
	GetChapterByByTutorialIdHandler,
];

@Module({
	imports: [DatabaseModule, CqrsModule],
	providers: [...chaptersProviders, ...QueryHandlers],
	controllers: [ChaptersController],
})
export class ChaptersCQRSModule {}

