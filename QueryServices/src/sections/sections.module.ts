import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { SectionsController } from "./sections.controller";
import { sectionsProviders } from "./sections.provider";
import { GetSectionsHandler } from "./queries/handler/get-sections.handler";

export const QueryHandlers =  [
	GetSectionsHandler,
];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...sectionsProviders,
		...QueryHandlers,
	],
	controllers: [SectionsController],
})
export class SectionsCQRSModule {}