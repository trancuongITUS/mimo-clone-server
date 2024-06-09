import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler } from "@nestjs/cqrs";
import { InteractionOption } from "src/database/entities/InteractionOption.entity";
import { Repository } from "typeorm";
import { CreateInteractionOptionCommand } from "../interactionOption.command";
import { InteractionModule } from "src/database/entities/InteractionModule.entity";

@CommandHandler(CreateInteractionOptionCommand)
export class CreateInteractionOptionHandler implements ICommandHandler<CreateInteractionOptionCommand> {
    constructor(
        @Inject('INTERACTION_OPTION_REPOSITORY')
        private readonly repository: Repository<InteractionOption>,
    ) {}

    async execute(command: CreateInteractionOptionCommand): Promise<InteractionOption> {
        const { startIndex, endIndex, startLine, startPos, length, value, correct, interactionModuleId } = command.createInteractionOptionDto;
        
        const interactionOption = new InteractionOption();
        interactionOption.id = this.mongoObjectId();
        interactionOption.startIndex = startIndex;
        interactionOption.endIndex = endIndex;
        interactionOption.startLine = startLine;
        interactionOption.startPos = startPos;
        interactionOption.length = length;
        interactionOption.value = value;
        interactionOption.correct = correct;
        const interactionModule = new InteractionModule();
        interactionModule.id= interactionModuleId;
        interactionOption.interactionModule = interactionModule;

        const createdInteractionOption = await this.repository.save(interactionOption);
        return createdInteractionOption;
    }

    private mongoObjectId = function () {
        var timestamp = (new Date().getTime() / 1000 | 0).toString(16);
        return timestamp + 'xxxxxxxxxxxxxxxx'.replace(/[x]/g, function() {
            return (Math.random() * 16 | 0).toString(16);
        }).toLowerCase();
    };
}