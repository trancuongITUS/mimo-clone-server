import { Column, Entity, Index, JoinColumn, ManyToOne } from 'typeorm';
import { InteractionModule } from './InteractionModule';

@Index('items_pkey', ['id'], { unique: true })
@Entity('items', { schema: 'public' })
export class Items {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('boolean', { name: 'correct', nullable: true })
	correct: boolean | null;

	@Column('integer', { name: 'value', nullable: true })
	value: number | null;

	@Column('character varying', { name: 'text', nullable: true })
	text: string | null;

	@ManyToOne(
		() => InteractionModule,
		(interactionModule) => interactionModule.items,
	)
	@JoinColumn([{ name: 'interaction_module_id', referencedColumnName: 'id' }])
	interactionModule: InteractionModule;
}
