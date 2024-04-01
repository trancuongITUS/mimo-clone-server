import { Module } from '@nestjs/common';
import { DemoController } from './demo.controller';
import { DemoService } from './demo.service';
import { ClientsModule, Transport } from '@nestjs/microservices';

@Module({
    imports: [
        ClientsModule.register([
            {
                name: 'DEMO-SERVICE',
                transport: Transport.TCP,
                options: {
                    host: 'localhost',
                    port: 3000,
                },
            },
        ]),
    ],
    controllers: [DemoController],
    providers: [DemoService]
})
export class DemoModule {}
