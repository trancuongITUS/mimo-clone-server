import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler } from "@nestjs/cqrs";
import { InteractionModule } from "src/database/entities/InteractionModule.entity";
import { InteractionOption } from "src/database/entities/InteractionOption.entity";
import { Repository } from "typeorm";
import { UpdateInteractionOptionCommand } from "../interactionOption.command";


@CommandHandler(UpdateInteractionOptionCommand)
export class UpdateInteractionOptionHandler implements ICommandHandler<UpdateInteractionOptionCommand> {
    constructor(
        @Inject('INTERACTION_OPTION_REPOSITORY')
        private readonly repository: Repository<InteractionOption>,
    ) {}

    async execute(command: UpdateInteractionOptionCommand): Promise<InteractionOption> {
        const { optionId, startIndex, endIndex, startLine, startPos, length, value, correct, interactionModuleId } = command.updateInteractionOptionDto;
        const interactionOption = new InteractionOption();
        interactionOption.id=optionId
        interactionOption.startIndex = startIndex;
        interactionOption.endIndex = endIndex;
        interactionOption.startLine = startLine;
        interactionOption.startPos = startPos;
        interactionOption.length = length;
        interactionOption.value = value;
        interactionOption.correct = correct;
        const interactionModule = new InteractionModule();
        interactionModule.id = interactionModuleId;
        interactionOption.interactionModule = interactionModule;
        return await this.repository.save(interactionOption);
    }
}
