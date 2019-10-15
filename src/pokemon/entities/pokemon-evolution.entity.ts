import {
  BaseEntity,
  Entity,
  Column,
  OneToOne,
  PrimaryGeneratedColumn,
  JoinColumn,
} from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

import { PokemonSpecies } from './pokemon-species.entity';

enum evolution_time_of_day {
  day,
  night,
}

@Entity()
@ObjectType()
export class PokemonEvolution extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @OneToOne(type => PokemonSpecies, species => species.id, { lazy: true })
  @Field(type => PokemonSpecies)
  @JoinColumn({ name: 'evolved_species_id' })
  evolved_species: PokemonSpecies;

  @Column('integer')
  @Field()
  evolved_species_id: number;

  @Column('integer')
  @Field()
  evolution_trigger_id: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  trigger_item_id?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  minimum_level?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  gender_id?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  location_id?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  held_item_id?: number;

  @Column('enum', { enum: evolution_time_of_day, nullable: true })
  @Field({ nullable: true })
  time_of_day?: evolution_time_of_day;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  known_move_id?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  known_move_type_id?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  minimum_happiness?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  minimum_beauty?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  minimum_affection?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  relative_physical_stats?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  party_species_id?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  party_type_id?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  trade_species_id?: number;

  @Column('boolean')
  @Field()
  needs_overworld_rain: boolean;

  @Column('boolean')
  @Field()
  turn_upside_down: boolean;
}
