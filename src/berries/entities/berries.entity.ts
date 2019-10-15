import { BaseEntity, Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { Field, ObjectType, ID } from 'type-graphql';

@Entity()
@ObjectType()
export class Berries extends BaseEntity {
  @Field(type => ID)
  @PrimaryGeneratedColumn()
  id: number;

  @Column('integer')
  @Field()
  item_id: number;

  @Column('integer')
  @Field()
  firmness_id: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  natural_gift_power?: number;

  @Column('integer', { nullable: true })
  @Field({ nullable: true })
  natural_gift_type_id?: number;

  @Column('integer')
  @Field()
  size: number;

  @Column('integer')
  @Field()
  max_harvest: number;

  @Column('integer')
  @Field()
  growth_time: number;

  @Column('integer')
  @Field()
  soil_dryness: number;

  @Column('integer')
  @Field()
  smoothness: number;
}
