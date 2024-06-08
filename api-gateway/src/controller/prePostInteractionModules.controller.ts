import { Controller, Post, Body, Put, Param, Inject } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";
import { CreatePrePostInteractionModuleDto } from "src/dto/request/createPrePostInteractionModule.dto";
import { UpdatePrePostInteractionModuleDto } from "src/dto/request/updatePrePostInteractionModule.dto";

@Controller('prePostInteractionModules')
export class PrePostInteractionModulesController {
	constructor(
		@Inject('QUERY_SERVICE')
		private readonly interactionsQueryClient: ClientProxy,
		@Inject('COMMAND_SERVICE')
		private readonly interactionsCommandClient: ClientProxy,
	) {}

	@Post()
	async createPrePostInteractionModule(
		@Body() createPrePostInteractionModuleDto: CreatePrePostInteractionModuleDto,
	): Promise<any> {
		return this.interactionsCommandClient.send(
			{ cmd: 'create_pre_post_interaction_module' },
			createPrePostInteractionModuleDto,
		);
	}

	@Put(':id')
	async updatePrePostInteractionModule(
		@Param('id') id: string,
		@Body() updatePrePostInteractionModuleDto: UpdatePrePostInteractionModuleDto,
	): Promise<any> {
		updatePrePostInteractionModuleDto.prePostInteractionId = id;
		return this.interactionsCommandClient.send(
			{ cmd: 'update_pre_post_interaction_module' },
			updatePrePostInteractionModuleDto,
		);
	}
}