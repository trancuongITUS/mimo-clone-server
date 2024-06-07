import { Injectable } from '@nestjs/common';

@Injectable()
export class DemoService {
    demo(): string {
        return 'Hello from demo-microservices!';
    }
}
