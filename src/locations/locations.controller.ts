import { Controller, Get, Param } from '@nestjs/common';
import { ApiUseTags } from '@nestjs/swagger';

import { Locations } from './entities/locations.entity';
import { LocationGameIndices } from './entities/location-game-indices.entity';
import { LocationNames } from './entities/location-names.entity';

@ApiUseTags('locations')
@Controller('locations')
export class LocationsController {
  @Get()
  async findAll(): Promise<Locations[]> {
    return Locations.find();
  }

  @Get('gameIndices')
  async findLocationGameIndices(): Promise<LocationGameIndices[]> {
    return LocationGameIndices.find();
  }

  @Get('names')
  async findLocationNames(): Promise<LocationNames[]> {
    return LocationNames.find();
  }

  @Get(':id')
  async findOne(@Param('id') id: number): Promise<Locations | undefined> {
    return Locations.findOne(id);
  }

  @Get('names/:id')
  async findLocationNameById(
    @Param('id') id: number,
  ): Promise<LocationNames | undefined> {
    return LocationNames.findOne(id);
  }
}
