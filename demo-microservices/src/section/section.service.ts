import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';

@Injectable()
export class SectionService {
  constructor(private readonly prismaService: PrismaService) {}

  async getAllSections() {
    return await this.prismaService.sections.findMany();
  }
}
