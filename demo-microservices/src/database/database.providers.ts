import { DEVELOPMENT, PRODUCTION, TEST } from 'src/constant';
import { DataSource } from 'typeorm';
import { databaseConfig } from './database.config';
import { Courses } from './entities/Courses.entity';

export const databaseProviders = [
	{
		provide: 'DATA_SOURCE',
		useFactory: async () => {
			let config: any;
			switch (process.env.NODE_ENV.trim()) {
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
			console.log(config);
			const dataSource = new DataSource({
				type: config.type,
				host: config.host,
				port: config.port,
				username: config.username,
				password: config.password,
				database: config.database,
				 entities: [__dirname + '/../**/*.entity{.ts,.js}'],
				//entities: [__dirname + './entities/**/*.{ts,js}'],
				synchronize: true,
				ssl: config.ssl,
			});
			return dataSource.initialize();
		},
	},
];
