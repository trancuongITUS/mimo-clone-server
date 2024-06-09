import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler, EventBus } from "@nestjs/cqrs";
import { Items } from "src/database/entities/Items.entity";
import { Repository } from "typeorm";
import { CreateItemCommand } from "../items.commands";
import { InteractionModule } from "src/database/entities/InteractionModule.entity";

@CommandHandler(CreateItemCommand)
export class CreateItemHandler implements ICommandHandler<CreateItemCommand> {
    constructor(
        @Inject('ITEMS_REPOSITORY')
        private readonly repository: Repository<Items>,
        private readonly eventBus: EventBus,
    ) {}

    async execute(command: CreateItemCommand): Promise<Items> {
        const { correct, value, text, interactionModuleId } = command.createItemDto;

        const item = new Items();
        item.correct = correct;
        item.value = value;
        item.text = text;

        const interactionModule = new InteractionModule();
        interactionModule.id = interactionModuleId;
        item.interactionModule = interactionModule;

        item.id = this.generateObjectId();

        const savedItem = await this.repository.save(item);

        return savedItem;
    }

    private generateObjectId(): string {
        const timestamp = (new Date().getTime() / 1000 | 0).toString(16);
        return timestamp + 'xxxxxxxxxxxxxxxx'.replace(/[x]/g, () => (Math.random() * 16 | 0).toString(16)).toLowerCase();
    }

}