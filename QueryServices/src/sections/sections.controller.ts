import { Controller } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { MessagePattern } from '@nestjs/microservices';
import {
	GetSectionsByCourseIdQuery,
	GetSectionsQuery,
} from './queries/sections.query';
import { Sections } from 'src/database/entities/Sections.entity';

@Controller()
export class SectionsController {
	constructor(
		private readonly querybus: QueryBus,
		private readonly commandbus: CommandBus,
	) {}

	@MessagePattern({ cmd: 'get_section' })
	async getSection(sectionId: string): Promise<Sections> {
		console.log('get section');
		return await this.querybus.execute(new GetSectionsQuery(sectionId));
	}

	@MessagePattern({ cmd: 'get_section_by_courseId' })
	async getSectionByBoard(courseId: string): Promise<Sections[]> {
		return await this.querybus.execute(
			new GetSectionsByCourseIdQuery(courseId),
		);
	}
}

