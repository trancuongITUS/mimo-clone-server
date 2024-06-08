import { Controller } from "@nestjs/common";
import { QueryBus, CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { CreateItemCommand, UpdateItemCommand } from "./commands/items.commands";
import { CreateItemDto } from "./dto/createItem.dto";
import { UpdateItemDto } from "./dto/updateItem.dto";

@Controller('items')
export class ItemsController {
    constructor(
        private readonly querybus: QueryBus,
        private readonly commandbus: CommandBus
    ) {}

    @MessagePattern({ cmd: 'create_item' })
    async createItem(createItemDto: CreateItemDto): Promise<any> {
        return await this.commandbus.execute(new CreateItemCommand(createItemDto));
    }

    @MessagePattern({ cmd: 'update_item' })
    async updateItem(updateItemDto: UpdateItemDto): Promise<any> {
        return await this.commandbus.execute(new UpdateItemCommand(updateItemDto));
    }
}