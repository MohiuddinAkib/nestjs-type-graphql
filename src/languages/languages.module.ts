import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { LanguagesController } from './languages.controller';
import { LanguagesResolver } from './languages.resolver';

import { Languages } from './entities/languages.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Languages])],
  controllers: [LanguagesController],
  providers: [LanguagesResolver],
})
export class LanguagesModule {}
