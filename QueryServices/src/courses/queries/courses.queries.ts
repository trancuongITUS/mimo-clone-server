export class GetCoursesQuery {}
export class GetCourseByIdQuery {
	constructor(public readonly courseId: string) {}
}
export class GetChaptersQuery {
	constructor(public readonly chapterId: string) {}
}
export class GetTutorialsQuery {
	constructor(public readonly tutorialId: string) {}
}

export class GetChapterByTutorialId {
	constructor(public readonly tutorialId: string) {}
}

