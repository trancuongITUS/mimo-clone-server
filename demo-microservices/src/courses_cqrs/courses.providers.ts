import { Chapters } from "src/database/entities/Chapters.entity";
import { Courses } from "src/database/entities/Courses.entity";
import { Sections } from "src/database/entities/Sections.entity";
import { Tutorials } from "src/database/entities/Tutorials.entity";
import { DataSource } from "typeorm";

export const coursesProviders = [
    {
        provide: 'COURSES_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(Courses),
        inject: ['DATA_SOURCE']
    },
    {
        provide: 'CHAPTERS_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(Chapters),
        inject: ['DATA_SOURCE']
    },
    {
        provide: 'SECTIONS_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(Sections),
        inject: ['DATA_SOURCE']
    },
    {
        provide: 'TUTORIALS_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(Tutorials),
        inject: ['DATA_SOURCE']
    }
]