import { Controller } from "@nestjs/common";
import { QueryBus, CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { Tutorials } from "src/database/entities/Tutorials.entity";
import { CreateTutorialDto } from "./dto/createTutorial.dto";
import { CreateTutorialCommand, UpdateTutorialCommand } from "./commands/tutorial.command";
import { UpdateTutorialDto } from "./dto/updateTutorial.dto";

@Controller()
export class TutorialsController {
	constructor(
		private readonly querybus: QueryBus,
		private readonly commandbus: CommandBus
	) {}



    @MessagePattern({ cmd: 'create_tutorial'})
    async createTutorial(createTutorialDto: CreateTutorialDto): Promise<any> {
        return await this.commandbus.execute(new CreateTutorialCommand(createTutorialDto));
    }

    @MessagePattern({ cmd: 'update_tutorial'})
    async updateTutorial(updateTutorialDto: UpdateTutorialDto): Promise<any> {
        return await this.commandbus.execute(new UpdateTutorialCommand(updateTutorialDto));
    }
    
}