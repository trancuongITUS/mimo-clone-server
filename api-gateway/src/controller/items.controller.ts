import { Controller, Inject, Post, Body, Put, Param } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";
import { CreateItemDto } from "src/dto/request/createItem.dto";
import { UpdateItemDto } from "src/dto/request/updateItem.dto";

@Controller('items')
export class ItemsController {
    constructor(
        @Inject('QUERY_SERVICE')
        private readonly itemsQueryClient: ClientProxy,
        @Inject('COMMAND_SERVICE')
        private readonly itemsCommandClient: ClientProxy,
    ) {}

    @Post()
    async createItem(
        @Body() createItemDto: CreateItemDto,
    ): Promise<any> {
        return this.itemsCommandClient.send(
            { cmd: 'create_item' },
            createItemDto,
        );
    }

    @Put(':id')
    async updateItem(
        @Param('id') id: string,
        @Body() updateItemDto: UpdateItemDto,
    ): Promise<any> {
        updateItemDto.itemId = id;
        return this.itemsCommandClient.send(
            { cmd: 'update_item' },
            updateItemDto,
        );
    }
}