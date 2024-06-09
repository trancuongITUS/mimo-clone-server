import { Chapters } from "src/database/entities/Chapters.entity";
import { DataSource } from "typeorm";

export const chaptersProviders = [

    {
        provide: 'CHAPTERS_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(Chapters),
        inject: ['DATA_SOURCE']
    },
]