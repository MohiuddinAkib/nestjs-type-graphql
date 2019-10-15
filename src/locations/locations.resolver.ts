import { Resolver, Query, Arg, Int } from 'type-graphql';

import { Locations } from './entities/locations.entity';
import { LocationGameIndices } from './entities/location-game-indices.entity';
import { LocationNames } from './entities/location-names.entity';

@Resolver()
export class LocationsResolver {
  @Query(returns => [Locations])
  async getLocations(): Promise<Locations[]> {
    return Locations.find();
  }

  @Query(returns => Locations, { nullable: true })
  async getLocationsById(
    @Arg('id', type => Int) id: number,
  ): Promise<Locations | undefined> {
    return Locations.findOne(id);
  }

  @Query(returns => [LocationNames])
  async getLocationNames(): Promise<LocationNames[]> {
    return LocationNames.find();
  }

  @Query(returns => LocationNames, { nullable: true })
  async getLocationNamesById(
    @Arg('id', type => Int) id: number,
  ): Promise<LocationNames | undefined> {
    return LocationNames.findOne(id);
  }

  @Query(returns => [LocationGameIndices])
  async getLocationGameIndices(): Promise<LocationGameIndices[]> {
    return LocationGameIndices.find();
  }

  @Query(returns => LocationNames, { nullable: true })
  async getLocationGameIndicesById(
    @Arg('id', type => Int) id: number,
  ): Promise<LocationGameIndices | undefined> {
    return LocationGameIndices.findOne(id);
  }
}
