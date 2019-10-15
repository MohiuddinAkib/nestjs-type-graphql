import { BaseEntity, Entity, Column, PrimaryColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class VersionGroupRegions extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn()
  version_group_id: number;

  @Field()
  @Column('integer')
  region_id: number;
}
