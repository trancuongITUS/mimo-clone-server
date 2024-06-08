import { Items } from "src/database/entities/Items.entity";
import { DataSource } from "typeorm";

export const itemsProviders = [{
    provide: 'ITEMS_REPOSITORY',
    useFactory: (dataSource: DataSource) => dataSource.getRepository(Items),
    inject: ['DATA_SOURCE']
}];