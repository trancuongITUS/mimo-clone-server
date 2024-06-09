export class GetLessonQuery {
    constructor(public readonly lessonId: string) {}
}

export class GetLessonByChapterIdQuery {
    constructor(public readonly chapterId: string) {}
}
