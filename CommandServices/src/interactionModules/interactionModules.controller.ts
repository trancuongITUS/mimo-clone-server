import { Controller } from "@nestjs/common";
import { QueryBus, CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { CreateInteractionModuleCommand, UpdateInteractionModuleCommand } from "./commands/interactionModule.command";
import { CreateInteractionModuleDto } from "./dto/createInteractionModule.dto";
import { UpdateInteractionModuleDto } from "./dto/updateInteractionModule.dto";

@Controller()
export class InteractionModulesController {
	constructor(
		private readonly queryBus: QueryBus,
		private readonly commandBus: CommandBus
	) {}

	@MessagePattern({ cmd: 'create_interaction' })
	async createInteractionModule(createInteractionModuleDto: CreateInteractionModuleDto): Promise<any> {
		return await this.commandBus.execute(new CreateInteractionModuleCommand(createInteractionModuleDto));
	}

	@MessagePattern({ cmd: 'update_interaction' })
	async updateInteractionModule(updateInteractionModuleDto: UpdateInteractionModuleDto): Promise<any> {
		return await this.commandBus.execute(new UpdateInteractionModuleCommand(updateInteractionModuleDto));
	}
}