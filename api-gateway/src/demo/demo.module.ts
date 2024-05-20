import { Module } from '@nestjs/common';
import { DemoController } from './demo.controller';
import { DemoService } from './demo.service';
import { ClientsModule, Transport } from '@nestjs/microservices';
import { CoursesController } from 'src/courses/courses.controller';
import { ChaptersController } from 'src/courses/chapters.controller';
import { SectionsController } from 'src/courses/sections.controller';
import { TutorialsController } from 'src/courses/tutorials.controller';
import { AuthController } from 'src/auth/auth.controller';
import { FirebaseAuthService } from 'src/auth/auth.service';

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
