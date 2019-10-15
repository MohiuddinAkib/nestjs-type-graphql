import { Inject } from '@nestjs/common';
import { Resolver, Query, Arg, Int } from 'type-graphql';

import { Versions } from './entities/versions.entity';
import { VersionGroups } from './entities/version-groups.entity';
import { VersionNames } from './entities/version-names.entity';
import { VersionGroupRegions } from './entities/version-group-regions.entity';
import { VersionGroupPokemonMoveMethods } from './entities/version-group-pokemon-move-methods';

@Resolver()
export class VersionsResolver {
  @Query(returns => [Versions])
  getVersions(): Promise<Versions[]> {
    return Versions.find();
  }

  @Query(returns => [VersionGroups])
  getVersionGroups(): Promise<VersionGroups[]> {
    return VersionGroups.find();
  }

  @Query(returns => [VersionNames])
  getVersionNames(): Promise<VersionNames[]> {
    return VersionNames.find();
  }

  @Query(returns => [VersionGroupRegions])
  getVersionGroupRegions(): Promise<VersionGroupRegions[]> {
    return VersionGroupRegions.find();
  }

  @Query(returns => Versions, { nullable: true })
  async getVersionsById(
    @Arg('id', type => Int) id: number,
  ): Promise<Versions | undefined> {
    return Versions.findOne(id);
  }
}
