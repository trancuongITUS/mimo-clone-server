import { CreateSectionDto } from "../dto/createSection.dto";

export class CreateSectionCommand {
    constructor(public readonly createSectionDto: CreateSectionDto) {}
  }