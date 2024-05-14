import { Column, Entity, Index, OneToMany } from 'typeorm';
import { UserCourseTraces } from './UserCourseTraces';

@Index('users_pkey', ['userUid'], { unique: true })
@Entity('users', { schema: 'public' })
export class Users {
	@Column('character varying', { primary: true, name: 'user_uid' })
	userUid: string;

	@Column('character varying', { name: 'role', nullable: true })
	role: string | null;

	@OneToMany(
		() => UserCourseTraces,
		(userCourseTraces) => userCourseTraces.userU,
	)
	userCourseTraces: UserCourseTraces[];
}
