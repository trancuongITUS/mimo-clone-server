import { Controller } from '@nestjs/common';
import { SectionService } from './section.service';
import { MessagePattern } from '@nestjs/microservices';

@Controller('section')
export class SectionController {
  constructor(private readonly sectionService: SectionService) {}

  @MessagePattern({ cmd: 'get_all_sections' })
  async getAllSections() {
    return await this.sectionService.getAllSections();
  }
}
