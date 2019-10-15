import { Resolver, Query, Arg, Int } from 'type-graphql';

import { Genders } from './entities/genders.entity';

@Resolver()
export class GendersResolver {
  @Query(returns => [Genders])
  async getLocations(): Promise<Genders[]> {
    return Genders.find();
  }

  @Query(returns => Genders, { nullable: true })
  async getLocationsById(
    @Arg('id', type => Int) id: number,
  ): Promise<Genders | undefined> {
    return Genders.findOne(id);
  }
}
