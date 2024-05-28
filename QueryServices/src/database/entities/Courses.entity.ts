import { Column, Entity, Index, OneToMany } from 'typeorm';
import { Sections } from './Sections.entity';
import { UserCourseTraces } from './UserCourseTraces.entity';

@Index('courses_pkey', ['id'], { unique: true })
@Entity('courses', { schema: 'public' })
export class Courses {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('character varying', { name: 'name', nullable: true })
	name: string | null;

	@Column('character varying', { name: 'description', nullable: true })
	description: string | null;

	@Column('boolean', { name: 'is_published', nullable: true })
	isPublished: boolean | null;

	@Column('character varying', { name: 'icon_url', nullable: true })
	iconUrl: string | null;

	@OneToMany(() => Sections, (sections) => sections.course)
	sections: Sections[];

	@OneToMany(
		() => UserCourseTraces,
		(userCourseTraces) => userCourseTraces.course,
	)
	userCourseTraces: UserCourseTraces[];
}
