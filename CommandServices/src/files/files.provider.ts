import { Files } from "src/database/entities/Files.entity";
import { DataSource } from "typeorm";

export const filesProviders = [
    {
        provide: 'FILES_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(Files),
        inject: ['DATA_SOURCE']
    },
]