import { CreateInteractionOptionDto } from "../dto/createInteracitonOption.dto";
import { UpdateInteractionOptionDto } from "../dto/updateInteractionOption.dto";

export class CreateInteractionOptionCommand {
    constructor(public readonly createInteractionOptionDto: CreateInteractionOptionDto) {}
}

export class UpdateInteractionOptionCommand {
    constructor(public readonly updateInteractionOptionDto: UpdateInteractionOptionDto) {}
}