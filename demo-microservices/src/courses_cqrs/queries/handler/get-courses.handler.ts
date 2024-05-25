import { IQueryHandler, QueryHandler } from "@nestjs/cqrs";
import { GetChaptersQuery, GetCourseByIdQuery, GetCoursesQuery, GetSectionsQuery, GetTutorialsQuery } from "../courses.queries";
import { Repository } from "typeorm";
import { Courses } from "src/database/entities/Courses.entity";
import { Inject } from "@nestjs/common";
import { Chapters } from "src/database/entities/Chapters.entity";
import { Sections } from "src/database/entities/Sections.entity";
import { Tutorials } from "src/database/entities/Tutorials.entity";

@QueryHandler(GetCoursesQuery)
export class GetCoursesHandler implements IQueryHandler<GetCoursesQuery> {
  constructor(
    @Inject('COURSES_REPOSITORY')
    private readonly repository: Repository<Courses>
) {}

  async execute(query: GetCoursesQuery): Promise<Courses[]> {
    return this.repository
    .createQueryBuilder('courses')
    .leftJoinAndSelect('courses.sections', 'sections')
    .leftJoinAndSelect('sections.tutorials', 'tutorials')
    .leftJoinAndSelect('tutorials.chapters', 'chapters')
    .leftJoinAndSelect('chapters.lessons', 'lessons')
    .leftJoinAndSelect('lessons.interactionModules', 'interaction_module')
    .leftJoinAndSelect('interaction_module.files', 'interaction_files')
    .leftJoinAndSelect('interaction_module.interactionOptions', 'interaction_option')
    .leftJoinAndSelect('interaction_module.items', 'items')
    .leftJoinAndSelect('lessons.prePostInteractionModules', 'pre_post_interaction_modules')
    .leftJoinAndSelect('pre_post_interaction_modules.files', 'pre_post_files')
    .getMany();
  }
}

@QueryHandler(GetCourseByIdQuery)
export class GetCourseByIdHandler implements IQueryHandler<GetCourseByIdQuery> {
  constructor(
    @Inject('COURSES_REPOSITORY')
    private readonly repository: Repository<Courses>
) {}

  async execute(query: GetCourseByIdQuery): Promise<Courses> {
    return this.repository
    .createQueryBuilder('courses')
    .leftJoinAndSelect('courses.sections', 'sections')
    .leftJoinAndSelect('sections.tutorials', 'tutorials')
    .leftJoinAndSelect('tutorials.chapters', 'chapters')
    .leftJoinAndSelect('chapters.lessons', 'lessons')
    .leftJoinAndSelect('lessons.interactionModules', 'interaction_module')
    .leftJoinAndSelect('interaction_module.files', 'interaction_files')
    .leftJoinAndSelect('interaction_module.interactionOptions', 'interaction_option')
    .leftJoinAndSelect('interaction_module.items', 'items')
    .leftJoinAndSelect('lessons.prePostInteractionModules', 'pre_post_interaction_modules')
    .leftJoinAndSelect('pre_post_interaction_modules.files', 'pre_post_files')
    .where("courses.id= :id", { id: query.courseId }).getOne();
  }
}

@QueryHandler(GetChaptersQuery)
export class GetChaptersHandler implements IQueryHandler<GetChaptersQuery> {
    constructor (
        @Inject('CHAPTERS_REPOSITORY')
        private readonly repository: Repository<Chapters>
    ) {}
    execute(query: GetChaptersQuery): Promise<Chapters> {
        
        return this.repository
        .createQueryBuilder('chapters')
        .leftJoinAndSelect('chapters.lessons', 'lessons')
        .leftJoinAndSelect('lessons.interactionModules', 'interaction_module')
        .leftJoinAndSelect('interaction_module.files', 'interaction_files')
        .leftJoinAndSelect('interaction_module.interactionOptions', 'interaction_option')
        .leftJoinAndSelect('interaction_module.items', 'items')
        .leftJoinAndSelect('lessons.prePostInteractionModules', 'pre_post_interaction_modules')
        .leftJoinAndSelect('pre_post_interaction_modules.files', 'pre_post_files')
        .where("chapters.id= :id", { id: query.chapterId }).getOne();
    }
}

@QueryHandler(GetSectionsQuery)
export class GetSectionsHandler implements IQueryHandler<GetSectionsQuery> {
    constructor (
        @Inject('SECTIONS_REPOSITORY')
        private readonly repository: Repository<Sections>
    ) {}
    execute(query: GetSectionsQuery): Promise<Sections> {
        return this.repository
        .createQueryBuilder('sections')
        .leftJoinAndSelect('sections.tutorials', 'tutorials')
        .leftJoinAndSelect('tutorials.chapters', 'chapters')
        .leftJoinAndSelect('chapters.lessons', 'lessons')
        .leftJoinAndSelect('lessons.interactionModules', 'interaction_module')
        .leftJoinAndSelect('interaction_module.files', 'interaction_files')
        .leftJoinAndSelect('interaction_module.interactionOptions', 'interaction_option')
        .leftJoinAndSelect('interaction_module.items', 'items')
        .leftJoinAndSelect('lessons.prePostInteractionModules', 'pre_post_interaction_modules')
        .leftJoinAndSelect('pre_post_interaction_modules.files', 'pre_post_files')
        .where("sections.id= :id", { id: query.sectionId }).getOne();
    }
}

@QueryHandler(GetTutorialsQuery)
export class GetTurorailsHandler implements IQueryHandler<GetTutorialsQuery> {
    constructor (
        @Inject('TUTORIALS_REPOSITORY')
        private readonly repository: Repository<Tutorials>
    ) {}
    execute(query: GetTutorialsQuery): Promise<Tutorials> {
      return this.repository
        .createQueryBuilder('tutorials')
        .leftJoinAndSelect('tutorials.chapters', 'chapters')
        .leftJoinAndSelect('chapters.lessons', 'lessons')
        .leftJoinAndSelect('lessons.interactionModules', 'interaction_module')
        .leftJoinAndSelect('interaction_module.files', 'interaction_files')
        .leftJoinAndSelect('interaction_module.interactionOptions', 'interaction_option')
        .leftJoinAndSelect('interaction_module.items', 'items')
        .leftJoinAndSelect('lessons.prePostInteractionModules', 'pre_post_interaction_modules')
        .leftJoinAndSelect('pre_post_interaction_modules.files', 'pre_post_files')
        .where("tutorials.id= :id", { id: query.tutorialId }).getOne();
    }
}