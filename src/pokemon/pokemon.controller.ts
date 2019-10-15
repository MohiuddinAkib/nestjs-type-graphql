import { Controller, Get, Param } from '@nestjs/common';
import { ApiUseTags } from '@nestjs/swagger';
import { Pokemon } from './entities/pokemon.entity';
import { PokemonEvolution } from './entities/pokemon-evolution.entity';
import { PokemonSpecies } from './entities/pokemon-species.entity';

@ApiUseTags('pokemon')
@Controller('pokemon')
export class PokemonController {
  @Get()
  async findAll(): Promise<Pokemon[]> {
    return Pokemon.find();
  }

  @Get('evolution')
  async findEvolution(): Promise<PokemonEvolution[]> {
    return PokemonEvolution.find();
  }

  @Get('species')
  async findSpecies(): Promise<PokemonSpecies[]> {
    return PokemonSpecies.find();
  }

  @Get(':id')
  async findOne(@Param('id') id: number): Promise<Pokemon | undefined> {
    return Pokemon.findOne(id);
  }

  @Get('evolution/:id')
  async findEvolutionById(
    @Param('id') id: number,
  ): Promise<PokemonEvolution | undefined> {
    return PokemonEvolution.findOne(id);
  }

  @Get('species/:id')
  async findSpeciesById(
    @Param('id') id: number,
  ): Promise<PokemonSpecies | undefined> {
    return PokemonSpecies.findOne(id);
  }
}
