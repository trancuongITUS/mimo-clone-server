import { Controller } from "@nestjs/common";
import { QueryBus, CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { CreatePrePostInteractionModuleCommand, UpdatePrePostInteractionModuleCommand } from "./command/prePostInteraction.command";
import { CreatePrePostInteractionModuleDto } from "./dto/createPrePostInteractionModule.dto";
import { UpdatePrePostInteractionModuleDto } from "./dto/updatePrePostInteractionModule.dto";

@Controller()
export class PrePostInteractionModulesController {
	constructor(
		private readonly queryBus: QueryBus,
		private readonly commandBus: CommandBus
	) {}

	@MessagePattern({ cmd: 'create_pre_post_interaction_module' })
	async createPrePostInteractionModule(createPrePostInteractionModuleDto: CreatePrePostInteractionModuleDto): Promise<any> {
		return await this.commandBus.execute(new CreatePrePostInteractionModuleCommand(createPrePostInteractionModuleDto));
	}

	@MessagePattern({ cmd: 'update_pre_post_interaction_module' })
	async updatePrePostInteractionModule(updatePrePostInteractionModuleDto: UpdatePrePostInteractionModuleDto): Promise<any> {
		return await this.commandBus.execute(new UpdatePrePostInteractionModuleCommand(updatePrePostInteractionModuleDto));
	}
}