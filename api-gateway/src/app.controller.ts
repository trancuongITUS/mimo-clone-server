import { Controller, Get, Inject } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { Observable } from 'rxjs';
import { AppService } from './app.service';

@Controller()
export class AppController {
	constructor(
		private readonly appService: AppService,
		@Inject('MATH-SERVICE') private client: ClientProxy,
	) {}

	@Get()
	getHello(): string {
		return this.appService.getHello();
	}

	@Get('sum')
	getSum(): Observable<number> {
		console.log('ClientProxy');
		return this.client.send({ cmd: 'sum' }, { a: 3, b: 2 });
	}
}
