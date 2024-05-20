import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { LoggingInterceptor } from './interceptors/logging.interceptor';
import { TransformInterceptor } from './interceptors/transform.interceptor';
import { TimeoutInterceptor } from './interceptors/timeout.interceptor';
import * as admin from 'firebase-admin';
import * as dotenv from 'dotenv';

declare const module: any;

async function bootstrap() {
	dotenv.config();
	const app = await NestFactory.create(AppModule);
	admin.initializeApp({
		credential: admin.credential.cert({
			privateKey: process.env.FIREBASE_PRIVATE_KEY,
			clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
			projectId: process.env.FIREBASE_PROJECT_ID,
		} as Partial<admin.ServiceAccount>),
		databaseURL: process.env.FIREBASE_PRIVATE_KEY
	});
	/* Add global interceptors for application */
	app.useGlobalInterceptors(new LoggingInterceptor());
	app.useGlobalInterceptors(new TransformInterceptor());
	app.useGlobalInterceptors(new TimeoutInterceptor());

	await app.listen(8080);

	if (module.hot) {
		module.hot.accept();
		module.hot.dispose(() => app.close());
	}
}
export default admin;
bootstrap();
