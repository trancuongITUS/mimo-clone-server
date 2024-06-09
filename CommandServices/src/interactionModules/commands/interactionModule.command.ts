import { CreateInteractionModuleDto } from "../dto/createInteractionModule.dto";
import { UpdateInteractionModuleDto } from "../dto/updateInteractionModule.dto";

export class CreateInteractionModuleCommand {
    constructor(public readonly createInteractionModuleDto: CreateInteractionModuleDto) {}
  }

  export class UpdateInteractionModuleCommand {
    constructor(public readonly updateInteractionModuleDto: UpdateInteractionModuleDto) {}
  }