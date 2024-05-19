import { Controller, Inject, Get, Param } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";

@Controller("chapters")
export class ChaptersController {
    constructor(
        @Inject("COURSES_SERVICE") private readonly coursesServiceClient: ClientProxy
    ) {}

    @Get(':id')
    async getById(@Param('id') id) {
        return this.coursesServiceClient.send({cmd: 'get_chapter'}, id)
    }
}