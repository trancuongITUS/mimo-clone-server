import { Controller } from "@nestjs/common";
import { CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { Chapters } from "src/database/entities/Chapters.entity";
import { CreateChapterDto } from "./dto/createChapter.dto";
import { CreateChapterCommand, UpdateChapterCommand } from "./commands/chapter.command";
import { UpdateChapterDto } from "./dto/updateChapter.dto";

@Controller()
export class ChaptersController {
	constructor(
		private readonly commandbus: CommandBus
	) {}

	@MessagePattern({ cmd: 'create_chapter' })
	async createChapter(createChapterDto: CreateChapterDto): Promise<Chapters> {
		console.log("create chapter");
		return await this.commandbus.execute(new CreateChapterCommand(createChapterDto));
	}

	@MessagePattern({ cmd: 'update_chapter' })
	async updateChapter(updateChapterDto: UpdateChapterDto): Promise<Chapters> {
		console.log("update chapter");
		return await this.commandbus.execute(new UpdateChapterCommand(updateChapterDto));
	}

}