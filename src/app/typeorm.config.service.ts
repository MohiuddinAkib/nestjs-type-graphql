import { Injectable } from '@nestjs/common';
import { TypeOrmOptionsFactory, TypeOrmModuleOptions } from '@nestjs/typeorm';
import { ConfigService } from './config/config.service';

@Injectable()
export class TypeOrmConfigService implements TypeOrmOptionsFactory {
  private config: ConfigService;
  constructor(config: ConfigService) {
    this.config = config;
  }

  createTypeOrmOptions(): TypeOrmModuleOptions {
    return {
      type: 'postgres',
      ...this.config.postgres,
      entities: ['src/**/**.entity{.ts,.js}'],
      synchronize: false,
      logging: this.config.isDevEnvironment,
    };
  }
}
