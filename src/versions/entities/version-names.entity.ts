import { BaseEntity, Entity, Column, PrimaryColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class VersionNames extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn()
  version_id: number;

  @Field()
  @Column('integer')
  version_group_id: number;

  @Field()
  @Column('text')
  identifier: string;
}
