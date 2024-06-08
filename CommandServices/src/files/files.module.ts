import { Module } from "@nestjs/common";
import { CqrsModule } from "@nestjs/cqrs";
import { DatabaseModule } from "src/database/database.module";
import { filesProviders } from "./files.provider";
import { FilesController } from "./files.controller";
import { CreateFilesHandler } from "./commands/handler/create-files.handler";
import { UpdateFilesHandler } from "./commands/handler/update-files.handler";

export const CommandHandlers = [CreateFilesHandler, UpdateFilesHandler];
//export const EventHandlers = [FilesCreatedHandler];

@Module({
	imports: [DatabaseModule,CqrsModule],
	providers: [
		...filesProviders,
		...CommandHandlers,
		//...EventHandlers
	],
	controllers: [FilesController],
})
export class FilesCQRSModule {}