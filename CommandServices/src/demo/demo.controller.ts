import { Controller } from '@nestjs/common';
import { MessagePattern } from '@nestjs/microservices';
import { DemoService } from './demo.service';

@Controller('demo')
export class DemoController {

    constructor(private readonly demoService: DemoService) {}

    @MessagePattern({ cmd: 'demo' })
    demo(): string {
        return this.demoService.demo();
    }
}
