import { Controller, Inject, Post, Body, Put, Param } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";
import { CreateFileDto } from "src/dto/request/createFile.dto";
import { UpdateFileDto } from "src/dto/request/updateFile.dto";

@Controller('files')
export class FilesController {
    constructor(
        @Inject('QUERY_SERVICE')
        private readonly filesQueryClient: ClientProxy,
        @Inject('COMMAND_SERVICE')
        private readonly filesCommandClient: ClientProxy,
    ) {}

    @Post()
    async createFile(
        @Body() createFileDto: CreateFileDto,
    ): Promise<any> {
        return this.filesCommandClient.send(
            { cmd: 'create_file' },
            createFileDto,
        );
    }

    @Put(':id')
    async updateFile(
        @Param('id') id: string,
        @Body() updateFileDto: UpdateFileDto,
    ): Promise<any> {
        updateFileDto.fileId = id;
        return this.filesCommandClient.send(
            { cmd: 'update_file' },
            updateFileDto,
        );
    }
}