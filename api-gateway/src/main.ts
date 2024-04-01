import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { LoggingInterceptor } from './interceptors/logging.interceptor';
import { TransformInterceptor } from './interceptors/transform.interceptor';
import { TimeoutInterceptor } from './interceptors/timeout.interceptor';

declare const module: any;

async function bootstrap() {
	const app = await NestFactory.create(AppModule);

	/* Add global interceptors for application */
	app.useGlobalInterceptors(new LoggingInterceptor());
	app.useGlobalInterceptors(new TransformInterceptor());
	app.useGlobalInterceptors(new TimeoutInterceptor());

	await app.listen(3001);

	if (module.hot) {
		module.hot.accept();
		module.hot.dispose(() => app.close());
	}
}
bootstrap();
