import { Controller, Get, Param } from '@nestjs/common';
import { ApiUseTags } from '@nestjs/swagger';

import { Genders } from './entities/genders.entity';

@ApiUseTags('genders')
@Controller('genders')
export class GendersController {
  @Get()
  async findAll(): Promise<Genders[]> {
    return Genders.find();
  }

  @Get(':id')
  async findOne(@Param('id') id: number): Promise<Genders | undefined> {
    return Genders.findOne(id);
  }
}
