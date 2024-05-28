import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { TutorialsController } from "./tutorials.controller";
import { tutorialsProviders } from "./tutorials.provider";
import { GetTutorialsHandler } from "./queries/handler/get-tutorials.handler";

export const QueryHandlers =  [
	GetTutorialsHandler,
];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...tutorialsProviders,
		...QueryHandlers,
	],
	controllers: [TutorialsController],
})
export class TutorialsCQRSModule {}