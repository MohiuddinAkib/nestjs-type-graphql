import {
  BaseEntity,
  Entity,
  Column,
  OneToOne,
  JoinColumn,
  PrimaryColumn,
} from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class PokemonShapeProse extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn('integer')
  pokemon_shape_id: number;

  @Field()
  @Column('integer')
  local_language_id: number;

  @Field({ nullable: true })
  @Column('varchar', { length: 79, nullable: true })
  name: string;

  @Field({ nullable: true })
  @Column('varchar', { length: 79, nullable: true })
  awesome_name: string;

  @Field()
  @Column('text')
  description: string;
}
