export class UpdateInteractionOptionDto {
    optionId: string
    startIndex: number
    endIndex: number
    startLine: number
    startPos: number
    length: number
    value: string
    correct: boolean
    interactionModuleId: string
}