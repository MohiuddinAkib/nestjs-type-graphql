import { Module } from '@nestjs/common';

import { AbilitiesController } from './abilities.controller';
import { AbilitiesResolver } from './abilties.resolver';

@Module({
  controllers: [AbilitiesController],
  providers: [AbilitiesResolver],
})
export class AbilitiesModule {}
