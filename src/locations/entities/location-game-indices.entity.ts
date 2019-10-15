import { BaseEntity, Entity, Column, PrimaryColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class LocationGameIndices extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn('integer')
  location_id: number;

  @Column('integer')
  @Field()
  generation_id: number;

  @Column('integer')
  @Field()
  game_index: number;
}
