import { Lessons } from "src/database/entities/Lessons.entity";
import { DataSource } from "typeorm";

export const lessonsProviders = [{
    provide: 'LESSONS_REPOSITORY',
    useFactory: (dataSource: DataSource) => dataSource.getRepository(Lessons),
    inject: ['DATA_SOURCE']
}];