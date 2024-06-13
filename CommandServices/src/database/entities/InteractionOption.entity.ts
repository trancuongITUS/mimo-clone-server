import { Column, Entity, Index, JoinColumn, ManyToOne } from 'typeorm';
import { InteractionModule } from './InteractionModule.entity';

@Index('interaction_option_pkey', ['id'], { unique: true })
@Entity('interaction_option', { schema: 'public' })
export class InteractionOption {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('integer', { name: 'start_index', nullable: true })
	startIndex: number | null;

	@Column('integer', { name: 'end_index', nullable: true })
	endIndex: number | null;

	@Column('integer', { name: 'start_line', nullable: true })
	startLine: number | null;

	@Column('integer', { name: 'start_pos', nullable: true })
	startPos: number | null;

	@Column('integer', { name: 'length', nullable: true })
	length: number | null;

	@Column('character varying', { name: 'value', nullable: true })
	value: string | null;

	@Column('boolean', { name: 'correct', nullable: true })
	correct: boolean | null;

	@ManyToOne(
		() => InteractionModule,
		(interactionModule) => interactionModule.interactionOptions,
		{onDelete: 'CASCADE'}
	)
	@JoinColumn([{ name: 'interaction_module_id', referencedColumnName: 'id' }])
	interactionModule: InteractionModule;
}
