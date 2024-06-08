import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { PrePostInteractionModulesController } from "./prePostInteractionModule.controller";
import { CreatePrePostInteractionModuleHandler } from "./command/handlers/create-prePostInteraction.handler";
import { UpdatePrePostInteractionModuleHandler } from "./command/handlers/update-prePostInteraction.handler";
import { prePostInteractionModulesProviders } from "./prePostInteractionModule.provider";

export const CommandHandlers = [CreatePrePostInteractionModuleHandler, UpdatePrePostInteractionModuleHandler];
//export const EventHandlers = [InteractionModuleCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...prePostInteractionModulesProviders,
		...CommandHandlers,
		//...EventHandlers
	],
	controllers: [PrePostInteractionModulesController],
})
export class PrePostInteractionModulesCQRSModule {}