import { Controller, Inject, Post, Body, Put, Param } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";
import { CreateInteractionOptionDto } from "src/dto/request/createInteracitonOption.dto";
import { UpdateInteractionOptionDto } from "src/dto/request/updateInteractionOption.dto";

@Controller('interactionOptions')
export class InteractionOptionController {
    constructor(
        @Inject('QUERY_SERVICE')
        private readonly interactionsQueryClient: ClientProxy,
        @Inject('COMMAND_SERVICE')
        private readonly interactionsCommandClient: ClientProxy,
    ) {}

    @Post()
    async createInteractionOption(
        @Body() createInteractionOptionDto: CreateInteractionOptionDto,
    ): Promise<any> {
        return this.interactionsCommandClient.send(
            { cmd: 'create_interaction_option' },
            createInteractionOptionDto,
        );
    }

    @Put(':id')
    async updateInteractionOption(
        @Param('id') id: string,
        @Body() updateInteractionOptionDto: UpdateInteractionOptionDto,
    ): Promise<any> {
        updateInteractionOptionDto.optionId = id;
        return this.interactionsCommandClient.send(
            { cmd: 'update_interaction_option' },
            updateInteractionOptionDto,
        );
    }
}