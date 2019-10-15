import { Resolver, Query, Arg, Int } from 'type-graphql';

import { Abilities } from './entities/abilities.entity';
import { AbilityChangelog } from './entities/ability-changelog';
import { AbilityChangelogProse } from './entities/ability-changelog-prose';

@Resolver()
export class AbilitiesResolver {
  @Query(returns => [Abilities])
  async getAbilities(): Promise<Abilities[]> {
    return Abilities.find();
  }

  @Query(returns => Abilities, { nullable: true })
  async getAbilitiesById(
    @Arg('id', type => Int) id: number,
  ): Promise<Abilities | undefined> {
    return Abilities.findOne(id);
  }
}
