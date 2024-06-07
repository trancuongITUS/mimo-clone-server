import { CreateTutorialDto } from "../dto/createTutorial.dto";

export class CreateTutorialCommand {
    constructor(public readonly createTutorialDto: CreateTutorialDto) {}
  }