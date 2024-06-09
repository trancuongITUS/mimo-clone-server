import { Controller, Inject, Post, Body, Put, Param } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";
import { CreateInteractionModuleDto } from "src/dto/request/createInteractionModule.dto";
import { UpdateInteractionModuleDto } from "src/dto/request/updateInteractionModule.dto";

@Controller('interactionModules')
export class InteractionModulesController {
	constructor(
		@Inject('QUERY_SERVICE')
		private readonly interactionsQueryClient: ClientProxy,
		@Inject('COMMAND_SERVICE')
		private readonly interactionsCommandClient: ClientProxy,
	) {}

	@Post()
	async createInteraction(
		@Body() createInteractionDto: CreateInteractionModuleDto,
	): Promise<any> {
		return this.interactionsCommandClient.send(
			{ cmd: 'create_interaction' },
			createInteractionDto,
		);
	}

	@Put(':id')
	async updateInteraction(
		@Param('id') id: string,
		@Body() updateInteractionDto: UpdateInteractionModuleDto,
	): Promise<any> {
		updateInteractionDto.interactionModuleId = id;
		return this.interactionsCommandClient.send(
			{ cmd: 'update_interaction' },
			updateInteractionDto,
		);
	}
}