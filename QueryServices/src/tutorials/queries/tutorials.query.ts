export class GetTutorialsQuery {
	constructor(public readonly tutorialId: string) {}
}

export class GetTutorialsBySectionId {
	constructor(public readonly sectionId: string) {}
}
