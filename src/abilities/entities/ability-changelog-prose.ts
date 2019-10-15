import { BaseEntity, Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class AbilityChangelogProse extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Column('integer')
  @Field()
  local_language_id: number;

  @Column('text')
  @Field()
  effect: string;
}
