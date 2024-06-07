import { CreateTutorialDto } from "../dto/createTutorial.dto";
import { UpdateTutorialDto } from "../dto/updateTutorial.dto";

export class CreateTutorialCommand {
    constructor(public readonly createTutorialDto: CreateTutorialDto) {}
  }

export class UpdateTutorialCommand {
  constructor(public readonly updateTutorialDto: UpdateTutorialDto) {}
}