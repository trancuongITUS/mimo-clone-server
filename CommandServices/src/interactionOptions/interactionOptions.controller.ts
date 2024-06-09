import { Controller } from "@nestjs/common";
import { QueryBus, CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { CreateInteractionOptionCommand, UpdateInteractionOptionCommand } from "./commands/interactionOption.command";
import { CreateInteractionOptionDto } from "./dto/createInteracitonOption.dto";
import { UpdateInteractionOptionDto } from "./dto/updateInteractionOption.dto";

@Controller()
export class InteractionOptionsController {
    constructor(
        private readonly querybus: QueryBus,
        private readonly commandbus: CommandBus
    ) {}

    @MessagePattern({ cmd: 'create_interaction_option' })
    async createInteractionOption(createInteractionOptionDto: CreateInteractionOptionDto): Promise<any> {
        return await this.commandbus.execute(new CreateInteractionOptionCommand(createInteractionOptionDto));
    }

    @MessagePattern({ cmd: 'update_interaction_option' })
    async updateInteractionOption(updateInteractionOptionDto: UpdateInteractionOptionDto): Promise<any> {
        return await this.commandbus.execute(new UpdateInteractionOptionCommand(updateInteractionOptionDto));
    }
}