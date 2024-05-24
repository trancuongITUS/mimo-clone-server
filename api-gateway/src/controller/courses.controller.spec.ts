import { Test, TestingModule } from '@nestjs/testing';
import { CoursesController } from './courses.controller';
import { ClientProxy } from '@nestjs/microservices';
import { of } from 'rxjs';

describe('CoursesController', () => {
	let controller: CoursesController;
	let clientProxy: ClientProxy;

	beforeEach(async () => {
		const clientProxyMock = {
			send: jest.fn(),
		};

		const module: TestingModule = await Test.createTestingModule({
			controllers: [CoursesController],
			providers: [
				{
					provide: 'COURSES_SERVICE',
					useValue: clientProxyMock,
				},
			],
		}).compile();

		controller = module.get<CoursesController>(CoursesController);
		clientProxy = module.get<ClientProxy>('COURSES_SERVICE');
	});

	it('should be defined', () => {
		expect(controller).toBeDefined();
	});

	describe('getAll', () => {
		it('should call coursesServiceClient.send with the correct command', async () => {
			const result = [{ id: 1, name: 'Course 1' }];
			jest.spyOn(clientProxy, 'send').mockReturnValue(of(result));

			const response$ = await controller.getAll();
			response$.subscribe((response) => {
				expect(clientProxy.send).toHaveBeenCalledWith(
					{ cmd: 'get_all_courses' },
					{},
				);
				expect(response).toEqual(result);
			});
		});
	});

	describe('getById', () => {
		it('should call coursesServiceClient.send with the correct command and id', async () => {
			const result = { id: 1, name: 'Course 1' };
			jest.spyOn(clientProxy, 'send').mockReturnValue(of(result));

			const response$ = await controller.getById('1');
			response$.subscribe((response) => {
				expect(clientProxy.send).toHaveBeenCalledWith(
					{ cmd: 'get_course' },
					'1',
				);
				expect(response).toEqual(result);
			});
		});
	});
});

