import { Resolver, Query, Arg, Int } from 'type-graphql';

import { Pokemon } from './entities/pokemon.entity';
import { PokemonEvolution } from './entities/pokemon-evolution.entity';
import { PokemonSpecies } from './entities/pokemon-species.entity';

@Resolver()
export class PokemonResolver {
  @Query(returns => [Pokemon])
  async getPokemon(): Promise<Pokemon[]> {
    return Pokemon.find();
  }

  @Query(returns => Pokemon, { nullable: true })
  async getPokemonById(
    @Arg('id', type => Int) id: number,
  ): Promise<Pokemon | undefined> {
    return Pokemon.findOne(id);
  }

  @Query(returns => [PokemonEvolution])
  async getPokemonEvolution(): Promise<PokemonEvolution[]> {
    return PokemonEvolution.find();
  }

  @Query(returns => PokemonEvolution)
  async getPokemonEvolutionById(
    @Arg('id', type => Int) id: number,
  ): Promise<PokemonEvolution | undefined> {
    return PokemonEvolution.findOne(id);
  }

  @Query(returns => [PokemonSpecies])
  async getPokemonSpecies(): Promise<PokemonSpecies[]> {
    return PokemonSpecies.find();
  }

  @Query(returns => PokemonSpecies)
  async getPokemonSpeciesById(
    @Arg('id', type => Int) id: number,
  ): Promise<PokemonSpecies | undefined> {
    return PokemonSpecies.findOne(id);
  }
}
