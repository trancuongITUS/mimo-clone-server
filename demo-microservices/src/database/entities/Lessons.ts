import {
	Column,
	Entity,
	Index,
	JoinColumn,
	ManyToOne,
	OneToMany,
} from 'typeorm';
import { InteractionModule } from './InteractionModule';
import { Chapters } from './Chapters';
import { PrePostInteractionModules } from './PrePostInteractionModules';

@Index('lessons_pkey', ['id'], { unique: true })
@Entity('lessons', { schema: 'public' })
export class Lessons {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('character varying', { name: 'type', nullable: true })
	type: string | null;

	@Column('integer', { name: 'index', nullable: true })
	index: number | null;

	@OneToMany(
		() => InteractionModule,
		(interactionModule) => interactionModule.lesson,
	)
	interactionModules: InteractionModule[];

	@ManyToOne(() => Chapters, (chapters) => chapters.lessons)
	@JoinColumn([{ name: 'chapter_id', referencedColumnName: 'id' }])
	chapter: Chapters;

	@OneToMany(
		() => PrePostInteractionModules,
		(prePostInteractionModules) => prePostInteractionModules.lesson,
	)
	prePostInteractionModules: PrePostInteractionModules[];
}
