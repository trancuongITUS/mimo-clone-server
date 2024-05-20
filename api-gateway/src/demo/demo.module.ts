import { Module } from '@nestjs/common';
import { DemoController } from './demo.controller';
import { DemoService } from './demo.service';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { CoursesController } from 'src/controller/courses.controller';
import { ChaptersController } from 'src/controller/chapters.controller';
import { SectionsController } from 'src/controller/sections.controller';
import { TutorialsController } from 'src/controller/tutorials.controller';
import { AuthController } from 'src/controller/auth.controller';
import { FirebaseAuthService } from 'src/service/auth.service';

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
    controllers: [DemoController, CoursesController, ChaptersController, SectionsController, TutorialsController, AuthController],
    providers: [DemoService,FirebaseAuthService]
})
export class DemoModule {}
