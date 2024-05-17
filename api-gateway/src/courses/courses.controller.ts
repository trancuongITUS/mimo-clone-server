import { Controller, Get, Inject } from "@nestjs/common";
import { ClientProxy, MessagePattern } from "@nestjs/microservices";

@Controller("courses")
export class CoursesController {
    constructor(
        @Inject("COURSES_SERVICE") private readonly coursesServiceClient: ClientProxy
    ) {}

    @Get()
    async getHello(): Promise<any> {
     return this.coursesServiceClient.send({cmd: 'get_all_courses'}, {});
    }
}