import { BaseEntity, Entity, Column, PrimaryColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class ConquestEpisodeWarriors extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn()
  episode_id: number;

  @Column('integer')
  @Field()
  warrier_id: number;
}
