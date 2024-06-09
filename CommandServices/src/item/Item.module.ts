import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { CreateItemHandler } from "./commands/handler/create-item.handler";
import { UpdateItemHandler } from "./commands/handler/update-item.handler";
import { ItemsController } from "./Item.controller";
import { itemsProviders } from "./Item.provider";

export const CommandHandlers = [CreateItemHandler, UpdateItemHandler];
//export const EventHandlers = [ItemCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...itemsProviders,
		...CommandHandlers,
		//...EventHandlers
	],
	controllers: [ItemsController],
})
export class ItemsCQRSModule {}