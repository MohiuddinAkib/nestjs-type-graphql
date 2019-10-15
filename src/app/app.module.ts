import { CacheModule, Module, CacheInterceptor } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { GraphQLModule } from '@nestjs/graphql';

import { ConfigModule } from './config/config.module';
import { GraphqlConfigService } from './graphql.config.service';
import { TypeOrmConfigService } from './typeorm.config.service';

import { AbilitiesModule } from '../abilities/abilities.module';
import { GendersModule } from '../genders/genders.module';
import { LanguagesModule } from '../languages/languages.module';
import { LocationsModule } from '../locations/locations.module';
import { PokemonModule } from '../pokemon/pokemon.module';
import { VersionsModule } from '../versions/versions.module';
import { APP_INTERCEPTOR } from '@nestjs/core';

@Module({
  imports: [
    CacheModule.register(),
    ConfigModule,
    GraphQLModule.forRootAsync({
      useClass: GraphqlConfigService,
    }),
    TypeOrmModule.forRootAsync({
      useClass: TypeOrmConfigService,
    }),
    AbilitiesModule,
    GendersModule,
    LanguagesModule,
    LocationsModule,
    PokemonModule,
    VersionsModule,
  ],
  providers: [
    {
      provide: APP_INTERCEPTOR,
      useClass: CacheInterceptor,
    },
  ],
})
export class AppModule {}
