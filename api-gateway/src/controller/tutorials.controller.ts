import { Controller, Inject, Get, Param, Body, Post } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";
import { CreateTutorialDto } from "src/dto/request/createTutorial.dto";

@Controller("tutorials")
export class TutorialsController {
    constructor(
        @Inject("COURSES_SERVICE") private readonly coursesServiceClient: ClientProxy
    ) {}

    @Get(':id')
    async getById(@Param('id') id) {
        return this.coursesServiceClient.send({cmd: 'get_tutorial'}, id)
    }

    @Post()
	async createTutorial(@Body() createTutorialDto: CreateTutorialDto): Promise<any> {
		return this.coursesServiceClient.send({ cmd: 'create_tutorial'}, createTutorialDto);
	}
}