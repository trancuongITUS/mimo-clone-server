import { Tutorials } from "src/database/entities/Tutorials.entity";

export class TutorialCreatedEvent {
    constructor(
        public readonly tutorial:Tutorials 
    ) {}
}