import { BaseEntity, Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class LocationAreas extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Column('integer')
  @Field()
  location_id: number;

  @Column('integer')
  @Field()
  game_index: number;

  @Column('text')
  @Field()
  identifier: string;
}
