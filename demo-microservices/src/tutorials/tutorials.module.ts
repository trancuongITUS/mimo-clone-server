import { Module } from "@nestjs/common";
import { GetTutorialsHandler } from "./events/handler/get-tutorials.handler";
import { CreateTutorialHandler } from "./commands/handler/create-tutorial.handler";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { TutorialCreatedHandler } from "./events/tutorial-created.handler";
import { TutorialsController } from "./tutorials.controller";
import { tutorialsProviders } from "./tutorials.provider";

export const CommandHandlers = [CreateTutorialHandler];
export const QueryHandlers =  [
	GetTutorialsHandler,
];
export const EventHandlers = [TutorialCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...tutorialsProviders,
		...CommandHandlers,
		...QueryHandlers,
		...EventHandlers
	],
	controllers: [TutorialsController],
})
export class TutorialsCQRSModule {}