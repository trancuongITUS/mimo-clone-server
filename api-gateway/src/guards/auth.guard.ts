import {
	Injectable,
	CanActivate,
	ExecutionContext,
	UnauthorizedException,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { FirebaseAdmin } from 'firebase.setup';

@Injectable()
export class AuthGuard implements CanActivate {
	constructor(
		private reflector: Reflector,
		private readonly admin: FirebaseAdmin,
	) {}

	async canActivate(context: ExecutionContext): Promise<boolean> {
		const app = this.admin.setup();
		const request = context.switchToHttp().getRequest();

		const idToken = context
			.getArgs()[0]
			?.headers?.authorization?.split(' ')[1];

		const permissions = this.reflector.get<string[]>(
			'permissions',
			context.getHandler(),
		);
		try {
			const claims = await app.auth().verifyIdToken(idToken);
			request.user = claims;
			if (permissions[0] === 'user' || claims.role === permissions[0]) {
				return true;
			}
			throw new UnauthorizedException();
		} catch (error) {
			console.log('Error', error);
			throw new UnauthorizedException();
		}
	}
}

