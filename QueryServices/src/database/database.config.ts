import { configDotenv } from 'dotenv';
import { IDatabaseConfig } from './interfaces/db-config.interface';

configDotenv();
export const databaseConfig: IDatabaseConfig = {
	development: {
		type: process.env.DB_TYPE || 'postgres',
		host: process.env.DB_HOST || 'localhost',
		port: process.env.DB_PORT || 5432,
		username: process.env.DB_USERNAME || 'postgres',
		password: process.env.DB_PASSWORD || '1234',
		database: process.env.DB_NAME || 'Mimo',
		ssl: false,
	},
	/** TODO: change the environment of test and production environment. */
	test: {
		type: process.env.DB_TYPE || 'postgres',
		host: process.env.DB_HOST || 'localhost',
		port: process.env.DB_PORT || 5432,
		username: process.env.DB_USERNAME || 'postgres',
		password: process.env.DB_PASSWORD || '1234',
		database: process.env.DB_NAME || 'Mimo',
		ssl: false,
	},
	production: {
		type: process.env.DB_TYPE || 'postgres',
		host: process.env.DB_HOST || 'localhost',
		port: process.env.DB_PORT || 5432,
		username: process.env.DB_USERNAME || 'postgres',
		password: process.env.DB_PASSWORD || '1234',
		database: process.env.DB_NAME || 'Mimo',
		ssl: false,
	},
};
