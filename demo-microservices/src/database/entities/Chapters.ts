import {
	Column,
	Entity,
	Index,
	JoinColumn,
	ManyToOne,
	OneToMany,
} from 'typeorm';
import { Tutorials } from './Tutorials';
import { Lessons } from './Lessons';

@Index('chapters_pkey', ['id'], { unique: true })
@Entity('chapters', { schema: 'public' })
export class Chapters {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('character varying', { name: 'type', nullable: true })
	type: string | null;

	@Column('character varying', { name: 'title', nullable: true })
	title: string | null;

	@Column('integer', { name: 'index', nullable: true })
	index: number | null;

	@ManyToOne(() => Tutorials, (tutorials) => tutorials.chapters)
	@JoinColumn([{ name: 'tutorial_id', referencedColumnName: 'id' }])
	tutorial: Tutorials;

	@OneToMany(() => Lessons, (lessons) => lessons.chapter)
	lessons: Lessons[];
}
