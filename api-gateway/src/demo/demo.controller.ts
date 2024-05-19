import { Controller, Get, Inject } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { Observable } from 'rxjs';

@Controller('demo')
export class DemoController {
    constructor(@Inject('DEMO-SERVICE') private client: ClientProxy,) {}

    @Get()
    demo(): Observable<string> {
        return this.client.send({ cmd: 'demo' }, {});
    }
}
