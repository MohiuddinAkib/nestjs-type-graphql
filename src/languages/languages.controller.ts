import { Controller, Get, Param } from '@nestjs/common';
import { ApiUseTags } from '@nestjs/swagger';

import { Languages } from './entities/languages.entity';

@ApiUseTags('languages')
@Controller('languages')
export class LanguagesController {
  @Get()
  async findAll(): Promise<Languages[]> {
    return Languages.find();
  }

  @Get(':id')
  async findOne(@Param('id') id: number): Promise<Languages | undefined> {
    return Languages.findOne(id);
  }
}
