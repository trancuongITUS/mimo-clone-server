import { Sections } from "src/database/entities/Sections.entity";

export class SectionCreatedEvent {
    constructor(
        public readonly section:Sections 
    ) {}
}