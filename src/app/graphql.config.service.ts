import { Injectable } from '@nestjs/common';
import { GqlOptionsFactory, GqlModuleOptions } from '@nestjs/graphql';
import { join } from 'path';
import { buildSchema } from 'type-graphql';
import { ConfigService } from './config/config.service';

@Injectable()
export class GraphqlConfigService implements GqlOptionsFactory {
  constructor(private readonly configService: ConfigService) {}
  async createGqlOptions(): Promise<GqlModuleOptions> {
    const schema = await buildSchema({
      resolvers: [__dirname + '../**/*.resolver.ts'],
    });

    return {
      debug: this.configService.isDevEnvironment,
      playground: true,
      schema,
    };
  }
}
