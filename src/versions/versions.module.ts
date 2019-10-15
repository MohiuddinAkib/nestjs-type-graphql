import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { VersionsController } from './versions.controller';
import { VersionsResolver } from './versions.resolver';

import { Versions } from './entities/versions.entity';
import { VersionGroups } from './entities/version-groups.entity';
import { VersionNames } from './entities/version-names.entity';
import { VersionGroupRegions } from './entities/version-group-regions.entity';
// import { VersionGroupPokemonMoveMethods } from './entities/version-group-pokemon-move-methods';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      Versions,
      VersionGroups,
      VersionNames,
      VersionGroupRegions,
      // VersionGroupPokemonMoveMethods,
    ]),
  ],
  controllers: [VersionsController],
  providers: [VersionsResolver],
})
export class VersionsModule {}
