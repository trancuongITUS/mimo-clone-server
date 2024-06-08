import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler } from "@nestjs/cqrs";
import { Items } from "src/database/entities/Items.entity";
import { Repository } from "typeorm";
import { UpdateItemCommand } from "../items.commands";
import { InteractionModule } from "src/database/entities/InteractionModule.entity";

@CommandHandler(UpdateItemCommand)
export class UpdateItemHandler implements ICommandHandler<UpdateItemCommand> {
    constructor(
        @Inject('ITEMS_REPOSITORY')
        private readonly repository: Repository<Items>,
    ) {}

    async execute(command: UpdateItemCommand): Promise<Items> {
        const { itemId, correct, value, text, interactionModuleId } = command.updateItemDto;

        let item = new Items();
        item.id=itemId;
        item.correct = correct;
        item.value = value;
        item.text = text;

        const interactionModule = new InteractionModule();
        interactionModule.id = interactionModuleId
        item.interactionModule = interactionModule;

        return await this.repository.save(item);
    }
}