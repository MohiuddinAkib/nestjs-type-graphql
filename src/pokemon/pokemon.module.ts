import { Module } from '@nestjs/common';

import { PokemonController } from './pokemon.controller';
import { PokemonResolver } from './pokemon.resolver';

@Module({
  controllers: [PokemonController],
  providers: [PokemonResolver],
})
export class PokemonModule {}
