import { Module } from '@nestjs/common';

import { GendersController } from './genders.controller';
import { GendersResolver } from './genders.resolver';

@Module({
  controllers: [GendersController],
  providers: [GendersResolver],
})
export class GendersModule {}
