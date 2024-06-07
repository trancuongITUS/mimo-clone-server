export interface IDatabaseConfigAttributes {
	type?: string;
	host?: string;
	port?: number | string;
	username?: string;
	password?: string;
	database?: string;
	ssl?: boolean;
}

export interface IDatabaseConfig {
	development: IDatabaseConfigAttributes;
	production: IDatabaseConfigAttributes;
	test: IDatabaseConfigAttributes;
}
