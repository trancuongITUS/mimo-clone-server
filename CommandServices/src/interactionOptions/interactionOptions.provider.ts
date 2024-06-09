import { InteractionOption } from "src/database/entities/InteractionOption.entity";
import { DataSource } from "typeorm";

export const interactionOptionsProviders = [
    {
        provide: 'INTERACTION_OPTION_REPOSITORY',
        useFactory: (dataSource: DataSource) => dataSource.getRepository(InteractionOption),
        inject: ['DATA_SOURCE']
    },
]