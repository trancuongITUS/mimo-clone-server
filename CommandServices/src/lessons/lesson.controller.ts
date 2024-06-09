import { Controller } from "@nestjs/common";
import { QueryBus, CommandBus } from "@nestjs/cqrs";
import { MessagePattern } from "@nestjs/microservices";
import { CreateLessonCommand, UpdateLessonCommand } from "./command/lessons.commands";
import { CreateLessonDto } from "./dto/createLesson.dto";
import { UpdateLessonDto } from "./dto/updateLesson.dto";

@Controller('lessons')
export class LessonsController {
    constructor(
        private readonly querybus: QueryBus,
        private readonly commandbus: CommandBus
    ) {}

    @MessagePattern({ cmd: 'create_lesson' })
    async createLesson(createLessonDto: CreateLessonDto): Promise<any> {
        return await this.commandbus.execute(new CreateLessonCommand(createLessonDto));
    }

    @MessagePattern({ cmd: 'update_lesson' })
    async updateLesson(updateLessonDto: UpdateLessonDto): Promise<any> {
        return await this.commandbus.execute(new UpdateLessonCommand(updateLessonDto));
    }
}
