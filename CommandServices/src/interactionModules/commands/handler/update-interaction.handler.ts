import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { InteractionModule } from "src/database/entities/InteractionModule.entity";
import { Repository } from "typeorm";
import { UpdateInteractionModuleCommand } from "../interactionModule.command";
import { Lessons } from "src/database/entities/Lessons.entity";

@CommandHandler(UpdateInteractionModuleCommand)
export class UpdateInteractionModuleHandler
  implements ICommandHandler<UpdateInteractionModuleCommand> {
    constructor(
        @Inject('INTERACTION_REPOSITORY')
        private readonly repository: Repository<InteractionModule>,
        private readonly eventBus: EventBus
    ) {}

    async execute(command: UpdateInteractionModuleCommand): Promise<InteractionModule> {
        const { interactionModuleId, type, output, wrongOptions, isCode, lessonId } = command.updateInteractionModuleDto;
        const interactionModule = new InteractionModule();
        interactionModule.id = interactionModuleId;
        interactionModule.type = type;
        interactionModule.output = output;
        interactionModule.wrongOptions = wrongOptions;
        interactionModule.isCode = isCode;
        const lesson = new Lessons();
        lesson.id = lessonId;
        interactionModule.lesson = lesson; 
        await this.repository.save(interactionModule);
        return interactionModule;
    }
}