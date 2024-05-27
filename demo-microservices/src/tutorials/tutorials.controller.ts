import { Controller } from "@nestjs/common";
import { QueryBus, CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { Tutorials } from "src/database/entities/Tutorials.entity";
import { CreateTutorialDto } from "./dto/createTutorial.dto";
import { CreateTutorialCommand } from "./commands/tutorial.command";
import { GetTutorialsQuery } from "./queries/tutorials.query";

@Controller()
export class TutorialsController {
	constructor(
		private readonly querybus: QueryBus,
		private readonly commandbus: CommandBus
	) {}


	@MessagePattern({ cmd: 'get_tutorial' })
	async getTutorial(tutorialId: string): Promise<Tutorials> {
		console.log('get tutorial')
		return await this.querybus.execute(new GetTutorialsQuery(tutorialId));
	}

    @MessagePattern({ cmd: 'create_tutorial'})
    async createTutorial(createTutorialDto: CreateTutorialDto): Promise<any> {
        return await this.commandbus.execute(new CreateTutorialCommand(createTutorialDto));
    }
    
}