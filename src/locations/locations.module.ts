import { Module } from '@nestjs/common';

import { LocationsController } from './locations.controller';
import { LocationsResolver } from './locations.resolver';

@Module({
  controllers: [LocationsController],
  providers: [LocationsResolver],
})
export class LocationsModule {}
