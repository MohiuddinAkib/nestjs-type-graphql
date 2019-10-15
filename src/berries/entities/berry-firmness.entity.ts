import { BaseEntity, Entity, Column, PrimaryColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class BerryFirmness extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn()
  id: number;

  @Column('text')
  @Field()
  identifer: string;
}
