import { Chapters } from 'src/database/entities/Chapters.entity';
import { Courses } from 'src/database/entities/Courses.entity';
import { UserCourseTraces } from 'src/database/entities/UserCourseTraces.entity';
import { DataSource } from 'typeorm';

export const coursesProviders = [
	{
		provide: 'COURSES_REPOSITORY',
		useFactory: (dataSource: DataSource) =>
			dataSource.getRepository(Courses),
		inject: ['DATA_SOURCE'],
	},
	{
		provide: 'CHAPTERS_REPOSITORY',
		useFactory: (dataSource: DataSource) =>
			dataSource.getRepository(Chapters),
		inject: ['DATA_SOURCE'],
	},
	{
		provide: 'USER_COURSE_TRACES_REPOSITORY',
		useFactory: (dataSource: DataSource) =>
			dataSource.getRepository(UserCourseTraces),
		inject: ['DATA_SOURCE'],
	},
];

