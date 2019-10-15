import { BaseEntity, Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class Characteristics extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Column('integer')
  @Field()
  stat_id: number;

  @Column('integer')
  @Field()
  gene_mod_5: number;
}
