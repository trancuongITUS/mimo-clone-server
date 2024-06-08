import { PrePostInteractionModules } from "src/database/entities/PrePostInteractionModules.entity";
import { DataSource } from "typeorm";

export const prePostInteractionModulesProviders = [
    {
        provide: 'PRE_POST_INTERACTION_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(PrePostInteractionModules),
        inject: ['DATA_SOURCE']
    },
]