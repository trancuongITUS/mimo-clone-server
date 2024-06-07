import { Controller } from "@nestjs/common";
import { CommandBus, QueryBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { CreateSectionDto } from "./dto/createSection.dto";
import { CreateSectionCommand } from "./commands/section.command";

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
    
}