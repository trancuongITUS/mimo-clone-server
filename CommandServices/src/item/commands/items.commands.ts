import { CreateItemDto } from "../dto/createItem.dto";
import { UpdateItemDto } from "../dto/updateItem.dto";

export class CreateItemCommand {
    constructor(public readonly createItemDto: CreateItemDto) {}
}

export class UpdateItemCommand {
    constructor(public readonly updateItemDto: UpdateItemDto) {}
}