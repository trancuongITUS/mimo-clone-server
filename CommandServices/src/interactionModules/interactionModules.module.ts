import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { CreateInteractionModuleHandler } from "./commands/handler/create-interaction.handler";
import { InteractionModulesController } from "./interactionModules.controller";
import { interactionModulesProviders } from "./interactionModules.provider";
import { UpdateInteractionModuleHandler } from "./commands/handler/update-interaction.handler";

export const CommandHandlers = [CreateInteractionModuleHandler, UpdateInteractionModuleHandler];
//export const EventHandlers = [InteractionModuleCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...interactionModulesProviders,
		...CommandHandlers,
		//...EventHandlers
	],
	controllers: [InteractionModulesController],
})
export class InteractionModulesCQRSModule {}