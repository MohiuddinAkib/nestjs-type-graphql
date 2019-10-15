import { BaseEntity, Entity, Column, PrimaryColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class VersionGroupPokemonMoveMethods extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn()
  version_group_id: number;

  @Field()
  @Column('integer')
  pokemon_move_method_id: number;
}
