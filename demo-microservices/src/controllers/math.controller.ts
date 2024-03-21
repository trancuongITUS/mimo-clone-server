import { Controller } from "@nestjs/common";
import { MessagePattern } from "@nestjs/microservices";

@Controller()
export class MathController {
    
    @MessagePattern({ cmd: 'sum' })
    sum(a: number, b: number): number {
        return a + b;
    }
}