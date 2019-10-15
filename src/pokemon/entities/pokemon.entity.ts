import {
  BaseEntity,
  Entity,
  Column,
  JoinColumn,
  PrimaryGeneratedColumn,
  OneToMany,
  OneToOne,
} from 'typeorm';

import { Field, ObjectType, ID } from 'type-graphql';
import { PokemonSpecies } from './pokemon-species.entity';

@Entity()
@ObjectType()
export class Pokemon extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  readonly id: number;

  @Column('text')
  @Field()
  identifier: string;

  @OneToOne(type => PokemonSpecies, species => species.id, { lazy: true })
  @Field(type => PokemonSpecies)
  @JoinColumn({ name: 'species_id' })
  species: PokemonSpecies;

  @Column('integer')
  @Field()
  species_id: number;

  @Column('integer')
  @Field()
  height: number;

  @Column('integer')
  @Field()
  weight: number;

  @Column('integer')
  @Field()
  base_experience: number;

  @Column('integer')
  @Field()
  order: number;

  @Column('boolean')
  @Field()
  is_default: boolean;
}
