import { BaseEntity, Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class AbilityChangelog extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Column('integer')
  @Field()
  ability_id: number;

  @Column('integer')
  @Field()
  changed_in_version_group_id: number;
}
