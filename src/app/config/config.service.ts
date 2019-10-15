import * as dotenv from 'dotenv';
import * as fs from 'fs';
import * as Joi from 'joi';

export interface EnvConfig {
  [key: string]: string;
}

export class ConfigService {
  private readonly envConfig: EnvConfig;

  constructor(filePath: string = '.env') {
    const config = dotenv.parse(fs.readFileSync(filePath));
    this.envConfig = this.validateInput(config);
  }

  /**
   * Ensures all needed variables are set, and returns the validated JavaScript object
   * including the applied default values.
   */
  private validateInput(envConfig: EnvConfig): EnvConfig {
    const envVarsSchema: Joi.ObjectSchema = Joi.object({
      NODE_ENV: Joi.string()
        .valid(['development', 'production', 'test', 'provision'])
        .default('development'),
      PG_HOST: Joi.string(),
      PG_PORT: Joi.number()
        .greater(0)
        .less(65536),
      PG_USERNAME: Joi.string(),
      PG_PASSWORD: Joi.string(),
      PG_DATABASE: Joi.string(),
    });

    const { error, value: validatedEnvConfig } = Joi.validate(
      envConfig,
      envVarsSchema,
    );
    if (error) {
      throw new Error(`Config validation error: ${error.message}`);
    }
    return validatedEnvConfig;
  }

  get isDevEnvironment(): boolean {
    return Boolean(this.envConfig.NODE_ENV === 'development');
  }

  get postgres() {
    return {
      host: this.envConfig.PG_HOST,
      username: this.envConfig.PG_USERNAME,
      password: this.envConfig.PG_PASSWORD,
      database: this.envConfig.PG_DATABASE,
    };
  }
}
