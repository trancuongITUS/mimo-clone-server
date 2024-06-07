export class GetSectionsQuery {
	constructor(public readonly sectionId: string) {}
}

export class GetSectionsByCourseIdQuery {
	constructor(public readonly courseId: string) {}
}
