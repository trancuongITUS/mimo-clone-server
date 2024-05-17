import { Controller, Get, Inject, Param } from "@nestjs/common";
import { ClientProxy, MessagePattern } from "@nestjs/microservices";

@Controller("courses")
export class CoursesController {
    constructor(
        @Inject("COURSES_SERVICE") private readonly coursesServiceClient: ClientProxy
    ) {}

    @Get()
    async getAll(): Promise<any> {
     return this.coursesServiceClient.send({cmd: 'get_all_courses'}, {});
    }

    @Get(':id')
    async getById(@Param('id') id) {
        return this.coursesServiceClient.send({cmd: 'get_course'}, id)
    }
}