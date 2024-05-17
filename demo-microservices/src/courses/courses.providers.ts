import { Courses } from "src/database/entities/Courses.entity";
import { DataSource } from "typeorm";

export const coursesProviders = [
    {
        provide: 'COURSES_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(Courses),
        inject: ['DATA_SOURCE']
    }
]