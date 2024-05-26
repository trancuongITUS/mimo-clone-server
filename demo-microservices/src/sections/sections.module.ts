import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { CreateSectionHandler } from "./commands/handler/create-section.handler";
import { SectionsController } from "./sections.controller";
import { sectionsProviders } from "./sections.provider";
import { GetSectionsHandler } from "./queries/handler/get-sections.handler";
import { SectionCreatedHandler } from "./event/handler/section-created.handler";

export const CommandHandlers = [CreateSectionHandler];
export const QueryHandlers =  [
	GetSectionsHandler,
];
export const EventHandlers = [SectionCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...sectionsProviders,
		...CommandHandlers,
		...QueryHandlers,
		...EventHandlers
	],
	controllers: [SectionsController],
})
export class SectionsCQRSModule {}