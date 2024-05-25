import { ICommand } from "@nestjs/cqrs";

export class CreateCourse implements ICommand{
    constructor (
        public readonly name: string,
        public readonly description: string,
        public readonly isPublished: boolean,
        public readonly iconUrl:  string,
    ) {}
}