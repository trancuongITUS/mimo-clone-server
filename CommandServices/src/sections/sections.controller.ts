import { Controller } from "@nestjs/common";
import { CommandBus, QueryBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { CreateSectionDto } from "./dto/createSection.dto";
import { CreateSectionCommand, UpdateSectionCommand } from "./commands/section.command";
import { UpdateSectionDto } from "./dto/updateSection.dto";

@Controller()
export class SectionsController {
	constructor(
		private readonly querybus: QueryBus,
		private readonly commandbus: CommandBus
	) {}



    @MessagePattern({ cmd: 'create_section'})
    async createSection(createSectionDto: CreateSectionDto): Promise<any> {
        return await this.commandbus.execute(new CreateSectionCommand(createSectionDto));
    }

    @MessagePattern({ cmd: 'update_section'})
    async updateSection(updateSectionDto: UpdateSectionDto): Promise<any> {
        return await this.commandbus.execute(new UpdateSectionCommand(updateSectionDto));
    }
    
}