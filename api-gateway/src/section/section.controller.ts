import { Controller, Get, Inject } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';

@Controller('section')
export class SectionController {
  constructor(
    @Inject('COURSE_SERVICE') private readonly client: ClientProxy,
  ) {}

  @Get()
  getAllSections() {
    return this.client.send({ cmd: 'get_all_sections' }, {});
  }
}
