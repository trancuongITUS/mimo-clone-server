import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MathController } from './controllers/math.controller';

@Module({
	imports: [],
	controllers: [AppController, MathController],
	providers: [AppService],
})
export class AppModule {}
