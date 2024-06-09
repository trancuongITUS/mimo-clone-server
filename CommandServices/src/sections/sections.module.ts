import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { CreateSectionHandler } from "./commands/handler/create-section.handler";
import { SectionsController } from "./sections.controller";
import { sectionsProviders } from "./sections.provider";
import { SectionCreatedHandler } from "./event/handler/section-created.handler";
import { UpdateSectionHandler } from "./commands/handler/update-section.handler";

export const CommandHandlers = [CreateSectionHandler, UpdateSectionHandler];
export const EventHandlers = [SectionCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...sectionsProviders,
		...CommandHandlers,
		...EventHandlers
	],
	controllers: [SectionsController],
})
export class SectionsCQRSModule {}