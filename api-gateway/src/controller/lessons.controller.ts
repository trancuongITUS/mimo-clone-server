import { Controller, Inject, Get, Param, Post, Body, Put, Query } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";
import { CreateLessonDto } from "src/dto/request/createLesson.dto";
import { UpdateLessonDto } from "src/dto/request/updateLesson.dto";

@Controller('lessons')
export class LessonsController {
	constructor(
		@Inject('QUERY_SERVICE')
		private readonly lessonsQueryClient: ClientProxy,
		@Inject('COMMAND_SERVICE')
		private readonly lessonsCommandClient: ClientProxy,
	) {}

	// @Get()
	// async getAll(): Promise<any> {
	// 	return this.lessonsQueryClient.send({ cmd: 'get_all_lessons' }, {});
	// }

	@Get(':id')
	async getById(@Param('id') id: string): Promise<any> {
		return this.lessonsQueryClient.send({ cmd: 'get_lesson' }, id);
	}

	@Get()
	async getByChapterId(@Query('chapterId') chapterId: string) {
		return this.lessonsQueryClient.send(
			{ cmd: 'get_lesson_by_chapterId' },
			chapterId,
		);
	}

	@Post()
	async createLesson(@Body() createLessonDto: CreateLessonDto): Promise<any> {
		return this.lessonsCommandClient.send(
			{ cmd: 'create_lesson' },
			createLessonDto,
		);
	}

	@Put(':id')
	async updateLesson(
		@Param('id') id: string,
		@Body() updateLessonDto: UpdateLessonDto,
	): Promise<any> {
		updateLessonDto.lessonId = id;
		return this.lessonsCommandClient.send(
			{ cmd: 'update_lesson' },
			updateLessonDto,
		);
	}
}