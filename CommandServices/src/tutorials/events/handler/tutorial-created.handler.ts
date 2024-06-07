import { jsonEvent } from "@eventstore/db-client";
import { EventsHandler, IEventHandler } from "@nestjs/cqrs";
import { client } from "src/evenstore";
import { TutorialCreatedEvent } from "../tutorials.event";

@EventsHandler(TutorialCreatedEvent)
export class TutorialCreatedHandler implements IEventHandler<TutorialCreatedEvent> {

    handle(event: TutorialCreatedEvent) {
        var stream = "TUTORIALCREATED";
       var createdEvent = jsonEvent({
        type: "tutorial created",
        data: {
            tutorialId: event.tutorial.id
        }
       });
        client.appendToStream(stream, [createdEvent]);
      }
}