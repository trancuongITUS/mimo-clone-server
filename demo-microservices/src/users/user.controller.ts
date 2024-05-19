import { Controller, Get } from '@nestjs/common';

import { User } from './user.model';
import { UserService } from './user.service';

@Controller('User')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get()
  getAll(): Promise<User[]> {
    return this.userService.findAll();
  }
}
