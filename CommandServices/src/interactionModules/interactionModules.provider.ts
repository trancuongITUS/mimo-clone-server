import { InteractionModule } from "src/database/entities/InteractionModule.entity";
import { DataSource } from "typeorm";

export const interactionModulesProviders = [
    {
        provide: 'INTERACTION_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(InteractionModule),
        inject: ['DATA_SOURCE']
    },
]