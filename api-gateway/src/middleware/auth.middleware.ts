import { Injectable, NestMiddleware, HttpException, HttpStatus } from "@nestjs/common";
import { NextFunction, Request, Response } from "express";
import { FirebaseAuthService } from "src/service/auth.service";

export interface RequestModel extends Request {
    user: any;
  }
@Injectable()
export class AuthMiddleware implements NestMiddleware {
  constructor(private readonly firebaseService: FirebaseAuthService){}

  public async use(req: RequestModel, _: Response, next: NextFunction) {
    try {
    const { authorization } = req.headers;
    if (!authorization) {
      throw new HttpException({ message: 'missing authz header' }, HttpStatus.BAD_REQUEST);
    }
    const user = await this.firebaseService.authenticate(authorization);
    console.log(user);
    req.user = user;
    next();
   } catch(err) {
    throw new HttpException({ message: 'invalid token' }, HttpStatus.UNAUTHORIZED);
   }
  }
}