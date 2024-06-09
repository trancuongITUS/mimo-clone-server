import { CreateSectionDto } from "../dto/createSection.dto";
import { UpdateSectionDto } from "../dto/updateSection.dto";

export class CreateSectionCommand {
    constructor(public readonly createSectionDto: CreateSectionDto) {}
  }

  export class UpdateSectionCommand {
    constructor(public readonly updateSectionDto: UpdateSectionDto) {}
  }