import { Controller, Get, Param } from '@nestjs/common';
import { ApiUseTags } from '@nestjs/swagger';

import { Versions } from './entities/versions.entity';
import { VersionGroups } from './entities/version-groups.entity';
import { VersionNames } from './entities/version-names.entity';
import { VersionGroupRegions } from './entities/version-group-regions.entity';
import { VersionGroupPokemonMoveMethods } from './entities/version-group-pokemon-move-methods';

@ApiUseTags('versions')
@Controller('versions')
export class VersionsController {
  @Get()
  async findAll(): Promise<Versions[]> {
    return Versions.find();
  }

  @Get('groups')
  async findGroups(): Promise<VersionGroups[]> {
    return VersionGroups.find();
  }

  @Get('names')
  async findNames(): Promise<VersionNames[]> {
    return VersionNames.find();
  }

  @Get('groupregions')
  async findGroupRegions(): Promise<VersionGroupRegions[]> {
    return VersionGroupRegions.find();
  }

  @Get('grouppokemonmovemethods')
  async findGroupPokemonMovemethods(): Promise<
    VersionGroupPokemonMoveMethods[]
  > {
    return VersionGroupPokemonMoveMethods.find();
  }

  @Get(':id')
  async findOne(@Param('id') id: number): Promise<Versions | undefined> {
    return Versions.findOne(id);
  }
}
