import { BaseEntity, Entity, Column, PrimaryColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class CharacteristicText extends BaseEntity {
  @Field(type => ID)
  @PrimaryColumn()
  characteristic_id: number;

  @Column('integer')
  @Field()
  local_language_id: number;

  @Column('text')
  @Field()
  message: string;
}
