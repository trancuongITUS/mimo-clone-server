import { Column, Entity, Index, JoinColumn, ManyToOne } from 'typeorm';
import { Courses } from './Courses.entity';
import { Users } from './Users.entity';

@Index('user_course_traces_pkey', ['id'], { unique: true })
@Entity('user_course_traces', { schema: 'public' })
export class UserCourseTraces {
	@Column('character varying', { primary: true, name: 'id' })
	id: string;

	@Column('character varying', { name: 'key', nullable: true })
	key: string | null;

	@Column('boolean', { name: 'is_favourite', nullable: true })
	isFavourite: boolean | null;

	@ManyToOne(() => Courses, (courses) => courses.userCourseTraces)
	@JoinColumn([{ name: 'course_id', referencedColumnName: 'id' }])
	course: Courses;

	@ManyToOne(() => Users, (users) => users.userCourseTraces)
	@JoinColumn([{ name: 'user_uid', referencedColumnName: 'userUid' }])
	userU: Users;
}
