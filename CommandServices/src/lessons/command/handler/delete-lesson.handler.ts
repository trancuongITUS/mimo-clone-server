import { Inject } from "@nestjs/common";
import { CommandHandler, ICommandHandler } from "@nestjs/cqrs";
import { Lessons } from "src/database/entities/Lessons.entity";
import { Repository } from "typeorm";
import { DeleteLessonCommand } from "../lessons.commands";

@CommandHandler(DeleteLessonCommand)
export class DeleteLessonHandler
	implements ICommandHandler<DeleteLessonCommand>
{
	constructor(
		@Inject('LESSONS_REPOSITORY')
		private readonly repository: Repository<Lessons>,
	) {}

	async execute(command: DeleteLessonCommand): Promise<any> {
		var id = command.lessonId
		const lesson = await this.repository.findOne({ where: { id } });

		if (!lesson) {
		  throw new Error('Lesson not found');
		}
		console.log(lesson);
		// Remove the lesson
		await this.repository.remove(lesson);
		return { message: `Delete lesson with id: ${command.lessonId} successfully.` };
	}
}

