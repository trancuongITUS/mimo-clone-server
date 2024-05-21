import { Test, TestingModule } from '@nestjs/testing';
import { CoursesController } from './courses.controller';
import { CoursesService } from './courses.service';
import { Courses } from 'src/database/entities/Courses.entity';
import { Chapters } from 'src/database/entities/Chapters.entity';

describe('CoursesController', () => {
	let controller: CoursesController;
	let service: CoursesService;

	beforeEach(async () => {
		const serviceMock = {
			getAll: jest.fn(),
			getById: jest.fn(),
			getChapter: jest.fn(),
			getSection: jest.fn(),
			getTutorial: jest.fn(),
		};

		const module: TestingModule = await Test.createTestingModule({
			controllers: [CoursesController],
			providers: [
				{
					provide: CoursesService,
					useValue: serviceMock,
				},
			],
		}).compile();

		controller = module.get<CoursesController>(CoursesController);
		service = module.get<CoursesService>(CoursesService);
	});

	it('should be defined', () => {
		expect(controller).toBeDefined();
	});

	describe('newBook', () => {
		it('should return an array of courses', async () => {
			const result: Courses = {
				id: '1',
				name: 'Course 1',
				description: '',
				isPublished: true,
				iconUrl: '',
				sections: [],
				userCourseTraces: [],
			};
			jest.spyOn(service, 'getAll').mockResolvedValue([result]);

			expect(await controller.newBook()).toEqual([result]);
			expect(service.getAll).toHaveBeenCalled();
		});
	});

	describe('getBook', () => {
		it('should return a course by id', async () => {
			const result: Courses = {
				id: '1',
				name: 'Course 1',
				description: '',
				isPublished: true,
				iconUrl: '',
				sections: [],
				userCourseTraces: [],
			};
			jest.spyOn(service, 'getById').mockResolvedValue(result);

			expect(await controller.getBook('1')).toBe(result);
			expect(service.getById).toHaveBeenCalledWith('1');
		});
	});

	describe('getChapter', () => {
		it('should return a chapter by id', async () => {
			const result: Chapters = {
				id: '6602fd05a8fc89e974fa3f2c',
				title: 'Creating Variables',
				index: 0,
				type: '',
				tutorial: null,
				lessons: [],
			};
			jest.spyOn(service, 'getChapter').mockResolvedValue(result);

			expect(await controller.getChapter('1')).toBe(result);
			expect(service.getChapter).toHaveBeenCalledWith('1');
		});
	});
});

