import { Controller, Get, Inject } from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { ApiOperation, ApiTags } from '@nestjs/swagger';

@ApiTags('section')
@Controller('section')
export class SectionController {
  constructor(@Inject('COURSE_SERVICE') private readonly client: ClientProxy) {}

  @ApiOperation({summary: 'Get all sections'})
  @Get()
  getAllSections() {
    return this.client.send({ cmd: 'get_all_sections' }, {});
  }
}
