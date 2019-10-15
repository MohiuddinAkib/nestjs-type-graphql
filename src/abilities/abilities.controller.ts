import { Controller, Get, Param } from '@nestjs/common';
import { ApiUseTags } from '@nestjs/swagger';

import { Abilities } from './entities/abilities.entity';

@ApiUseTags('abilities')
@Controller('abilities')
export class AbilitiesController {
  @Get()
  async findAll(): Promise<Abilities[]> {
    return Abilities.find();
  }

  @Get(':id')
  async findOne(@Param('id') id: number): Promise<Abilities | undefined> {
    return Abilities.findOne(id);
  }
}
