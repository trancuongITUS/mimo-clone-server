import { Injectable, UnauthorizedException } from '@nestjs/common';
//import { Logger } from './logger/logger';
import admin from '../main';

@Injectable()
export class FirebaseAuthService {
  private getToken(authToken: string): string {
    const match = authToken.match(/^Bearer (.*)$/);
    if (!match || match.length < 2) {
      throw new UnauthorizedException('Invalid Authorization token - Token does not match Bearer .*');
    }
    return match[1];
  }
  public async authenticate(authToken: string): Promise<any> {
    const tokenString = this.getToken(authToken);
    try {
      const decodedToken: admin.auth.DecodedIdToken = await admin.auth().verifyIdToken(tokenString);
      //this.logger.info(`${JSON.stringify(decodedToken)}`);
      console.log(decodedToken);
      const  {
        email,
        uid,
        role
      } = decodedToken;
      return { email, uid, role};
    } catch (err) {
      //this.logger.error(`error while authenticate request ${err.message}`)
      throw new UnauthorizedException(err.message);
    }
  }
}