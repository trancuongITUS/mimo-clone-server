import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { Lessons } from "src/database/entities/Lessons.entity";
import { PrePostInteractionModules } from "src/database/entities/PrePostInteractionModules.entity";
import { Repository } from "typeorm";
import { UpdatePrePostInteractionModuleCommand } from "../prePostInteraction.command";

@CommandHandler(UpdatePrePostInteractionModuleCommand)
export class UpdatePrePostInteractionModuleHandler
  implements ICommandHandler<UpdatePrePostInteractionModuleCommand> {
    constructor(
        @Inject('PRE_POST_INTERACTION_REPOSITORY')
        private readonly repository: Repository<PrePostInteractionModules>,
        private readonly eventBus: EventBus
    ) {}

    async execute(command: UpdatePrePostInteractionModuleCommand): Promise<PrePostInteractionModules> {
        const { prePostInteractionId, content, contentType, visibleIf, output, type, lessonId } = command.updatePrePostInteractionModuleDto;
        const interactionModule = new PrePostInteractionModules();
        interactionModule.id = prePostInteractionId;
        interactionModule.content = content;
        interactionModule.contentType = contentType;
        interactionModule.visibleIf = visibleIf;
        interactionModule.output = output;
        interactionModule.type = type;
        const lesson = new Lessons();
        lesson.id = lessonId;
        interactionModule.lesson = lesson; 
        await this.repository.save(interactionModule);
        return interactionModule;
    }
}