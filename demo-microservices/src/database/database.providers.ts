import { DEVELOPMENT, PRODUCTION, TEST } from 'src/constant';
import { DataSource } from 'typeorm';
import { databaseConfig } from './database.config';

export const databaseProviders = [
	{
		provide: 'DATA_SOURCE',
		useFactory: async () => {
			let config: any;
			switch (process.env.NODE_ENV) {
				case DEVELOPMENT:
					config = databaseConfig.development;
					break;
				case TEST:
					config = databaseConfig.test;
					break;
				case PRODUCTION:
					config = databaseConfig.production;
					break;
				default:
					config = databaseConfig.development;
			}
			const dataSource = new DataSource({
				type: config.type,
				host: config.host,
				port: config.port,
				username: config.username,
				password: config.password,
				database: config.database,
				entities: [__dirname + '/../**/*.entity{.ts,.js}'],
				synchronize: true,
			});

			return dataSource.initialize();
		},
	},
];
