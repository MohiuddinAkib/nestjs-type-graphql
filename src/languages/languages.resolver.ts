import { Inject } from '@nestjs/common';
import { Resolver, Query, Arg, Int } from 'type-graphql';

import { Languages } from './entities/languages.entity';

@Resolver()
export class LanguagesResolver {
  @Query(returns => [Languages])
  getLanguages(): Promise<Languages[]> {
    return Languages.find();
  }

  @Query(returns => Languages, { nullable: true })
  async getLanguagesById(
    @Arg('id', type => Int) id: number,
  ): Promise<Languages | undefined> {
    return Languages.findOne(id);
  }
}
