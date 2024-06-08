import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler } from "@nestjs/cqrs";
import { Repository } from "typeorm";
import { UpdateFileCommand } from "../files.commands";
import { Files } from "src/database/entities/Files.entity";
import { InteractionModule } from "src/database/entities/InteractionModule.entity";
import { PrePostInteractionModules } from "src/database/entities/PrePostInteractionModules.entity";

@CommandHandler(UpdateFileCommand)
export class UpdateFilesHandler implements ICommandHandler<UpdateFileCommand> {
    constructor(
        @Inject('FILES_REPOSITORY')
        private readonly repository: Repository<File>,
    ) {}

    async execute(command: UpdateFileCommand): Promise<File> {
        const { fileId, isInteractive, name, content, codeLanguage, interactionModuleId, preInteractionModuleId } = command.updateFileDto;

        

        const updatedFile = new Files();
        updatedFile.id = fileId; // Set the same ID
        updatedFile.isInteractive = isInteractive;
        updatedFile.name = name;
        updatedFile.content = content;
        updatedFile.codeLanguage = codeLanguage;

        const interactionModule = new InteractionModule();
        interactionModule.id = interactionModuleId;
        updatedFile.interactionModule = interactionModule;

        const prepostInteractionModule = new PrePostInteractionModules();
        prepostInteractionModule.id = preInteractionModuleId;
        updatedFile.preInteractionModule = prepostInteractionModule;
        // Save the updated file
        return await this.repository.save(updatedFile);
    }
}