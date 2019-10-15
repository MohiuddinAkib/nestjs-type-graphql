import { BaseEntity, Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class Locations extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  region_id?: number;

  @Column('text')
  @Field()
  identifier: string;
}
