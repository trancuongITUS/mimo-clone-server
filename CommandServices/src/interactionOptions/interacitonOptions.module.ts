import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { InteractionOptionsController } from "./interactionOptions.controller";
import { interactionOptionsProviders } from "./interactionOptions.provider";
import { CreateInteractionOptionHandler } from "./commands/handler/create-InteractionOption.handler";
import { UpdateInteractionOptionHandler } from "./commands/handler/update-inteactionOption.handler";

export const CommandHandlers = [CreateInteractionOptionHandler, UpdateInteractionOptionHandler];
//export const EventHandlers = [InteractionOptionCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...interactionOptionsProviders,
		...CommandHandlers,
		//...EventHandlers
	],
	controllers: [InteractionOptionsController],
})
export class InteractionOptionsCQRSModule {}