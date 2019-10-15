import {
  BaseEntity,
  Entity,
  Column,
  JoinColumn,
  PrimaryGeneratedColumn,
  OneToOne,
} from 'typeorm';
import { Field, ID, ObjectType } from 'type-graphql';
import { PokemonShapes } from './pokemon-shapes.entity';
import { PokemonColors } from './pokemon-colors.entity';
@Entity()
@ObjectType()
export class PokemonSpecies extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  @OneToOne(type => PokemonSpecies, species => species.evolves_from_species)
  id: number;

  @Column('text')
  @Field()
  identifier: string;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  generation_id?: number;

  @OneToOne(type => PokemonSpecies, species => species.id, { lazy: true })
  @Field(type => PokemonSpecies, { nullable: true })
  @JoinColumn({ name: 'evolves_from_species_id' })
  evolves_from_species?: PokemonSpecies;

  @Column('integer', { nullable: true })
  evolves_from_species_id?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  evolution_chain_id?: number;

  @OneToOne(type => PokemonColors, colors => colors.id, { lazy: true })
  @Field(type => PokemonColors)
  @JoinColumn({ name: 'color_id' })
  color: PokemonColors;

  @Column('integer')
  @Field()
  color_id: number;

  @OneToOne(type => PokemonShapes, shapes => shapes.id, { lazy: true })
  @Field(type => PokemonShapes)
  @JoinColumn({ name: 'shape_id' })
  shape: PokemonShapes;

  @Column('integer')
  @Field()
  shape_id: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  habitat_id?: number;

  @Column('integer')
  @Field()
  gender_rate: number;

  @Column('integer')
  @Field()
  capture_rate: number;

  @Column('integer')
  @Field()
  base_happiness: number;

  @Column('boolean')
  @Field()
  is_baby: boolean;

  @Column('integer')
  @Field()
  hatch_counter: number;

  @Column('boolean')
  @Field()
  has_gender_differences: boolean;

  @Column('integer')
  @Field()
  growth_rate_id: number;

  @Column('boolean')
  @Field()
  forms_switchable: boolean;

  @Column('integer')
  @Field()
  order: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  conquest_order?: number;
}
