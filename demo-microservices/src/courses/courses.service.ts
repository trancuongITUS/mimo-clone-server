import { Inject, Injectable } from "@nestjs/common";
import { Courses } from "src/database/entities/Courses.entity";
import { Files } from "src/database/entities/Files.entity";
import { Repository } from "typeorm";

@Injectable()
export class CoursesService {
    
    constructor(
        @Inject('COURSES_REPOSITORY')
        private coursesRepository: Repository<Courses>
    ) {}

    async getAll(): Promise<Courses[]> {
        // return this.coursesRepository
        // .createQueryBuilder("courses")
        // .leftJoinAndSelect("courses.sections", "sections")
        // .leftJoinAndSelect("sections.tutorials", "tutorials")
        // .leftJoinAndSelect("tutorials.chapters", "chapters")
        // .leftJoinAndSelect("chapters.lessons", "lessons")
        // .leftJoinAndSelect("lessons.interactionModules", "interaction_module")
        // .leftJoinAndSelect("lessons.prePostInteractionModules", "pre_post_interaction_modules")
        // .leftJoinAndSelect("interaction_module.files", "files")
        // .leftJoinAndSelect("interaction_module.interactionOptions", "interaction_option")
        // .leftJoinAndSelect("interaction_module.items", "items")
        // .leftJoinAndSelect("pre_post_interaction_modules.files", "files")
        // .getMany();
        
        return this.coursesRepository
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