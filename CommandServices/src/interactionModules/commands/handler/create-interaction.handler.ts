import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { InteractionModule } from "src/database/entities/InteractionModule.entity";
import { Repository } from "typeorm";
import { CreateInteractionModuleCommand } from "../interactionModule.command";
import { Lessons } from "src/database/entities/Lessons.entity";

@CommandHandler(CreateInteractionModuleCommand)
export class CreateInteractionModuleHandler
  implements ICommandHandler<CreateInteractionModuleCommand> {
    constructor(
        @Inject('INTERACTION_REPOSITORY')
        private readonly repository: Repository<InteractionModule>,
        private readonly eventBus: EventBus
    ) {}

    async execute(command: CreateInteractionModuleCommand): Promise<InteractionModule> {
        const { type, output, wrongOptions, isCode, lessonId } = command.createInteractionModuleDto;
        const interactionModule = new InteractionModule();
        interactionModule.type = type;
        interactionModule.output = output;
        interactionModule.wrongOptions = wrongOptions;
        interactionModule.isCode = isCode;
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