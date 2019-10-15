import { BaseEntity, Entity, Column, PrimaryColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class ConquestEpisodeNames extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn()
  episode_id: number;

  @Column('integer')
  @Field()
  local_language_id: number;

  @Column('text')
  @Field()
  name: string;
}
