import { Module } from '@nestjs/common';
import { SectionController } from './section.controller';
import { ConnectionModule } from '../connection/connection.module';

@Module({
  imports: [ConnectionModule],
  controllers: [SectionController],
})
export class SectionModule {}
