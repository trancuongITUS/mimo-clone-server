import { Module } from "@nestjs/common";
import { CreateTutorialHandler } from "./commands/handler/create-tutorial.handler";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { TutorialCreatedHandler } from "./events/handler/tutorial-created.handler";
import { TutorialsController } from "./tutorials.controller";
import { tutorialsProviders } from "./tutorials.provider";
import { UpdateTutorialHandler } from "./commands/handler/update-tutorial.handler";

export const CommandHandlers = [CreateTutorialHandler, UpdateTutorialHandler];
export const EventHandlers = [TutorialCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...tutorialsProviders,
		...CommandHandlers,
		...EventHandlers
	],
	controllers: [TutorialsController],
})
export class TutorialsCQRSModule {}