import { Module } from '@nestjs/common';
import { DemoController } from './demo.controller';
import { DemoService } from './demo.service';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { CoursesController } from 'src/courses/courses.controller';

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
            {
                name: 'COURSES_SERVICE',
                transport: Transport.TCP,
                options: {
                    host: 'localhost',
                    port: 3001,
                },
            },
        ]),
    ],
    controllers: [DemoController, CoursesController],
    providers: [DemoService]
})
export class DemoModule {}
