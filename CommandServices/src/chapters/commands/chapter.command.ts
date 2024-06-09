import { CreateChapterDto } from "../dto/createChapter.dto";
import { UpdateChapterDto } from "../dto/updateChapter.dto";

export class CreateChapterCommand {
  constructor(public readonly createChapterDto: CreateChapterDto) {}
}

export class UpdateChapterCommand {
  constructor(public readonly updateChapterDto: UpdateChapterDto) {}
}