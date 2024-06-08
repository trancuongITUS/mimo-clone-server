import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { Repository } from "typeorm";
import { CreateFileCommand } from "../files.commands";
import { Files } from "src/database/entities/Files.entity";
import { InteractionModule } from "src/database/entities/InteractionModule.entity";
import { PrePostInteractionModules } from "src/database/entities/PrePostInteractionModules.entity";

@CommandHandler(CreateFileCommand)
export class CreateFilesHandler implements ICommandHandler<CreateFileCommand> {
    constructor(
        @Inject('FILES_REPOSITORY')
        private readonly repository: Repository<File>,
        private readonly eventBus: EventBus
    ) {}

    async execute(command: CreateFileCommand): Promise<File> {
        const { isInteractive, name, content, codeLanguage, interactionModuleId, preInteractionModuleId } = command.createFileDto;

        const file = new Files();
        file.isInteractive = isInteractive;
        file.name = name;
        file.content = content;
        file.codeLanguage = codeLanguage;

        const interactionModule = new InteractionModule()
        interactionModule.id = interactionModuleId;
        file.interactionModule = interactionModule;

        const preinteractionModule = new PrePostInteractionModules();
        preinteractionModule.id = preInteractionModuleId;
        file.preInteractionModule = preinteractionModule;

        file.id = this.mongoObjectId();
        const createdFile = await this.repository.save(file);

        return createdFile;
    }

    private mongoObjectId(): string {
        const timestamp = (new Date().getTime() / 1000 | 0).toString(16);
        return timestamp + 'xxxxxxxxxxxxxxxx'.replace(/[x]/g, () => {
            return (Math.random() * 16 | 0).toString(16);
        }).toLowerCase();
    };
}