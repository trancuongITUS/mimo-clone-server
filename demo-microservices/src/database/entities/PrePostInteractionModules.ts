import {
	Column,
	Entity,
	Index,
	JoinColumn,
	ManyToOne,
	OneToMany,
} from 'typeorm';
import { Files } from './Files';
import { Lessons } from './Lessons';

@Index('pre_post_interaction_modules_pkey', ['id'], { unique: true })
@Entity('pre_post_interaction_modules', { schema: 'public' })
export class PrePostInteractionModules {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('text', { name: 'content', nullable: true })
	content: string | null;

	@Column('character varying', { name: 'content_type', nullable: true })
	contentType: string | null;

	@Column('character varying', { name: 'visible_if', nullable: true })
	visibleIf: string | null;

	@Column('character varying', { name: 'output', nullable: true })
	output: string | null;

	@Column('character varying', { name: 'type', nullable: true })
	type: string | null;

	@OneToMany(() => Files, (files) => files.preInteractionModule)
	files: Files[];

	@ManyToOne(() => Lessons, (lessons) => lessons.prePostInteractionModules)
	@JoinColumn([{ name: 'lesson_id', referencedColumnName: 'id' }])
	lesson: Lessons;
}
