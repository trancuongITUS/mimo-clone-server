import { CommandHandler, ICommandHandler } from '@nestjs/cqrs';
import { Inject } from '@nestjs/common';
import { Repository } from 'typeorm';
import { EventBus } from '@nestjs/cqrs';
import { CreatePrePostInteractionModuleCommand } from '../prePostInteraction.command';
import { Lessons } from 'src/database/entities/Lessons.entity';
import { PrePostInteractionModules } from 'src/database/entities/PrePostInteractionModules.entity';

@CommandHandler(CreatePrePostInteractionModuleCommand)
export class CreatePrePostInteractionModuleHandler
  implements ICommandHandler<CreatePrePostInteractionModuleCommand> {
    constructor(
        @Inject('PRE_POST_INTERACTION_REPOSITORY')
        private readonly repository: Repository<PrePostInteractionModules>,
        private readonly eventBus: EventBus
    ) {}

    async execute(command: CreatePrePostInteractionModuleCommand): Promise<PrePostInteractionModules> {
        const { content, contentType, visibleIf, output, type, lessonId } = command.createPrePostInteractionModuleDto;
        const interactionModule = new PrePostInteractionModules();
        interactionModule.content = content;
        interactionModule.contentType = contentType;
        interactionModule.visibleIf = visibleIf;
        interactionModule.output = output;
        interactionModule.type = type;
        interactionModule.id = this.mongoObjectId();
        const lesson = new Lessons();
        lesson.id = lessonId;
        interactionModule.lesson = lesson; 
        await this.repository.save(interactionModule);
        return interactionModule;
    }

    private mongoObjectId = function () {
        const timestamp = (new Date().getTime() / 1000 | 0).toString(16);
        return timestamp + 'xxxxxxxxxxxxxxxx'.replace(/[x]/g, () => {
            return (Math.random() * 16 | 0).toString(16);
        }).toLowerCase();
    };
}
