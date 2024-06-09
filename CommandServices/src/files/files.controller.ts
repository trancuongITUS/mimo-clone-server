import { Controller } from "@nestjs/common";
import { QueryBus, CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { CreateFileDto } from "./dto/createFile.dto";
import { UpdateFileDto } from "./dto/updateFile.dto";
import { CreateFileCommand, UpdateFileCommand } from "./commands/files.commands";

@Controller()
export class FilesController {
    constructor(
        private readonly queryBus: QueryBus,
        private readonly commandBus: CommandBus
    ) {}

    @MessagePattern({ cmd: 'create_file' })
    async createFile(createFileDto: CreateFileDto): Promise<any> {
        return await this.commandBus.execute(new CreateFileCommand(createFileDto));
    }

    @MessagePattern({ cmd: 'update_file' })
    async updateFile(updateFileDto: UpdateFileDto): Promise<any> {
        return await this.commandBus.execute(new UpdateFileCommand(updateFileDto));
    }
}