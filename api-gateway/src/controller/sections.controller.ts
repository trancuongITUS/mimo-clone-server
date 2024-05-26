import { Body, Controller, Get, Inject, Param, Post } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";
import { CreateSectionDto } from "src/dto/request/createSection.dto";

@Controller("sections")
export class SectionsController {
    constructor(
        @Inject("COURSES_SERVICE") private readonly coursesServiceClient: ClientProxy
    ) {}

    @Get(':id')
    async getById(@Param('id') id) {
        return this.coursesServiceClient.send({cmd: 'get_section'}, id)
    }

   
	@Post()
	async createSection(@Body() createSectionDto: CreateSectionDto): Promise<any> {
		return this.coursesServiceClient.send({ cmd: 'create_section'}, createSectionDto);
	}
}