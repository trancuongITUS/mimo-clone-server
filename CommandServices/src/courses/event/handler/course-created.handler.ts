import { EventsHandler, IEventHandler } from "@nestjs/cqrs";
import { CourseCreatedEvent } from "../courses.event";
import { jsonEvent } from "@eventstore/db-client";
import { client } from "src/evenstore";

@EventsHandler(CourseCreatedEvent)
export class CourseCreatedHandler implements IEventHandler<CourseCreatedEvent> {

    handle(event: CourseCreatedEvent) {
        var stream = "COURSECREATED";
       var createdEvent = jsonEvent({
        type: "course created",
        data: {
            courseId: event.course.id
        }
       });
        client.appendToStream(stream, createdEvent);
    }
}