import { BadRequestException, Body, Controller, Get, HttpStatus, Post, Req, UnauthorizedException } from "@nestjs/common";
import { Request } from 'express';
import { FirebaseAuthService } from "./auth.service";
import { UserDTO } from "./dto/user.dto";
import admin from "src/main";

@Controller('authenticate')
export class AuthController {
    constructor( private authService: FirebaseAuthService) {}

    @Get()
    public async authenticate(@Req() req: Request): Promise<any> {
        const authToken = req.headers.authorization;
    
        if (!authToken) {
          throw new BadRequestException('Missing Authorization Header');
        }
        try {
          const {uid, email,role } = await this.authService.authenticate(authToken);
          return { uid, email, role,  status: HttpStatus.OK };
        } catch (error) {
          throw new UnauthorizedException(error.message);
        }
      }

    @Post()
    public async createUser(@Req() req: Request, @Body() userDto: UserDTO): Promise<any> {
      const { password, email, role} = userDto
      try {
        const { uid } = await admin.auth().createUser({
          displayName: email,
          password,
          email
        })
        await admin.auth().setCustomUserClaims(uid, {role})
        return {uid};
      } catch (error) {
        throw new UnauthorizedException(error.message);
      }

    }
}