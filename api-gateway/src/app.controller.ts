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
    getSum(a: number, b: number): Observable<number> {
        return this.client.send(
            {cmd: 'sum'}, {a: a, b: b}
        );
    }
}
