import {
	Column,
	Entity,
	Index,
	JoinColumn,
	ManyToOne,
	OneToMany,
} from 'typeorm';
import { Courses } from './Courses';
import { Tutorials } from './Tutorials';

@Index('sections_pkey', ['id'], { unique: true })
@Entity('sections', { schema: 'public' })
export class Sections {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('character varying', { name: 'name', nullable: true })
	name: string | null;

	@Column('boolean', { name: 'is_locked', nullable: true })
	isLocked: boolean | null;

	@Column('character varying', { name: 'description', nullable: true })
	description: string | null;

	@Column('integer', { name: 'index', nullable: true })
	index: number | null;

	@ManyToOne(() => Courses, (courses) => courses.sections)
	@JoinColumn([{ name: 'course_id', referencedColumnName: 'id' }])
	course: Courses;

	@OneToMany(() => Tutorials, (tutorials) => tutorials.section)
	tutorials: Tutorials[];
}
