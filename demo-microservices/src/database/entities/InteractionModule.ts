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
import { InteractionOption } from './InteractionOption';
import { Items } from './Items';

@Index('interaction_module_pkey', ['id'], { unique: true })
@Entity('interaction_module', { schema: 'public' })
export class InteractionModule {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('character varying', { name: 'type', nullable: true })
	type: string | null;

	@Column('character varying', { name: 'output', nullable: true })
	output: string | null;

	@Column('text', { name: 'wrong_options', nullable: true })
	wrongOptions: string | null;

	@Column('boolean', { name: 'is_code', nullable: true })
	isCode: boolean | null;

	@OneToMany(() => Files, (files) => files.interactionModule)
	files: Files[];

	@ManyToOne(() => Lessons, (lessons) => lessons.interactionModules)
	@JoinColumn([{ name: 'lesson_id', referencedColumnName: 'id' }])
	lesson: Lessons;

	@OneToMany(
		() => InteractionOption,
		(interactionOption) => interactionOption.interactionModule,
	)
	interactionOptions: InteractionOption[];

	@OneToMany(() => Items, (items) => items.interactionModule)
	items: Items[];
}
