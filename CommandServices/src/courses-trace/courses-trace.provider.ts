import { UserCourseTraces } from 'src/database/entities/UserCourseTraces.entity';
import { DataSource } from 'typeorm';

export const coursesTraceProvider = [
	{
		provide: 'COURSES_TRACE_REPOSITORY',
		useFactory: (dataSource: DataSource) =>
			dataSource.getRepository(UserCourseTraces),
		inject: ['DATA_SOURCE'],
	},
];

