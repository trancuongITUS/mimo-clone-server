import {
	Column,
	Entity,
	Index,
	JoinColumn,
	ManyToOne,
	OneToMany,
} from 'typeorm';
import { Chapters } from './Chapters.entity';
import { Sections } from './Sections.entity';

@Index('tutorials_pkey', ['id'], { unique: true })
@Entity('tutorials', { schema: 'public' })
export class Tutorials {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('character varying', { name: 'banner_icon_url', nullable: true })
	bannerIconUrl: string | null;

	@Column('character varying', { name: 'code_language', nullable: true })
	codeLanguage: string | null;

	@Column('character varying', {
		name: 'description_content',
		nullable: true,
	})
	descriptionContent: string | null;

	@Column('integer', { name: 'index', nullable: true })
	index: number | null;

	@Column('boolean', { name: 'iscompleted', nullable: true })
	iscompleted: boolean | null;

	@Column('character varying', { name: 'title', nullable: true })
	title: string | null;

	@Column('character varying', { name: 'type', nullable: true })
	type: string | null;

	@Column('integer', { name: 'version', nullable: true })
	version: number | null;

	@OneToMany(() => Chapters, (chapters) => chapters.tutorial)
	chapters: Chapters[];

	@ManyToOne(() => Sections, (sections) => sections.tutorials)
	@JoinColumn([{ name: 'section_id', referencedColumnName: 'id' }])
	section: Sections;
}
