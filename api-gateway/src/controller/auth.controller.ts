import { Body } from '@nestjs/common';
import {
	BadRequestException,
	Controller,
	Get,
	HttpStatus,
	Post,
	Req,
	UnauthorizedException,
} from '@nestjs/common';
import { Request } from 'express';
import { FirebaseAuthService } from '../service/auth.service';
import { UserDTO } from '../dto/user.dto';
import admin from 'src/main';
import { HttpService } from '@nestjs/axios';
import { firstValueFrom, map } from 'rxjs';

@Controller('authenticate')
export class AuthController {
	constructor(
		private authService: FirebaseAuthService,
		private readonly httpService: HttpService,
	) {}

	@Get()
	public async authenticate(@Req() req: Request): Promise<any> {
		const authToken = req.headers.authorization;

		if (!authToken) {
			throw new BadRequestException('Missing Authorization Header');
		}
		try {
			const { uid, email, role } =
				await this.authService.authenticate(authToken);
			return { uid, email, role, status: HttpStatus.OK };
		} catch (error) {
			throw new UnauthorizedException(error.message);
		}
	}

	@Post('/signin')
	public async createUser(
		@Req() req: Request,
		@Body() userDto: UserDTO,
	): Promise<any> {
		const { password, email, role } = userDto;
		try {
			const { uid } = await admin.auth().createUser({
				displayName: email,
				password,
				email,
			});
			await admin.auth().setCustomUserClaims(uid, { role });
			return { uid };
		} catch (error) {
			throw new UnauthorizedException(error.message);
		}
	}

	@Post('/login')
	async login(@Body() userDTO: UserDTO): Promise<any> {
		try {
			const loginRes = await firstValueFrom(
				this.httpService
					.post(
						'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=' +
							process.env.FIREBASE_API_KEY,
						{ ...userDTO, returnSecureToken: true },
					)
					.pipe(map((response) => response.data)),
			);
			return loginRes;
		} catch (err) {
			throw new UnauthorizedException(err.message);
		}
	}
}

