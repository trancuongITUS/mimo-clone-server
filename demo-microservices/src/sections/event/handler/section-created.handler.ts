import { jsonEvent } from "@eventstore/db-client";
import { EventsHandler, IEventHandler } from "@nestjs/cqrs";
import { client } from "src/evenstore";
import { SectionCreatedEvent } from "../sections.event";

@EventsHandler(SectionCreatedEvent)
export class SectionCreatedHandler implements IEventHandler<SectionCreatedEvent> {

    handle(event: SectionCreatedEvent) {
        var stream = "SECTIONCREATED";
       var createdEvent = jsonEvent({
        type: "section created",
        data: {
            sectionId: event.section.id
        }
       });
        client.appendToStream(stream, [createdEvent]);
      }
}