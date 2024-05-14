import { Column, Entity, Index, JoinColumn, ManyToOne } from 'typeorm';
import { InteractionModule } from './InteractionModule';
import { PrePostInteractionModules } from './PrePostInteractionModules';

@Index('files_pkey', ['id'], { unique: true })
@Entity('files', { schema: 'public' })
export class Files {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('boolean', { name: 'is_interactive', nullable: true })
	isInteractive: boolean | null;

	@Column('character varying', { name: 'name', nullable: true })
	name: string | null;

	@Column('text', { name: 'content', nullable: true })
	content: string | null;

	@Column('character varying', { name: 'code_language', nullable: true })
	codeLanguage: string | null;

	@ManyToOne(
		() => InteractionModule,
		(interactionModule) => interactionModule.files,
	)
	@JoinColumn([{ name: 'interaction_module_id', referencedColumnName: 'id' }])
	interactionModule: InteractionModule;

	@ManyToOne(
		() => PrePostInteractionModules,
		(prePostInteractionModules) => prePostInteractionModules.files,
	)
	@JoinColumn([
		{ name: 'pre_interaction_module_id', referencedColumnName: 'id' },
	])
	preInteractionModule: PrePostInteractionModules;
}
