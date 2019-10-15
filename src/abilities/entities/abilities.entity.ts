import { BaseEntity, Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class Abilities extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Field()
  @Column('text')
  identifier: string;

  @Field()
  @Column('integer')
  generation_id: number;

  @Field()
  @Column('boolean')
  is_main_series: boolean;
}
