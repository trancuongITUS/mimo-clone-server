import { Sections } from "src/database/entities/Sections.entity";
import { DataSource } from "typeorm";

export const sectionsProviders = [
    {
        provide: 'SECTIONS_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(Sections),
        inject: ['DATA_SOURCE']
    },
]