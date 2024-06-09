import { CreatePrePostInteractionModuleDto } from "../dto/createPrePostInteractionModule.dto";
import { UpdatePrePostInteractionModuleDto } from "../dto/updatePrePostInteractionModule.dto";

export class CreatePrePostInteractionModuleCommand {
    constructor(public readonly createPrePostInteractionModuleDto: CreatePrePostInteractionModuleDto) {}
}

export class UpdatePrePostInteractionModuleCommand {
    constructor(public readonly updatePrePostInteractionModuleDto: UpdatePrePostInteractionModuleDto) {}
}
