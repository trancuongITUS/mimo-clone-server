import { Tutorials } from "src/database/entities/Tutorials.entity";
import { DataSource } from "typeorm";

export const tutorialsProviders = [
    {
        provide: 'TUTORIALS_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(Tutorials),
        inject: ['DATA_SOURCE']
    },
]