import { BaseEntity, Entity, Column, PrimaryColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class BerryFlavours extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn()
  berry_id: number;

  @Column('integer')
  @Field()
  contest_type_id: number;

  @Column('integer')
  @Field()
  flavour: number;
}
