import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';

import { Course } from './course.model';

@Injectable()
export class CourseService {
  constructor(
    @InjectModel(Course)
    private courseModel: typeof Course,
  ) {}

  async create(createUserDto: any): Promise<Course> {
    const course = new Course();
    course.name = createUserDto.name;
    course.image = createUserDto.description;
    return course.save();
  }

  async findAll(): Promise<Course[]> {
    return this.courseModel.findAll();
  }

  async findOne(id: string): Promise<Course> {
    return this.courseModel.findByPk(id);
  }

  async update(id: string, updateUserDto: any): Promise<[number]> {
    return this.courseModel.update(updateUserDto, {
      where: {
        id,
      },
    });
  }

  async remove(id: string): Promise<void> {
    const user = await this.findOne(id);
    await user.destroy();
  }
}
