import { IQueryHandler, QueryHandler } from "@nestjs/cqrs";
import { GetLessonByChapterIdQuery, GetLessonQuery } from "../lessons.queries";
import { Inject } from "@nestjs/common";
import { Repository } from "typeorm";
import { Lessons } from "src/database/entities/Lessons.entity";

@QueryHandler(GetLessonQuery)
export class GetLessonHandler implements IQueryHandler<GetLessonQuery> {
    constructor(
        @Inject('LESSONS_REPOSITORY')
        private readonly repository: Repository<Lessons>
    ) {}
    
    execute(query: GetLessonQuery): Promise<any> {
        return this.repository
        .createQueryBuilder('lessons')
        .leftJoinAndSelect('lessons.interactionModules','interaction_module')
        .leftJoinAndSelect('interaction_module.files', 'interaction_files')
		.leftJoinAndSelect('interaction_module.interactionOptions','interaction_option')
		.leftJoinAndSelect('interaction_module.items', 'items')
		.leftJoinAndSelect('lessons.prePostInteractionModules','pre_post_interaction_modules')
		.leftJoinAndSelect('pre_post_interaction_modules.files','pre_post_files')
        .where('lessons.id= :id', { id: query.lessonId })
		.getOne();
    }   
}

@QueryHandler(GetLessonByChapterIdQuery)
export class GetLessonByChapterIdHandler implements IQueryHandler<GetLessonByChapterIdQuery> {
    constructor(
        @Inject('LESSONS_REPOSITORY')
        private readonly repository: Repository<Lessons>
    ) {}
    
    execute(query: GetLessonByChapterIdQuery): Promise<any> {
        return this.repository
        .createQueryBuilder('lessons')
        .leftJoinAndSelect('lessons.interactionModules','interaction_module')
        .leftJoinAndSelect('interaction_module.files', 'interaction_files')
		.leftJoinAndSelect('interaction_module.interactionOptions','interaction_option')
		.leftJoinAndSelect('interaction_module.items', 'items')
		.leftJoinAndSelect('lessons.prePostInteractionModules','pre_post_interaction_modules')
		.leftJoinAndSelect('pre_post_interaction_modules.files','pre_post_files')
        .where('chapter_id= :id', { id: query.chapterId })
		.getOne();
    }
    
}