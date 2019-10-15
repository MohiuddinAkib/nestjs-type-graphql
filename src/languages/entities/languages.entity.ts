import { BaseEntity, Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class Languages extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Column('text')
  @Field()
  iso639: string;

  @Column('text')
  @Field()
  iso3166: string;

  @Column('text')
  @Field()
  identifier: string;

  @Column('boolean')
  @Field()
  official: boolean;

  @Column('integer')
  @Field()
  order: number;
}
