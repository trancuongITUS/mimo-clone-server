import { CreateFileDto } from "../dto/createFile.dto";
import { UpdateFileDto } from "../dto/updateFile.dto";

export class CreateFileCommand {
    constructor(public readonly createFileDto: CreateFileDto) {}
}

export class UpdateFileCommand {
    constructor(public readonly updateFileDto: UpdateFileDto) {}
}