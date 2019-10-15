--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-2.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pokemon_evolution_time_of_day; Type: TYPE; Schema: public; Owner: pokedex
--

CREATE TYPE public.pokemon_evolution_time_of_day AS ENUM (
    'day',
    'night'
);


ALTER TYPE public.pokemon_evolution_time_of_day OWNER TO pokedex;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: abilities; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.abilities (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    generation_id integer NOT NULL,
    is_main_series boolean NOT NULL
);


ALTER TABLE public.abilities OWNER TO pokedex;

--
-- Name: abilities_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.abilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abilities_id_seq OWNER TO pokedex;

--
-- Name: abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.abilities_id_seq OWNED BY public.abilities.id;


--
-- Name: ability_changelog; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.ability_changelog (
    id integer NOT NULL,
    ability_id integer NOT NULL,
    changed_in_version_group_id integer NOT NULL
);


ALTER TABLE public.ability_changelog OWNER TO pokedex;

--
-- Name: ability_changelog_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.ability_changelog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ability_changelog_id_seq OWNER TO pokedex;

--
-- Name: ability_changelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.ability_changelog_id_seq OWNED BY public.ability_changelog.id;


--
-- Name: ability_changelog_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.ability_changelog_prose (
    ability_changelog_id integer NOT NULL,
    local_language_id integer NOT NULL,
    effect text NOT NULL
);


ALTER TABLE public.ability_changelog_prose OWNER TO pokedex;

--
-- Name: ability_flavor_text; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.ability_flavor_text (
    ability_id integer NOT NULL,
    version_group_id integer NOT NULL,
    language_id integer NOT NULL,
    flavor_text text NOT NULL
);


ALTER TABLE public.ability_flavor_text OWNER TO pokedex;

--
-- Name: ability_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.ability_names (
    ability_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.ability_names OWNER TO pokedex;

--
-- Name: ability_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.ability_prose (
    ability_id integer NOT NULL,
    local_language_id integer NOT NULL,
    short_effect text,
    effect text
);


ALTER TABLE public.ability_prose OWNER TO pokedex;

--
-- Name: berries; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.berries (
    id integer NOT NULL,
    item_id integer NOT NULL,
    firmness_id integer NOT NULL,
    natural_gift_power integer,
    natural_gift_type_id integer,
    size integer NOT NULL,
    max_harvest integer NOT NULL,
    growth_time integer NOT NULL,
    soil_dryness integer NOT NULL,
    smoothness integer NOT NULL
);


ALTER TABLE public.berries OWNER TO pokedex;

--
-- Name: berries_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.berries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.berries_id_seq OWNER TO pokedex;

--
-- Name: berries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.berries_id_seq OWNED BY public.berries.id;


--
-- Name: berry_firmness; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.berry_firmness (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.berry_firmness OWNER TO pokedex;

--
-- Name: berry_firmness_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.berry_firmness_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.berry_firmness_id_seq OWNER TO pokedex;

--
-- Name: berry_firmness_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.berry_firmness_id_seq OWNED BY public.berry_firmness.id;


--
-- Name: berry_firmness_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.berry_firmness_names (
    berry_firmness_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.berry_firmness_names OWNER TO pokedex;

--
-- Name: berry_flavors; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.berry_flavors (
    berry_id integer NOT NULL,
    contest_type_id integer NOT NULL,
    flavor integer NOT NULL
);


ALTER TABLE public.berry_flavors OWNER TO pokedex;

--
-- Name: characteristic_text; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.characteristic_text (
    characteristic_id integer NOT NULL,
    local_language_id integer NOT NULL,
    message character varying(79) NOT NULL
);


ALTER TABLE public.characteristic_text OWNER TO pokedex;

--
-- Name: characteristics; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.characteristics (
    id integer NOT NULL,
    stat_id integer NOT NULL,
    gene_mod_5 integer NOT NULL
);


ALTER TABLE public.characteristics OWNER TO pokedex;

--
-- Name: characteristics_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.characteristics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characteristics_id_seq OWNER TO pokedex;

--
-- Name: characteristics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.characteristics_id_seq OWNED BY public.characteristics.id;


--
-- Name: conquest_episode_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_episode_names (
    episode_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.conquest_episode_names OWNER TO pokedex;

--
-- Name: conquest_episode_warriors; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_episode_warriors (
    episode_id integer NOT NULL,
    warrior_id integer NOT NULL
);


ALTER TABLE public.conquest_episode_warriors OWNER TO pokedex;

--
-- Name: conquest_episodes; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_episodes (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.conquest_episodes OWNER TO pokedex;

--
-- Name: conquest_episodes_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_episodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_episodes_id_seq OWNER TO pokedex;

--
-- Name: conquest_episodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_episodes_id_seq OWNED BY public.conquest_episodes.id;


--
-- Name: conquest_kingdom_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_kingdom_names (
    kingdom_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.conquest_kingdom_names OWNER TO pokedex;

--
-- Name: conquest_kingdoms; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_kingdoms (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.conquest_kingdoms OWNER TO pokedex;

--
-- Name: conquest_kingdoms_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_kingdoms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_kingdoms_id_seq OWNER TO pokedex;

--
-- Name: conquest_kingdoms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_kingdoms_id_seq OWNED BY public.conquest_kingdoms.id;


--
-- Name: conquest_max_links; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_max_links (
    warrior_rank_id integer NOT NULL,
    pokemon_species_id integer NOT NULL,
    max_link integer NOT NULL
);


ALTER TABLE public.conquest_max_links OWNER TO pokedex;

--
-- Name: conquest_move_data; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_move_data (
    move_id integer NOT NULL,
    power integer,
    accuracy integer,
    effect_chance integer,
    effect_id integer NOT NULL,
    range_id integer NOT NULL,
    displacement_id integer
);


ALTER TABLE public.conquest_move_data OWNER TO pokedex;

--
-- Name: conquest_move_displacement_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_move_displacement_prose (
    move_displacement_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    short_effect text,
    effect text
);


ALTER TABLE public.conquest_move_displacement_prose OWNER TO pokedex;

--
-- Name: conquest_move_displacements; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_move_displacements (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    affects_target boolean NOT NULL
);


ALTER TABLE public.conquest_move_displacements OWNER TO pokedex;

--
-- Name: conquest_move_displacements_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_move_displacements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_move_displacements_id_seq OWNER TO pokedex;

--
-- Name: conquest_move_displacements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_move_displacements_id_seq OWNED BY public.conquest_move_displacements.id;


--
-- Name: conquest_move_effect_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_move_effect_prose (
    conquest_move_effect_id integer NOT NULL,
    local_language_id integer NOT NULL,
    short_effect text,
    effect text
);


ALTER TABLE public.conquest_move_effect_prose OWNER TO pokedex;

--
-- Name: conquest_move_effects; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_move_effects (
    id integer NOT NULL
);


ALTER TABLE public.conquest_move_effects OWNER TO pokedex;

--
-- Name: conquest_move_effects_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_move_effects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_move_effects_id_seq OWNER TO pokedex;

--
-- Name: conquest_move_effects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_move_effects_id_seq OWNED BY public.conquest_move_effects.id;


--
-- Name: conquest_move_range_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_move_range_prose (
    conquest_move_range_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    description text
);


ALTER TABLE public.conquest_move_range_prose OWNER TO pokedex;

--
-- Name: conquest_move_ranges; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_move_ranges (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    targets integer NOT NULL
);


ALTER TABLE public.conquest_move_ranges OWNER TO pokedex;

--
-- Name: conquest_move_ranges_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_move_ranges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_move_ranges_id_seq OWNER TO pokedex;

--
-- Name: conquest_move_ranges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_move_ranges_id_seq OWNED BY public.conquest_move_ranges.id;


--
-- Name: conquest_pokemon_abilities; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_pokemon_abilities (
    pokemon_species_id integer NOT NULL,
    slot integer NOT NULL,
    ability_id integer NOT NULL
);


ALTER TABLE public.conquest_pokemon_abilities OWNER TO pokedex;

--
-- Name: conquest_pokemon_evolution; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_pokemon_evolution (
    evolved_species_id integer NOT NULL,
    required_stat_id integer,
    minimum_stat integer,
    minimum_link integer,
    kingdom_id integer,
    warrior_gender_id integer,
    item_id integer,
    recruiting_ko_required boolean NOT NULL
);


ALTER TABLE public.conquest_pokemon_evolution OWNER TO pokedex;

--
-- Name: conquest_pokemon_moves; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_pokemon_moves (
    pokemon_species_id integer NOT NULL,
    move_id integer NOT NULL
);


ALTER TABLE public.conquest_pokemon_moves OWNER TO pokedex;

--
-- Name: conquest_pokemon_stats; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_pokemon_stats (
    pokemon_species_id integer NOT NULL,
    conquest_stat_id integer NOT NULL,
    base_stat integer NOT NULL
);


ALTER TABLE public.conquest_pokemon_stats OWNER TO pokedex;

--
-- Name: conquest_stat_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_stat_names (
    conquest_stat_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.conquest_stat_names OWNER TO pokedex;

--
-- Name: conquest_stats; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_stats (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    is_base boolean NOT NULL
);


ALTER TABLE public.conquest_stats OWNER TO pokedex;

--
-- Name: conquest_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_stats_id_seq OWNER TO pokedex;

--
-- Name: conquest_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_stats_id_seq OWNED BY public.conquest_stats.id;


--
-- Name: conquest_transformation_pokemon; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_transformation_pokemon (
    transformation_id integer NOT NULL,
    pokemon_species_id integer NOT NULL
);


ALTER TABLE public.conquest_transformation_pokemon OWNER TO pokedex;

--
-- Name: conquest_transformation_warriors; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_transformation_warriors (
    transformation_id integer NOT NULL,
    present_warrior_id integer NOT NULL
);


ALTER TABLE public.conquest_transformation_warriors OWNER TO pokedex;

--
-- Name: conquest_warrior_archetypes; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_archetypes (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.conquest_warrior_archetypes OWNER TO pokedex;

--
-- Name: conquest_warrior_archetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_warrior_archetypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_warrior_archetypes_id_seq OWNER TO pokedex;

--
-- Name: conquest_warrior_archetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_warrior_archetypes_id_seq OWNED BY public.conquest_warrior_archetypes.id;


--
-- Name: conquest_warrior_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_names (
    warrior_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.conquest_warrior_names OWNER TO pokedex;

--
-- Name: conquest_warrior_rank_stat_map; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_rank_stat_map (
    warrior_rank_id integer NOT NULL,
    warrior_stat_id integer NOT NULL,
    base_stat integer NOT NULL
);


ALTER TABLE public.conquest_warrior_rank_stat_map OWNER TO pokedex;

--
-- Name: conquest_warrior_ranks; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_ranks (
    id integer NOT NULL,
    warrior_id integer NOT NULL,
    rank integer NOT NULL,
    skill_id integer NOT NULL
);


ALTER TABLE public.conquest_warrior_ranks OWNER TO pokedex;

--
-- Name: conquest_warrior_ranks_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_warrior_ranks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_warrior_ranks_id_seq OWNER TO pokedex;

--
-- Name: conquest_warrior_ranks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_warrior_ranks_id_seq OWNED BY public.conquest_warrior_ranks.id;


--
-- Name: conquest_warrior_skill_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_skill_names (
    skill_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.conquest_warrior_skill_names OWNER TO pokedex;

--
-- Name: conquest_warrior_skills; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_skills (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.conquest_warrior_skills OWNER TO pokedex;

--
-- Name: conquest_warrior_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_warrior_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_warrior_skills_id_seq OWNER TO pokedex;

--
-- Name: conquest_warrior_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_warrior_skills_id_seq OWNED BY public.conquest_warrior_skills.id;


--
-- Name: conquest_warrior_specialties; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_specialties (
    warrior_id integer NOT NULL,
    type_id integer NOT NULL,
    slot integer NOT NULL
);


ALTER TABLE public.conquest_warrior_specialties OWNER TO pokedex;

--
-- Name: conquest_warrior_stat_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_stat_names (
    warrior_stat_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.conquest_warrior_stat_names OWNER TO pokedex;

--
-- Name: conquest_warrior_stats; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_stats (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.conquest_warrior_stats OWNER TO pokedex;

--
-- Name: conquest_warrior_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_warrior_stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_warrior_stats_id_seq OWNER TO pokedex;

--
-- Name: conquest_warrior_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_warrior_stats_id_seq OWNED BY public.conquest_warrior_stats.id;


--
-- Name: conquest_warrior_transformation; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warrior_transformation (
    transformed_warrior_rank_id integer NOT NULL,
    is_automatic boolean NOT NULL,
    required_link integer,
    completed_episode_id integer,
    current_episode_id integer,
    distant_warrior_id integer,
    female_warlord_count integer,
    pokemon_count integer,
    collection_type_id integer,
    warrior_count integer
);


ALTER TABLE public.conquest_warrior_transformation OWNER TO pokedex;

--
-- Name: conquest_warriors; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.conquest_warriors (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    gender_id integer NOT NULL,
    archetype_id integer
);


ALTER TABLE public.conquest_warriors OWNER TO pokedex;

--
-- Name: conquest_warriors_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.conquest_warriors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conquest_warriors_id_seq OWNER TO pokedex;

--
-- Name: conquest_warriors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.conquest_warriors_id_seq OWNED BY public.conquest_warriors.id;


--
-- Name: contest_combos; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.contest_combos (
    first_move_id integer NOT NULL,
    second_move_id integer NOT NULL
);


ALTER TABLE public.contest_combos OWNER TO pokedex;

--
-- Name: contest_effect_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.contest_effect_prose (
    contest_effect_id integer NOT NULL,
    local_language_id integer NOT NULL,
    flavor_text text,
    effect text
);


ALTER TABLE public.contest_effect_prose OWNER TO pokedex;

--
-- Name: contest_effects; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.contest_effects (
    id integer NOT NULL,
    appeal smallint NOT NULL,
    jam smallint NOT NULL
);


ALTER TABLE public.contest_effects OWNER TO pokedex;

--
-- Name: contest_effects_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.contest_effects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_effects_id_seq OWNER TO pokedex;

--
-- Name: contest_effects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.contest_effects_id_seq OWNED BY public.contest_effects.id;


--
-- Name: contest_type_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.contest_type_names (
    contest_type_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    flavor text,
    color text
);


ALTER TABLE public.contest_type_names OWNER TO pokedex;

--
-- Name: contest_types; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.contest_types (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.contest_types OWNER TO pokedex;

--
-- Name: contest_types_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.contest_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_types_id_seq OWNER TO pokedex;

--
-- Name: contest_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.contest_types_id_seq OWNED BY public.contest_types.id;


--
-- Name: egg_group_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.egg_group_prose (
    egg_group_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.egg_group_prose OWNER TO pokedex;

--
-- Name: egg_groups; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.egg_groups (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.egg_groups OWNER TO pokedex;

--
-- Name: egg_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.egg_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.egg_groups_id_seq OWNER TO pokedex;

--
-- Name: egg_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.egg_groups_id_seq OWNED BY public.egg_groups.id;


--
-- Name: encounter_condition_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.encounter_condition_prose (
    encounter_condition_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.encounter_condition_prose OWNER TO pokedex;

--
-- Name: encounter_condition_value_map; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.encounter_condition_value_map (
    encounter_id integer NOT NULL,
    encounter_condition_value_id integer NOT NULL
);


ALTER TABLE public.encounter_condition_value_map OWNER TO pokedex;

--
-- Name: encounter_condition_value_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.encounter_condition_value_prose (
    encounter_condition_value_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.encounter_condition_value_prose OWNER TO pokedex;

--
-- Name: encounter_condition_values; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.encounter_condition_values (
    id integer NOT NULL,
    encounter_condition_id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    is_default boolean NOT NULL
);


ALTER TABLE public.encounter_condition_values OWNER TO pokedex;

--
-- Name: encounter_condition_values_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.encounter_condition_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encounter_condition_values_id_seq OWNER TO pokedex;

--
-- Name: encounter_condition_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.encounter_condition_values_id_seq OWNED BY public.encounter_condition_values.id;


--
-- Name: encounter_conditions; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.encounter_conditions (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.encounter_conditions OWNER TO pokedex;

--
-- Name: encounter_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.encounter_conditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encounter_conditions_id_seq OWNER TO pokedex;

--
-- Name: encounter_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.encounter_conditions_id_seq OWNED BY public.encounter_conditions.id;


--
-- Name: encounter_method_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.encounter_method_prose (
    encounter_method_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.encounter_method_prose OWNER TO pokedex;

--
-- Name: encounter_methods; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.encounter_methods (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.encounter_methods OWNER TO pokedex;

--
-- Name: encounter_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.encounter_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encounter_methods_id_seq OWNER TO pokedex;

--
-- Name: encounter_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.encounter_methods_id_seq OWNED BY public.encounter_methods.id;


--
-- Name: encounter_slots; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.encounter_slots (
    id integer NOT NULL,
    version_group_id integer NOT NULL,
    encounter_method_id integer NOT NULL,
    slot integer,
    rarity integer
);


ALTER TABLE public.encounter_slots OWNER TO pokedex;

--
-- Name: encounter_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.encounter_slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encounter_slots_id_seq OWNER TO pokedex;

--
-- Name: encounter_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.encounter_slots_id_seq OWNED BY public.encounter_slots.id;


--
-- Name: encounters; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.encounters (
    id integer NOT NULL,
    version_id integer NOT NULL,
    location_area_id integer NOT NULL,
    encounter_slot_id integer NOT NULL,
    pokemon_id integer NOT NULL,
    min_level integer NOT NULL,
    max_level integer NOT NULL
);


ALTER TABLE public.encounters OWNER TO pokedex;

--
-- Name: encounters_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.encounters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encounters_id_seq OWNER TO pokedex;

--
-- Name: encounters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.encounters_id_seq OWNED BY public.encounters.id;


--
-- Name: evolution_chains; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.evolution_chains (
    id integer NOT NULL,
    baby_trigger_item_id integer
);


ALTER TABLE public.evolution_chains OWNER TO pokedex;

--
-- Name: evolution_chains_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.evolution_chains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evolution_chains_id_seq OWNER TO pokedex;

--
-- Name: evolution_chains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.evolution_chains_id_seq OWNED BY public.evolution_chains.id;


--
-- Name: evolution_trigger_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.evolution_trigger_prose (
    evolution_trigger_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.evolution_trigger_prose OWNER TO pokedex;

--
-- Name: evolution_triggers; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.evolution_triggers (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.evolution_triggers OWNER TO pokedex;

--
-- Name: evolution_triggers_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.evolution_triggers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evolution_triggers_id_seq OWNER TO pokedex;

--
-- Name: evolution_triggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.evolution_triggers_id_seq OWNED BY public.evolution_triggers.id;


--
-- Name: experience; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.experience (
    growth_rate_id integer NOT NULL,
    level integer NOT NULL,
    experience integer NOT NULL
);


ALTER TABLE public.experience OWNER TO pokedex;

--
-- Name: genders; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.genders (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.genders OWNER TO pokedex;

--
-- Name: genders_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.genders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genders_id_seq OWNER TO pokedex;

--
-- Name: genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.genders_id_seq OWNED BY public.genders.id;


--
-- Name: generation_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.generation_names (
    generation_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.generation_names OWNER TO pokedex;

--
-- Name: generations; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.generations (
    id integer NOT NULL,
    main_region_id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.generations OWNER TO pokedex;

--
-- Name: generations_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.generations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generations_id_seq OWNER TO pokedex;

--
-- Name: generations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.generations_id_seq OWNED BY public.generations.id;


--
-- Name: growth_rate_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.growth_rate_prose (
    growth_rate_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.growth_rate_prose OWNER TO pokedex;

--
-- Name: growth_rates; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.growth_rates (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    formula text NOT NULL
);


ALTER TABLE public.growth_rates OWNER TO pokedex;

--
-- Name: growth_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.growth_rates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.growth_rates_id_seq OWNER TO pokedex;

--
-- Name: growth_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.growth_rates_id_seq OWNED BY public.growth_rates.id;


--
-- Name: item_categories; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_categories (
    id integer NOT NULL,
    pocket_id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.item_categories OWNER TO pokedex;

--
-- Name: item_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.item_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_categories_id_seq OWNER TO pokedex;

--
-- Name: item_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.item_categories_id_seq OWNED BY public.item_categories.id;


--
-- Name: item_category_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_category_prose (
    item_category_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.item_category_prose OWNER TO pokedex;

--
-- Name: item_flag_map; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_flag_map (
    item_id integer NOT NULL,
    item_flag_id integer NOT NULL
);


ALTER TABLE public.item_flag_map OWNER TO pokedex;

--
-- Name: item_flag_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_flag_prose (
    item_flag_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    description text
);


ALTER TABLE public.item_flag_prose OWNER TO pokedex;

--
-- Name: item_flags; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_flags (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.item_flags OWNER TO pokedex;

--
-- Name: item_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.item_flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_flags_id_seq OWNER TO pokedex;

--
-- Name: item_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.item_flags_id_seq OWNED BY public.item_flags.id;


--
-- Name: item_flavor_summaries; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_flavor_summaries (
    item_id integer NOT NULL,
    local_language_id integer NOT NULL,
    flavor_summary text
);


ALTER TABLE public.item_flavor_summaries OWNER TO pokedex;

--
-- Name: item_flavor_text; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_flavor_text (
    item_id integer NOT NULL,
    version_group_id integer NOT NULL,
    language_id integer NOT NULL,
    flavor_text text NOT NULL
);


ALTER TABLE public.item_flavor_text OWNER TO pokedex;

--
-- Name: item_fling_effect_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_fling_effect_prose (
    item_fling_effect_id integer NOT NULL,
    local_language_id integer NOT NULL,
    effect text NOT NULL
);


ALTER TABLE public.item_fling_effect_prose OWNER TO pokedex;

--
-- Name: item_fling_effects; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_fling_effects (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.item_fling_effects OWNER TO pokedex;

--
-- Name: item_fling_effects_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.item_fling_effects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_fling_effects_id_seq OWNER TO pokedex;

--
-- Name: item_fling_effects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.item_fling_effects_id_seq OWNED BY public.item_fling_effects.id;


--
-- Name: item_game_indices; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_game_indices (
    item_id integer NOT NULL,
    generation_id integer NOT NULL,
    game_index integer NOT NULL
);


ALTER TABLE public.item_game_indices OWNER TO pokedex;

--
-- Name: item_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_names (
    item_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.item_names OWNER TO pokedex;

--
-- Name: item_pocket_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_pocket_names (
    item_pocket_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.item_pocket_names OWNER TO pokedex;

--
-- Name: item_pockets; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_pockets (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.item_pockets OWNER TO pokedex;

--
-- Name: item_pockets_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.item_pockets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_pockets_id_seq OWNER TO pokedex;

--
-- Name: item_pockets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.item_pockets_id_seq OWNED BY public.item_pockets.id;


--
-- Name: item_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.item_prose (
    item_id integer NOT NULL,
    local_language_id integer NOT NULL,
    short_effect text,
    effect text
);


ALTER TABLE public.item_prose OWNER TO pokedex;

--
-- Name: items; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.items (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    category_id integer NOT NULL,
    cost integer NOT NULL,
    fling_power integer,
    fling_effect_id integer
);


ALTER TABLE public.items OWNER TO pokedex;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO pokedex;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: language_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.language_names (
    language_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.language_names OWNER TO pokedex;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    iso639 character varying(79) NOT NULL,
    iso3166 character varying(79) NOT NULL,
    identifier character varying(79) NOT NULL,
    official boolean NOT NULL,
    "order" integer
);


ALTER TABLE public.languages OWNER TO pokedex;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO pokedex;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: location_area_encounter_rates; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.location_area_encounter_rates (
    location_area_id integer NOT NULL,
    encounter_method_id integer NOT NULL,
    version_id integer NOT NULL,
    rate integer
);


ALTER TABLE public.location_area_encounter_rates OWNER TO pokedex;

--
-- Name: location_area_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.location_area_prose (
    location_area_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79)
);


ALTER TABLE public.location_area_prose OWNER TO pokedex;

--
-- Name: location_areas; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.location_areas (
    id integer NOT NULL,
    location_id integer NOT NULL,
    game_index integer NOT NULL,
    identifier character varying(79)
);


ALTER TABLE public.location_areas OWNER TO pokedex;

--
-- Name: location_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.location_areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_areas_id_seq OWNER TO pokedex;

--
-- Name: location_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.location_areas_id_seq OWNED BY public.location_areas.id;


--
-- Name: location_game_indices; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.location_game_indices (
    location_id integer NOT NULL,
    generation_id integer NOT NULL,
    game_index integer NOT NULL
);


ALTER TABLE public.location_game_indices OWNER TO pokedex;

--
-- Name: location_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.location_names (
    location_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.location_names OWNER TO pokedex;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    region_id integer,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.locations OWNER TO pokedex;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO pokedex;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: machines; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.machines (
    machine_number integer NOT NULL,
    version_group_id integer NOT NULL,
    item_id integer NOT NULL,
    move_id integer NOT NULL
);


ALTER TABLE public.machines OWNER TO pokedex;

--
-- Name: move_battle_style_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_battle_style_prose (
    move_battle_style_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.move_battle_style_prose OWNER TO pokedex;

--
-- Name: move_battle_styles; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_battle_styles (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.move_battle_styles OWNER TO pokedex;

--
-- Name: move_battle_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.move_battle_styles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.move_battle_styles_id_seq OWNER TO pokedex;

--
-- Name: move_battle_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.move_battle_styles_id_seq OWNED BY public.move_battle_styles.id;


--
-- Name: move_changelog; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_changelog (
    move_id integer NOT NULL,
    changed_in_version_group_id integer NOT NULL,
    type_id integer,
    power smallint,
    pp smallint,
    accuracy smallint,
    priority smallint,
    target_id integer,
    effect_id integer,
    effect_chance integer
);


ALTER TABLE public.move_changelog OWNER TO pokedex;

--
-- Name: move_damage_class_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_damage_class_prose (
    move_damage_class_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    description text
);


ALTER TABLE public.move_damage_class_prose OWNER TO pokedex;

--
-- Name: move_damage_classes; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_damage_classes (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.move_damage_classes OWNER TO pokedex;

--
-- Name: move_damage_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.move_damage_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.move_damage_classes_id_seq OWNER TO pokedex;

--
-- Name: move_damage_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.move_damage_classes_id_seq OWNED BY public.move_damage_classes.id;


--
-- Name: move_effect_changelog; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_effect_changelog (
    id integer NOT NULL,
    effect_id integer NOT NULL,
    changed_in_version_group_id integer NOT NULL
);


ALTER TABLE public.move_effect_changelog OWNER TO pokedex;

--
-- Name: move_effect_changelog_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.move_effect_changelog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.move_effect_changelog_id_seq OWNER TO pokedex;

--
-- Name: move_effect_changelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.move_effect_changelog_id_seq OWNED BY public.move_effect_changelog.id;


--
-- Name: move_effect_changelog_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_effect_changelog_prose (
    move_effect_changelog_id integer NOT NULL,
    local_language_id integer NOT NULL,
    effect text NOT NULL
);


ALTER TABLE public.move_effect_changelog_prose OWNER TO pokedex;

--
-- Name: move_effect_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_effect_prose (
    move_effect_id integer NOT NULL,
    local_language_id integer NOT NULL,
    short_effect text,
    effect text
);


ALTER TABLE public.move_effect_prose OWNER TO pokedex;

--
-- Name: move_effects; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_effects (
    id integer NOT NULL
);


ALTER TABLE public.move_effects OWNER TO pokedex;

--
-- Name: move_effects_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.move_effects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.move_effects_id_seq OWNER TO pokedex;

--
-- Name: move_effects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.move_effects_id_seq OWNED BY public.move_effects.id;


--
-- Name: move_flag_map; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_flag_map (
    move_id integer NOT NULL,
    move_flag_id integer NOT NULL
);


ALTER TABLE public.move_flag_map OWNER TO pokedex;

--
-- Name: move_flag_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_flag_prose (
    move_flag_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    description text
);


ALTER TABLE public.move_flag_prose OWNER TO pokedex;

--
-- Name: move_flags; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_flags (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.move_flags OWNER TO pokedex;

--
-- Name: move_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.move_flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.move_flags_id_seq OWNER TO pokedex;

--
-- Name: move_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.move_flags_id_seq OWNED BY public.move_flags.id;


--
-- Name: move_flavor_summaries; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_flavor_summaries (
    move_id integer NOT NULL,
    local_language_id integer NOT NULL,
    flavor_summary text
);


ALTER TABLE public.move_flavor_summaries OWNER TO pokedex;

--
-- Name: move_flavor_text; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_flavor_text (
    move_id integer NOT NULL,
    version_group_id integer NOT NULL,
    language_id integer NOT NULL,
    flavor_text text NOT NULL
);


ALTER TABLE public.move_flavor_text OWNER TO pokedex;

--
-- Name: move_meta; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_meta (
    move_id integer NOT NULL,
    meta_category_id integer NOT NULL,
    meta_ailment_id integer NOT NULL,
    min_hits integer,
    max_hits integer,
    min_turns integer,
    max_turns integer,
    drain integer NOT NULL,
    healing integer NOT NULL,
    crit_rate integer NOT NULL,
    ailment_chance integer NOT NULL,
    flinch_chance integer NOT NULL,
    stat_chance integer NOT NULL
);


ALTER TABLE public.move_meta OWNER TO pokedex;

--
-- Name: move_meta_ailment_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_meta_ailment_names (
    move_meta_ailment_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.move_meta_ailment_names OWNER TO pokedex;

--
-- Name: move_meta_ailments; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_meta_ailments (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.move_meta_ailments OWNER TO pokedex;

--
-- Name: move_meta_categories; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_meta_categories (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.move_meta_categories OWNER TO pokedex;

--
-- Name: move_meta_category_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_meta_category_prose (
    move_meta_category_id integer NOT NULL,
    local_language_id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.move_meta_category_prose OWNER TO pokedex;

--
-- Name: move_meta_stat_changes; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_meta_stat_changes (
    move_id integer NOT NULL,
    stat_id integer NOT NULL,
    change integer NOT NULL
);


ALTER TABLE public.move_meta_stat_changes OWNER TO pokedex;

--
-- Name: move_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_names (
    move_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.move_names OWNER TO pokedex;

--
-- Name: move_target_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_target_prose (
    move_target_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    description text
);


ALTER TABLE public.move_target_prose OWNER TO pokedex;

--
-- Name: move_targets; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.move_targets (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.move_targets OWNER TO pokedex;

--
-- Name: move_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.move_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.move_targets_id_seq OWNER TO pokedex;

--
-- Name: move_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.move_targets_id_seq OWNED BY public.move_targets.id;


--
-- Name: moves; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.moves (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    generation_id integer NOT NULL,
    type_id integer NOT NULL,
    power smallint,
    pp smallint,
    accuracy smallint,
    priority smallint NOT NULL,
    target_id integer NOT NULL,
    damage_class_id integer NOT NULL,
    effect_id integer NOT NULL,
    effect_chance integer,
    contest_type_id integer,
    contest_effect_id integer,
    super_contest_effect_id integer
);


ALTER TABLE public.moves OWNER TO pokedex;

--
-- Name: moves_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.moves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moves_id_seq OWNER TO pokedex;

--
-- Name: moves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.moves_id_seq OWNED BY public.moves.id;


--
-- Name: nature_battle_style_preferences; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.nature_battle_style_preferences (
    nature_id integer NOT NULL,
    move_battle_style_id integer NOT NULL,
    low_hp_preference integer NOT NULL,
    high_hp_preference integer NOT NULL
);


ALTER TABLE public.nature_battle_style_preferences OWNER TO pokedex;

--
-- Name: nature_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.nature_names (
    nature_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.nature_names OWNER TO pokedex;

--
-- Name: nature_pokeathlon_stats; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.nature_pokeathlon_stats (
    nature_id integer NOT NULL,
    pokeathlon_stat_id integer NOT NULL,
    max_change integer NOT NULL
);


ALTER TABLE public.nature_pokeathlon_stats OWNER TO pokedex;

--
-- Name: natures; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.natures (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    decreased_stat_id integer NOT NULL,
    increased_stat_id integer NOT NULL,
    hates_flavor_id integer NOT NULL,
    likes_flavor_id integer NOT NULL,
    game_index integer NOT NULL
);


ALTER TABLE public.natures OWNER TO pokedex;

--
-- Name: natures_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.natures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.natures_id_seq OWNER TO pokedex;

--
-- Name: natures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.natures_id_seq OWNED BY public.natures.id;


--
-- Name: pal_park; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pal_park (
    species_id integer NOT NULL,
    area_id integer NOT NULL,
    base_score integer NOT NULL,
    rate integer NOT NULL
);


ALTER TABLE public.pal_park OWNER TO pokedex;

--
-- Name: pal_park_area_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pal_park_area_names (
    pal_park_area_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.pal_park_area_names OWNER TO pokedex;

--
-- Name: pal_park_areas; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pal_park_areas (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.pal_park_areas OWNER TO pokedex;

--
-- Name: pal_park_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.pal_park_areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pal_park_areas_id_seq OWNER TO pokedex;

--
-- Name: pal_park_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.pal_park_areas_id_seq OWNED BY public.pal_park_areas.id;


--
-- Name: pokeathlon_stat_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokeathlon_stat_names (
    pokeathlon_stat_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.pokeathlon_stat_names OWNER TO pokedex;

--
-- Name: pokeathlon_stats; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokeathlon_stats (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.pokeathlon_stats OWNER TO pokedex;

--
-- Name: pokeathlon_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.pokeathlon_stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokeathlon_stats_id_seq OWNER TO pokedex;

--
-- Name: pokeathlon_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.pokeathlon_stats_id_seq OWNED BY public.pokeathlon_stats.id;


--
-- Name: pokedex_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokedex_prose (
    pokedex_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    description text
);


ALTER TABLE public.pokedex_prose OWNER TO pokedex;

--
-- Name: pokedex_version_groups; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokedex_version_groups (
    pokedex_id integer NOT NULL,
    version_group_id integer NOT NULL
);


ALTER TABLE public.pokedex_version_groups OWNER TO pokedex;

--
-- Name: pokedexes; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokedexes (
    id integer NOT NULL,
    region_id integer,
    identifier character varying(79) NOT NULL,
    is_main_series boolean NOT NULL
);


ALTER TABLE public.pokedexes OWNER TO pokedex;

--
-- Name: pokedexes_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.pokedexes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokedexes_id_seq OWNER TO pokedex;

--
-- Name: pokedexes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.pokedexes_id_seq OWNED BY public.pokedexes.id;


--
-- Name: pokemon; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    species_id integer,
    height integer NOT NULL,
    weight integer NOT NULL,
    base_experience integer NOT NULL,
    "order" integer NOT NULL,
    is_default boolean NOT NULL
);


ALTER TABLE public.pokemon OWNER TO pokedex;

--
-- Name: pokemon_abilities; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_abilities (
    pokemon_id integer NOT NULL,
    ability_id integer NOT NULL,
    is_hidden boolean NOT NULL,
    slot integer NOT NULL
);


ALTER TABLE public.pokemon_abilities OWNER TO pokedex;

--
-- Name: pokemon_color_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_color_names (
    pokemon_color_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.pokemon_color_names OWNER TO pokedex;

--
-- Name: pokemon_colors; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_colors (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.pokemon_colors OWNER TO pokedex;

--
-- Name: pokemon_dex_numbers; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_dex_numbers (
    species_id integer NOT NULL,
    pokedex_id integer NOT NULL,
    pokedex_number integer NOT NULL
);


ALTER TABLE public.pokemon_dex_numbers OWNER TO pokedex;

--
-- Name: pokemon_egg_groups; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_egg_groups (
    species_id integer NOT NULL,
    egg_group_id integer NOT NULL
);


ALTER TABLE public.pokemon_egg_groups OWNER TO pokedex;

--
-- Name: pokemon_evolution; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_evolution (
    id integer NOT NULL,
    evolved_species_id integer NOT NULL,
    evolution_trigger_id integer NOT NULL,
    trigger_item_id integer,
    minimum_level integer,
    gender_id integer,
    location_id integer,
    held_item_id integer,
    time_of_day public.pokemon_evolution_time_of_day,
    known_move_id integer,
    known_move_type_id integer,
    minimum_happiness integer,
    minimum_beauty integer,
    minimum_affection integer,
    relative_physical_stats integer,
    party_species_id integer,
    party_type_id integer,
    trade_species_id integer,
    needs_overworld_rain boolean NOT NULL,
    turn_upside_down boolean NOT NULL
);


ALTER TABLE public.pokemon_evolution OWNER TO pokedex;

--
-- Name: pokemon_evolution_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.pokemon_evolution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_evolution_id_seq OWNER TO pokedex;

--
-- Name: pokemon_evolution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.pokemon_evolution_id_seq OWNED BY public.pokemon_evolution.id;


--
-- Name: pokemon_form_generations; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_form_generations (
    pokemon_form_id integer NOT NULL,
    generation_id integer NOT NULL,
    game_index integer NOT NULL
);


ALTER TABLE public.pokemon_form_generations OWNER TO pokedex;

--
-- Name: pokemon_form_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_form_names (
    pokemon_form_id integer NOT NULL,
    local_language_id integer NOT NULL,
    form_name character varying(79),
    pokemon_name character varying(79)
);


ALTER TABLE public.pokemon_form_names OWNER TO pokedex;

--
-- Name: pokemon_form_pokeathlon_stats; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_form_pokeathlon_stats (
    pokemon_form_id integer NOT NULL,
    pokeathlon_stat_id integer NOT NULL,
    minimum_stat integer NOT NULL,
    base_stat integer NOT NULL,
    maximum_stat integer NOT NULL
);


ALTER TABLE public.pokemon_form_pokeathlon_stats OWNER TO pokedex;

--
-- Name: pokemon_forms; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_forms (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    form_identifier character varying(79),
    pokemon_id integer NOT NULL,
    introduced_in_version_group_id integer,
    is_default boolean NOT NULL,
    is_battle_only boolean NOT NULL,
    is_mega boolean NOT NULL,
    form_order integer NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.pokemon_forms OWNER TO pokedex;

--
-- Name: pokemon_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.pokemon_forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_forms_id_seq OWNER TO pokedex;

--
-- Name: pokemon_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.pokemon_forms_id_seq OWNED BY public.pokemon_forms.id;


--
-- Name: pokemon_game_indices; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_game_indices (
    pokemon_id integer NOT NULL,
    version_id integer NOT NULL,
    game_index integer NOT NULL
);


ALTER TABLE public.pokemon_game_indices OWNER TO pokedex;

--
-- Name: pokemon_habitat_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_habitat_names (
    pokemon_habitat_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.pokemon_habitat_names OWNER TO pokedex;

--
-- Name: pokemon_habitats; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_habitats (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.pokemon_habitats OWNER TO pokedex;

--
-- Name: pokemon_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.pokemon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_id_seq OWNER TO pokedex;

--
-- Name: pokemon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.pokemon_id_seq OWNED BY public.pokemon.id;


--
-- Name: pokemon_items; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_items (
    pokemon_id integer NOT NULL,
    version_id integer NOT NULL,
    item_id integer NOT NULL,
    rarity integer NOT NULL
);


ALTER TABLE public.pokemon_items OWNER TO pokedex;

--
-- Name: pokemon_move_method_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_move_method_prose (
    pokemon_move_method_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    description text
);


ALTER TABLE public.pokemon_move_method_prose OWNER TO pokedex;

--
-- Name: pokemon_move_methods; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_move_methods (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.pokemon_move_methods OWNER TO pokedex;

--
-- Name: pokemon_moves; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_moves (
    pokemon_id integer NOT NULL,
    version_group_id integer NOT NULL,
    move_id integer NOT NULL,
    pokemon_move_method_id integer NOT NULL,
    level integer NOT NULL,
    "order" integer
);


ALTER TABLE public.pokemon_moves OWNER TO pokedex;

--
-- Name: pokemon_shape_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_shape_prose (
    pokemon_shape_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    awesome_name character varying(79),
    description text
);


ALTER TABLE public.pokemon_shape_prose OWNER TO pokedex;

--
-- Name: pokemon_shapes; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_shapes (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.pokemon_shapes OWNER TO pokedex;

--
-- Name: pokemon_shapes_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.pokemon_shapes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_shapes_id_seq OWNER TO pokedex;

--
-- Name: pokemon_shapes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.pokemon_shapes_id_seq OWNED BY public.pokemon_shapes.id;


--
-- Name: pokemon_species; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_species (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    generation_id integer,
    evolves_from_species_id integer,
    evolution_chain_id integer,
    color_id integer NOT NULL,
    shape_id integer NOT NULL,
    habitat_id integer,
    gender_rate integer NOT NULL,
    capture_rate integer NOT NULL,
    base_happiness integer NOT NULL,
    is_baby boolean NOT NULL,
    hatch_counter integer NOT NULL,
    has_gender_differences boolean NOT NULL,
    growth_rate_id integer NOT NULL,
    forms_switchable boolean NOT NULL,
    "order" integer NOT NULL,
    conquest_order integer
);


ALTER TABLE public.pokemon_species OWNER TO pokedex;

--
-- Name: pokemon_species_flavor_summaries; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_species_flavor_summaries (
    pokemon_species_id integer NOT NULL,
    local_language_id integer NOT NULL,
    flavor_summary text
);


ALTER TABLE public.pokemon_species_flavor_summaries OWNER TO pokedex;

--
-- Name: pokemon_species_flavor_text; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_species_flavor_text (
    species_id integer NOT NULL,
    version_id integer NOT NULL,
    language_id integer NOT NULL,
    flavor_text text NOT NULL
);


ALTER TABLE public.pokemon_species_flavor_text OWNER TO pokedex;

--
-- Name: pokemon_species_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.pokemon_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_species_id_seq OWNER TO pokedex;

--
-- Name: pokemon_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.pokemon_species_id_seq OWNED BY public.pokemon_species.id;


--
-- Name: pokemon_species_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_species_names (
    pokemon_species_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79),
    genus text
);


ALTER TABLE public.pokemon_species_names OWNER TO pokedex;

--
-- Name: pokemon_species_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_species_prose (
    pokemon_species_id integer NOT NULL,
    local_language_id integer NOT NULL,
    form_description text
);


ALTER TABLE public.pokemon_species_prose OWNER TO pokedex;

--
-- Name: pokemon_stats; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_stats (
    pokemon_id integer NOT NULL,
    stat_id integer NOT NULL,
    base_stat integer NOT NULL,
    effort integer NOT NULL
);


ALTER TABLE public.pokemon_stats OWNER TO pokedex;

--
-- Name: pokemon_types; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.pokemon_types (
    pokemon_id integer NOT NULL,
    type_id integer NOT NULL,
    slot integer NOT NULL
);


ALTER TABLE public.pokemon_types OWNER TO pokedex;

--
-- Name: region_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.region_names (
    region_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.region_names OWNER TO pokedex;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.regions OWNER TO pokedex;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO pokedex;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: stat_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.stat_names (
    stat_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.stat_names OWNER TO pokedex;

--
-- Name: stats; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.stats (
    id integer NOT NULL,
    damage_class_id integer,
    identifier character varying(79) NOT NULL,
    is_battle_only boolean NOT NULL,
    game_index integer
);


ALTER TABLE public.stats OWNER TO pokedex;

--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_id_seq OWNER TO pokedex;

--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.stats_id_seq OWNED BY public.stats.id;


--
-- Name: super_contest_combos; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.super_contest_combos (
    first_move_id integer NOT NULL,
    second_move_id integer NOT NULL
);


ALTER TABLE public.super_contest_combos OWNER TO pokedex;

--
-- Name: super_contest_effect_prose; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.super_contest_effect_prose (
    super_contest_effect_id integer NOT NULL,
    local_language_id integer NOT NULL,
    flavor_text text NOT NULL
);


ALTER TABLE public.super_contest_effect_prose OWNER TO pokedex;

--
-- Name: super_contest_effects; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.super_contest_effects (
    id integer NOT NULL,
    appeal smallint NOT NULL
);


ALTER TABLE public.super_contest_effects OWNER TO pokedex;

--
-- Name: super_contest_effects_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.super_contest_effects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_contest_effects_id_seq OWNER TO pokedex;

--
-- Name: super_contest_effects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.super_contest_effects_id_seq OWNED BY public.super_contest_effects.id;


--
-- Name: type_efficacy; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.type_efficacy (
    damage_type_id integer NOT NULL,
    target_type_id integer NOT NULL,
    damage_factor integer NOT NULL
);


ALTER TABLE public.type_efficacy OWNER TO pokedex;

--
-- Name: type_game_indices; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.type_game_indices (
    type_id integer NOT NULL,
    generation_id integer NOT NULL,
    game_index integer NOT NULL
);


ALTER TABLE public.type_game_indices OWNER TO pokedex;

--
-- Name: type_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.type_names (
    type_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.type_names OWNER TO pokedex;

--
-- Name: types; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.types (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    generation_id integer NOT NULL,
    damage_class_id integer
);


ALTER TABLE public.types OWNER TO pokedex;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO pokedex;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: version_group_pokemon_move_methods; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.version_group_pokemon_move_methods (
    version_group_id integer NOT NULL,
    pokemon_move_method_id integer NOT NULL
);


ALTER TABLE public.version_group_pokemon_move_methods OWNER TO pokedex;

--
-- Name: version_group_regions; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.version_group_regions (
    version_group_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.version_group_regions OWNER TO pokedex;

--
-- Name: version_groups; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.version_groups (
    id integer NOT NULL,
    identifier character varying(79) NOT NULL,
    generation_id integer NOT NULL,
    "order" integer
);


ALTER TABLE public.version_groups OWNER TO pokedex;

--
-- Name: version_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.version_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.version_groups_id_seq OWNER TO pokedex;

--
-- Name: version_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.version_groups_id_seq OWNED BY public.version_groups.id;


--
-- Name: version_names; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.version_names (
    version_id integer NOT NULL,
    local_language_id integer NOT NULL,
    name character varying(79) NOT NULL
);


ALTER TABLE public.version_names OWNER TO pokedex;

--
-- Name: versions; Type: TABLE; Schema: public; Owner: pokedex
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    version_group_id integer NOT NULL,
    identifier character varying(79) NOT NULL
);


ALTER TABLE public.versions OWNER TO pokedex;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: pokedex
--

CREATE SEQUENCE public.versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO pokedex;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pokedex
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: abilities id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.abilities ALTER COLUMN id SET DEFAULT nextval('public.abilities_id_seq'::regclass);


--
-- Name: ability_changelog id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_changelog ALTER COLUMN id SET DEFAULT nextval('public.ability_changelog_id_seq'::regclass);


--
-- Name: berries id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berries ALTER COLUMN id SET DEFAULT nextval('public.berries_id_seq'::regclass);


--
-- Name: berry_firmness id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berry_firmness ALTER COLUMN id SET DEFAULT nextval('public.berry_firmness_id_seq'::regclass);


--
-- Name: characteristics id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.characteristics ALTER COLUMN id SET DEFAULT nextval('public.characteristics_id_seq'::regclass);


--
-- Name: conquest_episodes id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_episodes ALTER COLUMN id SET DEFAULT nextval('public.conquest_episodes_id_seq'::regclass);


--
-- Name: conquest_kingdoms id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_kingdoms ALTER COLUMN id SET DEFAULT nextval('public.conquest_kingdoms_id_seq'::regclass);


--
-- Name: conquest_move_displacements id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_displacements ALTER COLUMN id SET DEFAULT nextval('public.conquest_move_displacements_id_seq'::regclass);


--
-- Name: conquest_move_effects id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_effects ALTER COLUMN id SET DEFAULT nextval('public.conquest_move_effects_id_seq'::regclass);


--
-- Name: conquest_move_ranges id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_ranges ALTER COLUMN id SET DEFAULT nextval('public.conquest_move_ranges_id_seq'::regclass);


--
-- Name: conquest_stats id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_stats ALTER COLUMN id SET DEFAULT nextval('public.conquest_stats_id_seq'::regclass);


--
-- Name: conquest_warrior_archetypes id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_archetypes ALTER COLUMN id SET DEFAULT nextval('public.conquest_warrior_archetypes_id_seq'::regclass);


--
-- Name: conquest_warrior_ranks id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_ranks ALTER COLUMN id SET DEFAULT nextval('public.conquest_warrior_ranks_id_seq'::regclass);


--
-- Name: conquest_warrior_skills id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_skills ALTER COLUMN id SET DEFAULT nextval('public.conquest_warrior_skills_id_seq'::regclass);


--
-- Name: conquest_warrior_stats id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_stats ALTER COLUMN id SET DEFAULT nextval('public.conquest_warrior_stats_id_seq'::regclass);


--
-- Name: conquest_warriors id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warriors ALTER COLUMN id SET DEFAULT nextval('public.conquest_warriors_id_seq'::regclass);


--
-- Name: contest_effects id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_effects ALTER COLUMN id SET DEFAULT nextval('public.contest_effects_id_seq'::regclass);


--
-- Name: contest_types id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_types ALTER COLUMN id SET DEFAULT nextval('public.contest_types_id_seq'::regclass);


--
-- Name: egg_groups id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.egg_groups ALTER COLUMN id SET DEFAULT nextval('public.egg_groups_id_seq'::regclass);


--
-- Name: encounter_condition_values id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_values ALTER COLUMN id SET DEFAULT nextval('public.encounter_condition_values_id_seq'::regclass);


--
-- Name: encounter_conditions id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_conditions ALTER COLUMN id SET DEFAULT nextval('public.encounter_conditions_id_seq'::regclass);


--
-- Name: encounter_methods id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_methods ALTER COLUMN id SET DEFAULT nextval('public.encounter_methods_id_seq'::regclass);


--
-- Name: encounter_slots id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_slots ALTER COLUMN id SET DEFAULT nextval('public.encounter_slots_id_seq'::regclass);


--
-- Name: encounters id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounters ALTER COLUMN id SET DEFAULT nextval('public.encounters_id_seq'::regclass);


--
-- Name: evolution_chains id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.evolution_chains ALTER COLUMN id SET DEFAULT nextval('public.evolution_chains_id_seq'::regclass);


--
-- Name: evolution_triggers id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.evolution_triggers ALTER COLUMN id SET DEFAULT nextval('public.evolution_triggers_id_seq'::regclass);


--
-- Name: genders id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.genders ALTER COLUMN id SET DEFAULT nextval('public.genders_id_seq'::regclass);


--
-- Name: generations id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.generations ALTER COLUMN id SET DEFAULT nextval('public.generations_id_seq'::regclass);


--
-- Name: growth_rates id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.growth_rates ALTER COLUMN id SET DEFAULT nextval('public.growth_rates_id_seq'::regclass);


--
-- Name: item_categories id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_categories ALTER COLUMN id SET DEFAULT nextval('public.item_categories_id_seq'::regclass);


--
-- Name: item_flags id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flags ALTER COLUMN id SET DEFAULT nextval('public.item_flags_id_seq'::regclass);


--
-- Name: item_fling_effects id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_fling_effects ALTER COLUMN id SET DEFAULT nextval('public.item_fling_effects_id_seq'::regclass);


--
-- Name: item_pockets id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_pockets ALTER COLUMN id SET DEFAULT nextval('public.item_pockets_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: location_areas id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_areas ALTER COLUMN id SET DEFAULT nextval('public.location_areas_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: move_battle_styles id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_battle_styles ALTER COLUMN id SET DEFAULT nextval('public.move_battle_styles_id_seq'::regclass);


--
-- Name: move_damage_classes id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_damage_classes ALTER COLUMN id SET DEFAULT nextval('public.move_damage_classes_id_seq'::regclass);


--
-- Name: move_effect_changelog id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_changelog ALTER COLUMN id SET DEFAULT nextval('public.move_effect_changelog_id_seq'::regclass);


--
-- Name: move_effects id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effects ALTER COLUMN id SET DEFAULT nextval('public.move_effects_id_seq'::regclass);


--
-- Name: move_flags id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flags ALTER COLUMN id SET DEFAULT nextval('public.move_flags_id_seq'::regclass);


--
-- Name: move_targets id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_targets ALTER COLUMN id SET DEFAULT nextval('public.move_targets_id_seq'::regclass);


--
-- Name: moves id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves ALTER COLUMN id SET DEFAULT nextval('public.moves_id_seq'::regclass);


--
-- Name: natures id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.natures ALTER COLUMN id SET DEFAULT nextval('public.natures_id_seq'::regclass);


--
-- Name: pal_park_areas id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pal_park_areas ALTER COLUMN id SET DEFAULT nextval('public.pal_park_areas_id_seq'::regclass);


--
-- Name: pokeathlon_stats id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokeathlon_stats ALTER COLUMN id SET DEFAULT nextval('public.pokeathlon_stats_id_seq'::regclass);


--
-- Name: pokedexes id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokedexes ALTER COLUMN id SET DEFAULT nextval('public.pokedexes_id_seq'::regclass);


--
-- Name: pokemon id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon ALTER COLUMN id SET DEFAULT nextval('public.pokemon_id_seq'::regclass);


--
-- Name: pokemon_evolution id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution ALTER COLUMN id SET DEFAULT nextval('public.pokemon_evolution_id_seq'::regclass);


--
-- Name: pokemon_forms id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_forms ALTER COLUMN id SET DEFAULT nextval('public.pokemon_forms_id_seq'::regclass);


--
-- Name: pokemon_shapes id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_shapes ALTER COLUMN id SET DEFAULT nextval('public.pokemon_shapes_id_seq'::regclass);


--
-- Name: pokemon_species id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species ALTER COLUMN id SET DEFAULT nextval('public.pokemon_species_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: stats id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.stats ALTER COLUMN id SET DEFAULT nextval('public.stats_id_seq'::regclass);


--
-- Name: super_contest_effects id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.super_contest_effects ALTER COLUMN id SET DEFAULT nextval('public.super_contest_effects_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Name: version_groups id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_groups ALTER COLUMN id SET DEFAULT nextval('public.version_groups_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (id);


--
-- Name: ability_changelog ability_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_changelog
    ADD CONSTRAINT ability_changelog_pkey PRIMARY KEY (id);


--
-- Name: ability_changelog_prose ability_changelog_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_changelog_prose
    ADD CONSTRAINT ability_changelog_prose_pkey PRIMARY KEY (ability_changelog_id, local_language_id);


--
-- Name: ability_flavor_text ability_flavor_text_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_flavor_text
    ADD CONSTRAINT ability_flavor_text_pkey PRIMARY KEY (ability_id, version_group_id, language_id);


--
-- Name: ability_names ability_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_names
    ADD CONSTRAINT ability_names_pkey PRIMARY KEY (ability_id, local_language_id);


--
-- Name: ability_prose ability_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_prose
    ADD CONSTRAINT ability_prose_pkey PRIMARY KEY (ability_id, local_language_id);


--
-- Name: berries berries_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berries
    ADD CONSTRAINT berries_pkey PRIMARY KEY (id);


--
-- Name: berry_firmness_names berry_firmness_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berry_firmness_names
    ADD CONSTRAINT berry_firmness_names_pkey PRIMARY KEY (berry_firmness_id, local_language_id);


--
-- Name: berry_firmness berry_firmness_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berry_firmness
    ADD CONSTRAINT berry_firmness_pkey PRIMARY KEY (id);


--
-- Name: berry_flavors berry_flavors_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berry_flavors
    ADD CONSTRAINT berry_flavors_pkey PRIMARY KEY (berry_id, contest_type_id);


--
-- Name: characteristic_text characteristic_text_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.characteristic_text
    ADD CONSTRAINT characteristic_text_pkey PRIMARY KEY (characteristic_id, local_language_id);


--
-- Name: characteristics characteristics_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.characteristics
    ADD CONSTRAINT characteristics_pkey PRIMARY KEY (id);


--
-- Name: conquest_episode_names conquest_episode_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_episode_names
    ADD CONSTRAINT conquest_episode_names_pkey PRIMARY KEY (episode_id, local_language_id);


--
-- Name: conquest_episode_warriors conquest_episode_warriors_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_episode_warriors
    ADD CONSTRAINT conquest_episode_warriors_pkey PRIMARY KEY (episode_id, warrior_id);


--
-- Name: conquest_episodes conquest_episodes_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_episodes
    ADD CONSTRAINT conquest_episodes_pkey PRIMARY KEY (id);


--
-- Name: conquest_kingdom_names conquest_kingdom_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_kingdom_names
    ADD CONSTRAINT conquest_kingdom_names_pkey PRIMARY KEY (kingdom_id, local_language_id);


--
-- Name: conquest_kingdoms conquest_kingdoms_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_kingdoms
    ADD CONSTRAINT conquest_kingdoms_pkey PRIMARY KEY (id);


--
-- Name: conquest_max_links conquest_max_links_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_max_links
    ADD CONSTRAINT conquest_max_links_pkey PRIMARY KEY (warrior_rank_id, pokemon_species_id);


--
-- Name: conquest_move_data conquest_move_data_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_data
    ADD CONSTRAINT conquest_move_data_pkey PRIMARY KEY (move_id);


--
-- Name: conquest_move_displacement_prose conquest_move_displacement_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_displacement_prose
    ADD CONSTRAINT conquest_move_displacement_prose_pkey PRIMARY KEY (move_displacement_id, local_language_id);


--
-- Name: conquest_move_displacements conquest_move_displacements_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_displacements
    ADD CONSTRAINT conquest_move_displacements_pkey PRIMARY KEY (id);


--
-- Name: conquest_move_effect_prose conquest_move_effect_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_effect_prose
    ADD CONSTRAINT conquest_move_effect_prose_pkey PRIMARY KEY (conquest_move_effect_id, local_language_id);


--
-- Name: conquest_move_effects conquest_move_effects_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_effects
    ADD CONSTRAINT conquest_move_effects_pkey PRIMARY KEY (id);


--
-- Name: conquest_move_range_prose conquest_move_range_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_range_prose
    ADD CONSTRAINT conquest_move_range_prose_pkey PRIMARY KEY (conquest_move_range_id, local_language_id);


--
-- Name: conquest_move_ranges conquest_move_ranges_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_ranges
    ADD CONSTRAINT conquest_move_ranges_pkey PRIMARY KEY (id);


--
-- Name: conquest_pokemon_abilities conquest_pokemon_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_abilities
    ADD CONSTRAINT conquest_pokemon_abilities_pkey PRIMARY KEY (pokemon_species_id, slot);


--
-- Name: conquest_pokemon_evolution conquest_pokemon_evolution_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_evolution
    ADD CONSTRAINT conquest_pokemon_evolution_pkey PRIMARY KEY (evolved_species_id);


--
-- Name: conquest_pokemon_moves conquest_pokemon_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_moves
    ADD CONSTRAINT conquest_pokemon_moves_pkey PRIMARY KEY (pokemon_species_id);


--
-- Name: conquest_pokemon_stats conquest_pokemon_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_stats
    ADD CONSTRAINT conquest_pokemon_stats_pkey PRIMARY KEY (pokemon_species_id, conquest_stat_id);


--
-- Name: conquest_stat_names conquest_stat_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_stat_names
    ADD CONSTRAINT conquest_stat_names_pkey PRIMARY KEY (conquest_stat_id, local_language_id);


--
-- Name: conquest_stats conquest_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_stats
    ADD CONSTRAINT conquest_stats_pkey PRIMARY KEY (id);


--
-- Name: conquest_transformation_pokemon conquest_transformation_pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_transformation_pokemon
    ADD CONSTRAINT conquest_transformation_pokemon_pkey PRIMARY KEY (transformation_id, pokemon_species_id);


--
-- Name: conquest_transformation_warriors conquest_transformation_warriors_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_transformation_warriors
    ADD CONSTRAINT conquest_transformation_warriors_pkey PRIMARY KEY (transformation_id, present_warrior_id);


--
-- Name: conquest_warrior_archetypes conquest_warrior_archetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_archetypes
    ADD CONSTRAINT conquest_warrior_archetypes_pkey PRIMARY KEY (id);


--
-- Name: conquest_warrior_names conquest_warrior_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_names
    ADD CONSTRAINT conquest_warrior_names_pkey PRIMARY KEY (warrior_id, local_language_id);


--
-- Name: conquest_warrior_rank_stat_map conquest_warrior_rank_stat_map_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_rank_stat_map
    ADD CONSTRAINT conquest_warrior_rank_stat_map_pkey PRIMARY KEY (warrior_rank_id, warrior_stat_id);


--
-- Name: conquest_warrior_ranks conquest_warrior_ranks_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_ranks
    ADD CONSTRAINT conquest_warrior_ranks_pkey PRIMARY KEY (id);


--
-- Name: conquest_warrior_ranks conquest_warrior_ranks_warrior_id_rank_key; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_ranks
    ADD CONSTRAINT conquest_warrior_ranks_warrior_id_rank_key UNIQUE (warrior_id, rank);


--
-- Name: conquest_warrior_skill_names conquest_warrior_skill_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_skill_names
    ADD CONSTRAINT conquest_warrior_skill_names_pkey PRIMARY KEY (skill_id, local_language_id);


--
-- Name: conquest_warrior_skills conquest_warrior_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_skills
    ADD CONSTRAINT conquest_warrior_skills_pkey PRIMARY KEY (id);


--
-- Name: conquest_warrior_specialties conquest_warrior_specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_specialties
    ADD CONSTRAINT conquest_warrior_specialties_pkey PRIMARY KEY (warrior_id, type_id, slot);


--
-- Name: conquest_warrior_stat_names conquest_warrior_stat_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_stat_names
    ADD CONSTRAINT conquest_warrior_stat_names_pkey PRIMARY KEY (warrior_stat_id, local_language_id);


--
-- Name: conquest_warrior_stats conquest_warrior_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_stats
    ADD CONSTRAINT conquest_warrior_stats_pkey PRIMARY KEY (id);


--
-- Name: conquest_warrior_transformation conquest_warrior_transformation_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_transformation
    ADD CONSTRAINT conquest_warrior_transformation_pkey PRIMARY KEY (transformed_warrior_rank_id);


--
-- Name: conquest_warriors conquest_warriors_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warriors
    ADD CONSTRAINT conquest_warriors_pkey PRIMARY KEY (id);


--
-- Name: contest_combos contest_combos_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_combos
    ADD CONSTRAINT contest_combos_pkey PRIMARY KEY (first_move_id, second_move_id);


--
-- Name: contest_effect_prose contest_effect_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_effect_prose
    ADD CONSTRAINT contest_effect_prose_pkey PRIMARY KEY (contest_effect_id, local_language_id);


--
-- Name: contest_effects contest_effects_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_effects
    ADD CONSTRAINT contest_effects_pkey PRIMARY KEY (id);


--
-- Name: contest_type_names contest_type_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_type_names
    ADD CONSTRAINT contest_type_names_pkey PRIMARY KEY (contest_type_id, local_language_id);


--
-- Name: contest_types contest_types_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_types
    ADD CONSTRAINT contest_types_pkey PRIMARY KEY (id);


--
-- Name: egg_group_prose egg_group_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.egg_group_prose
    ADD CONSTRAINT egg_group_prose_pkey PRIMARY KEY (egg_group_id, local_language_id);


--
-- Name: egg_groups egg_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.egg_groups
    ADD CONSTRAINT egg_groups_pkey PRIMARY KEY (id);


--
-- Name: encounter_condition_prose encounter_condition_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_prose
    ADD CONSTRAINT encounter_condition_prose_pkey PRIMARY KEY (encounter_condition_id, local_language_id);


--
-- Name: encounter_condition_value_map encounter_condition_value_map_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_value_map
    ADD CONSTRAINT encounter_condition_value_map_pkey PRIMARY KEY (encounter_id, encounter_condition_value_id);


--
-- Name: encounter_condition_value_prose encounter_condition_value_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_value_prose
    ADD CONSTRAINT encounter_condition_value_prose_pkey PRIMARY KEY (encounter_condition_value_id, local_language_id);


--
-- Name: encounter_condition_values encounter_condition_values_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_values
    ADD CONSTRAINT encounter_condition_values_pkey PRIMARY KEY (id);


--
-- Name: encounter_conditions encounter_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_conditions
    ADD CONSTRAINT encounter_conditions_pkey PRIMARY KEY (id);


--
-- Name: encounter_method_prose encounter_method_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_method_prose
    ADD CONSTRAINT encounter_method_prose_pkey PRIMARY KEY (encounter_method_id, local_language_id);


--
-- Name: encounter_methods encounter_methods_identifier_key; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_methods
    ADD CONSTRAINT encounter_methods_identifier_key UNIQUE (identifier);


--
-- Name: encounter_methods encounter_methods_order_key; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_methods
    ADD CONSTRAINT encounter_methods_order_key UNIQUE ("order");


--
-- Name: encounter_methods encounter_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_methods
    ADD CONSTRAINT encounter_methods_pkey PRIMARY KEY (id);


--
-- Name: encounter_slots encounter_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_slots
    ADD CONSTRAINT encounter_slots_pkey PRIMARY KEY (id);


--
-- Name: encounters encounters_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounters
    ADD CONSTRAINT encounters_pkey PRIMARY KEY (id);


--
-- Name: evolution_chains evolution_chains_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.evolution_chains
    ADD CONSTRAINT evolution_chains_pkey PRIMARY KEY (id);


--
-- Name: evolution_trigger_prose evolution_trigger_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.evolution_trigger_prose
    ADD CONSTRAINT evolution_trigger_prose_pkey PRIMARY KEY (evolution_trigger_id, local_language_id);


--
-- Name: evolution_triggers evolution_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.evolution_triggers
    ADD CONSTRAINT evolution_triggers_pkey PRIMARY KEY (id);


--
-- Name: experience experience_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.experience
    ADD CONSTRAINT experience_pkey PRIMARY KEY (growth_rate_id, level);


--
-- Name: genders genders_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_pkey PRIMARY KEY (id);


--
-- Name: generation_names generation_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.generation_names
    ADD CONSTRAINT generation_names_pkey PRIMARY KEY (generation_id, local_language_id);


--
-- Name: generations generations_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.generations
    ADD CONSTRAINT generations_pkey PRIMARY KEY (id);


--
-- Name: growth_rate_prose growth_rate_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.growth_rate_prose
    ADD CONSTRAINT growth_rate_prose_pkey PRIMARY KEY (growth_rate_id, local_language_id);


--
-- Name: growth_rates growth_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.growth_rates
    ADD CONSTRAINT growth_rates_pkey PRIMARY KEY (id);


--
-- Name: item_categories item_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_categories
    ADD CONSTRAINT item_categories_pkey PRIMARY KEY (id);


--
-- Name: item_category_prose item_category_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_category_prose
    ADD CONSTRAINT item_category_prose_pkey PRIMARY KEY (item_category_id, local_language_id);


--
-- Name: item_flag_map item_flag_map_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flag_map
    ADD CONSTRAINT item_flag_map_pkey PRIMARY KEY (item_id, item_flag_id);


--
-- Name: item_flag_prose item_flag_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flag_prose
    ADD CONSTRAINT item_flag_prose_pkey PRIMARY KEY (item_flag_id, local_language_id);


--
-- Name: item_flags item_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flags
    ADD CONSTRAINT item_flags_pkey PRIMARY KEY (id);


--
-- Name: item_flavor_summaries item_flavor_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flavor_summaries
    ADD CONSTRAINT item_flavor_summaries_pkey PRIMARY KEY (item_id, local_language_id);


--
-- Name: item_flavor_text item_flavor_text_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flavor_text
    ADD CONSTRAINT item_flavor_text_pkey PRIMARY KEY (item_id, version_group_id, language_id);


--
-- Name: item_fling_effect_prose item_fling_effect_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_fling_effect_prose
    ADD CONSTRAINT item_fling_effect_prose_pkey PRIMARY KEY (item_fling_effect_id, local_language_id);


--
-- Name: item_fling_effects item_fling_effects_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_fling_effects
    ADD CONSTRAINT item_fling_effects_pkey PRIMARY KEY (id);


--
-- Name: item_game_indices item_game_indices_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_game_indices
    ADD CONSTRAINT item_game_indices_pkey PRIMARY KEY (item_id, generation_id);


--
-- Name: item_names item_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_names
    ADD CONSTRAINT item_names_pkey PRIMARY KEY (item_id, local_language_id);


--
-- Name: item_pocket_names item_pocket_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_pocket_names
    ADD CONSTRAINT item_pocket_names_pkey PRIMARY KEY (item_pocket_id, local_language_id);


--
-- Name: item_pockets item_pockets_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_pockets
    ADD CONSTRAINT item_pockets_pkey PRIMARY KEY (id);


--
-- Name: item_prose item_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_prose
    ADD CONSTRAINT item_prose_pkey PRIMARY KEY (item_id, local_language_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: language_names language_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.language_names
    ADD CONSTRAINT language_names_pkey PRIMARY KEY (language_id, local_language_id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: location_area_encounter_rates location_area_encounter_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_area_encounter_rates
    ADD CONSTRAINT location_area_encounter_rates_pkey PRIMARY KEY (location_area_id, encounter_method_id, version_id);


--
-- Name: location_area_prose location_area_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_area_prose
    ADD CONSTRAINT location_area_prose_pkey PRIMARY KEY (location_area_id, local_language_id);


--
-- Name: location_areas location_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_areas
    ADD CONSTRAINT location_areas_pkey PRIMARY KEY (id);


--
-- Name: location_game_indices location_game_indices_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_game_indices
    ADD CONSTRAINT location_game_indices_pkey PRIMARY KEY (location_id, generation_id, game_index);


--
-- Name: location_names location_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_names
    ADD CONSTRAINT location_names_pkey PRIMARY KEY (location_id, local_language_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: machines machines_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT machines_pkey PRIMARY KEY (machine_number, version_group_id);


--
-- Name: move_battle_style_prose move_battle_style_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_battle_style_prose
    ADD CONSTRAINT move_battle_style_prose_pkey PRIMARY KEY (move_battle_style_id, local_language_id);


--
-- Name: move_battle_styles move_battle_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_battle_styles
    ADD CONSTRAINT move_battle_styles_pkey PRIMARY KEY (id);


--
-- Name: move_changelog move_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_changelog
    ADD CONSTRAINT move_changelog_pkey PRIMARY KEY (move_id, changed_in_version_group_id);


--
-- Name: move_damage_class_prose move_damage_class_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_damage_class_prose
    ADD CONSTRAINT move_damage_class_prose_pkey PRIMARY KEY (move_damage_class_id, local_language_id);


--
-- Name: move_damage_classes move_damage_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_damage_classes
    ADD CONSTRAINT move_damage_classes_pkey PRIMARY KEY (id);


--
-- Name: move_effect_changelog move_effect_changelog_effect_id_changed_in_version_group_id_key; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_changelog
    ADD CONSTRAINT move_effect_changelog_effect_id_changed_in_version_group_id_key UNIQUE (effect_id, changed_in_version_group_id);


--
-- Name: move_effect_changelog move_effect_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_changelog
    ADD CONSTRAINT move_effect_changelog_pkey PRIMARY KEY (id);


--
-- Name: move_effect_changelog_prose move_effect_changelog_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_changelog_prose
    ADD CONSTRAINT move_effect_changelog_prose_pkey PRIMARY KEY (move_effect_changelog_id, local_language_id);


--
-- Name: move_effect_prose move_effect_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_prose
    ADD CONSTRAINT move_effect_prose_pkey PRIMARY KEY (move_effect_id, local_language_id);


--
-- Name: move_effects move_effects_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effects
    ADD CONSTRAINT move_effects_pkey PRIMARY KEY (id);


--
-- Name: move_flag_map move_flag_map_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flag_map
    ADD CONSTRAINT move_flag_map_pkey PRIMARY KEY (move_id, move_flag_id);


--
-- Name: move_flag_prose move_flag_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flag_prose
    ADD CONSTRAINT move_flag_prose_pkey PRIMARY KEY (move_flag_id, local_language_id);


--
-- Name: move_flags move_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flags
    ADD CONSTRAINT move_flags_pkey PRIMARY KEY (id);


--
-- Name: move_flavor_summaries move_flavor_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flavor_summaries
    ADD CONSTRAINT move_flavor_summaries_pkey PRIMARY KEY (move_id, local_language_id);


--
-- Name: move_flavor_text move_flavor_text_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flavor_text
    ADD CONSTRAINT move_flavor_text_pkey PRIMARY KEY (move_id, version_group_id, language_id);


--
-- Name: move_meta_ailment_names move_meta_ailment_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_ailment_names
    ADD CONSTRAINT move_meta_ailment_names_pkey PRIMARY KEY (move_meta_ailment_id, local_language_id);


--
-- Name: move_meta_ailments move_meta_ailments_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_ailments
    ADD CONSTRAINT move_meta_ailments_pkey PRIMARY KEY (id);


--
-- Name: move_meta_categories move_meta_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_categories
    ADD CONSTRAINT move_meta_categories_pkey PRIMARY KEY (id);


--
-- Name: move_meta_category_prose move_meta_category_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_category_prose
    ADD CONSTRAINT move_meta_category_prose_pkey PRIMARY KEY (move_meta_category_id, local_language_id);


--
-- Name: move_meta move_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta
    ADD CONSTRAINT move_meta_pkey PRIMARY KEY (move_id);


--
-- Name: move_meta_stat_changes move_meta_stat_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_stat_changes
    ADD CONSTRAINT move_meta_stat_changes_pkey PRIMARY KEY (move_id, stat_id);


--
-- Name: move_names move_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_names
    ADD CONSTRAINT move_names_pkey PRIMARY KEY (move_id, local_language_id);


--
-- Name: move_target_prose move_target_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_target_prose
    ADD CONSTRAINT move_target_prose_pkey PRIMARY KEY (move_target_id, local_language_id);


--
-- Name: move_targets move_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_targets
    ADD CONSTRAINT move_targets_pkey PRIMARY KEY (id);


--
-- Name: moves moves_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_pkey PRIMARY KEY (id);


--
-- Name: nature_battle_style_preferences nature_battle_style_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.nature_battle_style_preferences
    ADD CONSTRAINT nature_battle_style_preferences_pkey PRIMARY KEY (nature_id, move_battle_style_id);


--
-- Name: nature_names nature_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.nature_names
    ADD CONSTRAINT nature_names_pkey PRIMARY KEY (nature_id, local_language_id);


--
-- Name: nature_pokeathlon_stats nature_pokeathlon_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.nature_pokeathlon_stats
    ADD CONSTRAINT nature_pokeathlon_stats_pkey PRIMARY KEY (nature_id, pokeathlon_stat_id);


--
-- Name: natures natures_game_index_key; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.natures
    ADD CONSTRAINT natures_game_index_key UNIQUE (game_index);


--
-- Name: natures natures_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.natures
    ADD CONSTRAINT natures_pkey PRIMARY KEY (id);


--
-- Name: pal_park_area_names pal_park_area_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pal_park_area_names
    ADD CONSTRAINT pal_park_area_names_pkey PRIMARY KEY (pal_park_area_id, local_language_id);


--
-- Name: pal_park_areas pal_park_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pal_park_areas
    ADD CONSTRAINT pal_park_areas_pkey PRIMARY KEY (id);


--
-- Name: pal_park pal_park_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pal_park
    ADD CONSTRAINT pal_park_pkey PRIMARY KEY (species_id);


--
-- Name: pokeathlon_stat_names pokeathlon_stat_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokeathlon_stat_names
    ADD CONSTRAINT pokeathlon_stat_names_pkey PRIMARY KEY (pokeathlon_stat_id, local_language_id);


--
-- Name: pokeathlon_stats pokeathlon_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokeathlon_stats
    ADD CONSTRAINT pokeathlon_stats_pkey PRIMARY KEY (id);


--
-- Name: pokedex_prose pokedex_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokedex_prose
    ADD CONSTRAINT pokedex_prose_pkey PRIMARY KEY (pokedex_id, local_language_id);


--
-- Name: pokedex_version_groups pokedex_version_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokedex_version_groups
    ADD CONSTRAINT pokedex_version_groups_pkey PRIMARY KEY (pokedex_id, version_group_id);


--
-- Name: pokedexes pokedexes_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokedexes
    ADD CONSTRAINT pokedexes_pkey PRIMARY KEY (id);


--
-- Name: pokemon_abilities pokemon_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_abilities
    ADD CONSTRAINT pokemon_abilities_pkey PRIMARY KEY (pokemon_id, slot);


--
-- Name: pokemon_color_names pokemon_color_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_color_names
    ADD CONSTRAINT pokemon_color_names_pkey PRIMARY KEY (pokemon_color_id, local_language_id);


--
-- Name: pokemon_colors pokemon_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_colors
    ADD CONSTRAINT pokemon_colors_pkey PRIMARY KEY (id);


--
-- Name: pokemon_dex_numbers pokemon_dex_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_dex_numbers
    ADD CONSTRAINT pokemon_dex_numbers_pkey PRIMARY KEY (species_id, pokedex_id);


--
-- Name: pokemon_egg_groups pokemon_egg_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_egg_groups
    ADD CONSTRAINT pokemon_egg_groups_pkey PRIMARY KEY (species_id, egg_group_id);


--
-- Name: pokemon_evolution pokemon_evolution_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_pkey PRIMARY KEY (id);


--
-- Name: pokemon_form_generations pokemon_form_generations_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_form_generations
    ADD CONSTRAINT pokemon_form_generations_pkey PRIMARY KEY (pokemon_form_id, generation_id);


--
-- Name: pokemon_form_names pokemon_form_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_form_names
    ADD CONSTRAINT pokemon_form_names_pkey PRIMARY KEY (pokemon_form_id, local_language_id);


--
-- Name: pokemon_form_pokeathlon_stats pokemon_form_pokeathlon_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_form_pokeathlon_stats
    ADD CONSTRAINT pokemon_form_pokeathlon_stats_pkey PRIMARY KEY (pokemon_form_id, pokeathlon_stat_id);


--
-- Name: pokemon_forms pokemon_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_forms
    ADD CONSTRAINT pokemon_forms_pkey PRIMARY KEY (id);


--
-- Name: pokemon_game_indices pokemon_game_indices_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_game_indices
    ADD CONSTRAINT pokemon_game_indices_pkey PRIMARY KEY (pokemon_id, version_id);


--
-- Name: pokemon_habitat_names pokemon_habitat_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_habitat_names
    ADD CONSTRAINT pokemon_habitat_names_pkey PRIMARY KEY (pokemon_habitat_id, local_language_id);


--
-- Name: pokemon_habitats pokemon_habitats_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_habitats
    ADD CONSTRAINT pokemon_habitats_pkey PRIMARY KEY (id);


--
-- Name: pokemon_items pokemon_items_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_items
    ADD CONSTRAINT pokemon_items_pkey PRIMARY KEY (pokemon_id, version_id, item_id);


--
-- Name: pokemon_move_method_prose pokemon_move_method_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_move_method_prose
    ADD CONSTRAINT pokemon_move_method_prose_pkey PRIMARY KEY (pokemon_move_method_id, local_language_id);


--
-- Name: pokemon_move_methods pokemon_move_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_move_methods
    ADD CONSTRAINT pokemon_move_methods_pkey PRIMARY KEY (id);


--
-- Name: pokemon_moves pokemon_moves_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_moves
    ADD CONSTRAINT pokemon_moves_pkey PRIMARY KEY (pokemon_id, version_group_id, move_id, pokemon_move_method_id, level);


--
-- Name: pokemon pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_pkey PRIMARY KEY (id);


--
-- Name: pokemon_shape_prose pokemon_shape_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_shape_prose
    ADD CONSTRAINT pokemon_shape_prose_pkey PRIMARY KEY (pokemon_shape_id, local_language_id);


--
-- Name: pokemon_shapes pokemon_shapes_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_shapes
    ADD CONSTRAINT pokemon_shapes_pkey PRIMARY KEY (id);


--
-- Name: pokemon_species_flavor_summaries pokemon_species_flavor_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_flavor_summaries
    ADD CONSTRAINT pokemon_species_flavor_summaries_pkey PRIMARY KEY (pokemon_species_id, local_language_id);


--
-- Name: pokemon_species_flavor_text pokemon_species_flavor_text_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_flavor_text
    ADD CONSTRAINT pokemon_species_flavor_text_pkey PRIMARY KEY (species_id, version_id, language_id);


--
-- Name: pokemon_species_names pokemon_species_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_names
    ADD CONSTRAINT pokemon_species_names_pkey PRIMARY KEY (pokemon_species_id, local_language_id);


--
-- Name: pokemon_species pokemon_species_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species
    ADD CONSTRAINT pokemon_species_pkey PRIMARY KEY (id);


--
-- Name: pokemon_species_prose pokemon_species_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_prose
    ADD CONSTRAINT pokemon_species_prose_pkey PRIMARY KEY (pokemon_species_id, local_language_id);


--
-- Name: pokemon_stats pokemon_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_stats
    ADD CONSTRAINT pokemon_stats_pkey PRIMARY KEY (pokemon_id, stat_id);


--
-- Name: pokemon_types pokemon_types_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_types
    ADD CONSTRAINT pokemon_types_pkey PRIMARY KEY (pokemon_id, slot);


--
-- Name: region_names region_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.region_names
    ADD CONSTRAINT region_names_pkey PRIMARY KEY (region_id, local_language_id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: stat_names stat_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.stat_names
    ADD CONSTRAINT stat_names_pkey PRIMARY KEY (stat_id, local_language_id);


--
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- Name: super_contest_combos super_contest_combos_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.super_contest_combos
    ADD CONSTRAINT super_contest_combos_pkey PRIMARY KEY (first_move_id, second_move_id);


--
-- Name: super_contest_effect_prose super_contest_effect_prose_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.super_contest_effect_prose
    ADD CONSTRAINT super_contest_effect_prose_pkey PRIMARY KEY (super_contest_effect_id, local_language_id);


--
-- Name: super_contest_effects super_contest_effects_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.super_contest_effects
    ADD CONSTRAINT super_contest_effects_pkey PRIMARY KEY (id);


--
-- Name: type_efficacy type_efficacy_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.type_efficacy
    ADD CONSTRAINT type_efficacy_pkey PRIMARY KEY (damage_type_id, target_type_id);


--
-- Name: type_game_indices type_game_indices_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.type_game_indices
    ADD CONSTRAINT type_game_indices_pkey PRIMARY KEY (type_id, generation_id);


--
-- Name: type_names type_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.type_names
    ADD CONSTRAINT type_names_pkey PRIMARY KEY (type_id, local_language_id);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: version_group_pokemon_move_methods version_group_pokemon_move_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_group_pokemon_move_methods
    ADD CONSTRAINT version_group_pokemon_move_methods_pkey PRIMARY KEY (version_group_id, pokemon_move_method_id);


--
-- Name: version_group_regions version_group_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_group_regions
    ADD CONSTRAINT version_group_regions_pkey PRIMARY KEY (version_group_id, region_id);


--
-- Name: version_groups version_groups_identifier_key; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_groups
    ADD CONSTRAINT version_groups_identifier_key UNIQUE (identifier);


--
-- Name: version_groups version_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_groups
    ADD CONSTRAINT version_groups_pkey PRIMARY KEY (id);


--
-- Name: version_names version_names_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_names
    ADD CONSTRAINT version_names_pkey PRIMARY KEY (version_id, local_language_id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: ix_abilities_is_main_series; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_abilities_is_main_series ON public.abilities USING btree (is_main_series);


--
-- Name: ix_ability_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_ability_names_name ON public.ability_names USING btree (name);


--
-- Name: ix_berry_firmness_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_berry_firmness_names_name ON public.berry_firmness_names USING btree (name);


--
-- Name: ix_characteristic_text_message; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_characteristic_text_message ON public.characteristic_text USING btree (message);


--
-- Name: ix_characteristics_gene_mod_5; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_characteristics_gene_mod_5 ON public.characteristics USING btree (gene_mod_5);


--
-- Name: ix_conquest_episode_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_conquest_episode_names_name ON public.conquest_episode_names USING btree (name);


--
-- Name: ix_conquest_kingdom_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_conquest_kingdom_names_name ON public.conquest_kingdom_names USING btree (name);


--
-- Name: ix_conquest_stat_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_conquest_stat_names_name ON public.conquest_stat_names USING btree (name);


--
-- Name: ix_conquest_warrior_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_conquest_warrior_names_name ON public.conquest_warrior_names USING btree (name);


--
-- Name: ix_conquest_warrior_skill_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_conquest_warrior_skill_names_name ON public.conquest_warrior_skill_names USING btree (name);


--
-- Name: ix_conquest_warrior_stat_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_conquest_warrior_stat_names_name ON public.conquest_warrior_stat_names USING btree (name);


--
-- Name: ix_contest_type_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_contest_type_names_name ON public.contest_type_names USING btree (name);


--
-- Name: ix_egg_group_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_egg_group_prose_name ON public.egg_group_prose USING btree (name);


--
-- Name: ix_encounter_condition_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_encounter_condition_prose_name ON public.encounter_condition_prose USING btree (name);


--
-- Name: ix_encounter_condition_value_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_encounter_condition_value_prose_name ON public.encounter_condition_value_prose USING btree (name);


--
-- Name: ix_encounter_method_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_encounter_method_prose_name ON public.encounter_method_prose USING btree (name);


--
-- Name: ix_evolution_trigger_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_evolution_trigger_prose_name ON public.evolution_trigger_prose USING btree (name);


--
-- Name: ix_generation_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_generation_names_name ON public.generation_names USING btree (name);


--
-- Name: ix_growth_rate_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_growth_rate_prose_name ON public.growth_rate_prose USING btree (name);


--
-- Name: ix_item_category_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_item_category_prose_name ON public.item_category_prose USING btree (name);


--
-- Name: ix_item_flag_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_item_flag_prose_name ON public.item_flag_prose USING btree (name);


--
-- Name: ix_item_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_item_names_name ON public.item_names USING btree (name);


--
-- Name: ix_item_pocket_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_item_pocket_names_name ON public.item_pocket_names USING btree (name);


--
-- Name: ix_language_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_language_names_name ON public.language_names USING btree (name);


--
-- Name: ix_languages_official; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_languages_official ON public.languages USING btree (official);


--
-- Name: ix_location_area_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_location_area_prose_name ON public.location_area_prose USING btree (name);


--
-- Name: ix_location_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_location_names_name ON public.location_names USING btree (name);


--
-- Name: ix_move_battle_style_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_battle_style_prose_name ON public.move_battle_style_prose USING btree (name);


--
-- Name: ix_move_damage_class_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_damage_class_prose_name ON public.move_damage_class_prose USING btree (name);


--
-- Name: ix_move_flag_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_flag_prose_name ON public.move_flag_prose USING btree (name);


--
-- Name: ix_move_meta_ailment_chance; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_ailment_chance ON public.move_meta USING btree (ailment_chance);


--
-- Name: ix_move_meta_ailment_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_ailment_names_name ON public.move_meta_ailment_names USING btree (name);


--
-- Name: ix_move_meta_ailments_identifier; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE UNIQUE INDEX ix_move_meta_ailments_identifier ON public.move_meta_ailments USING btree (identifier);


--
-- Name: ix_move_meta_categories_identifier; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE UNIQUE INDEX ix_move_meta_categories_identifier ON public.move_meta_categories USING btree (identifier);


--
-- Name: ix_move_meta_crit_rate; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_crit_rate ON public.move_meta USING btree (crit_rate);


--
-- Name: ix_move_meta_drain; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_drain ON public.move_meta USING btree (drain);


--
-- Name: ix_move_meta_flinch_chance; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_flinch_chance ON public.move_meta USING btree (flinch_chance);


--
-- Name: ix_move_meta_healing; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_healing ON public.move_meta USING btree (healing);


--
-- Name: ix_move_meta_max_hits; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_max_hits ON public.move_meta USING btree (max_hits);


--
-- Name: ix_move_meta_max_turns; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_max_turns ON public.move_meta USING btree (max_turns);


--
-- Name: ix_move_meta_min_hits; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_min_hits ON public.move_meta USING btree (min_hits);


--
-- Name: ix_move_meta_min_turns; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_min_turns ON public.move_meta USING btree (min_turns);


--
-- Name: ix_move_meta_stat_chance; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_stat_chance ON public.move_meta USING btree (stat_chance);


--
-- Name: ix_move_meta_stat_changes_change; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_meta_stat_changes_change ON public.move_meta_stat_changes USING btree (change);


--
-- Name: ix_move_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_names_name ON public.move_names USING btree (name);


--
-- Name: ix_move_target_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_move_target_prose_name ON public.move_target_prose USING btree (name);


--
-- Name: ix_nature_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_nature_names_name ON public.nature_names USING btree (name);


--
-- Name: ix_pal_park_area_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pal_park_area_names_name ON public.pal_park_area_names USING btree (name);


--
-- Name: ix_pokeathlon_stat_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokeathlon_stat_names_name ON public.pokeathlon_stat_names USING btree (name);


--
-- Name: ix_pokedex_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokedex_prose_name ON public.pokedex_prose USING btree (name);


--
-- Name: ix_pokemon_abilities_is_hidden; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_abilities_is_hidden ON public.pokemon_abilities USING btree (is_hidden);


--
-- Name: ix_pokemon_color_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_color_names_name ON public.pokemon_color_names USING btree (name);


--
-- Name: ix_pokemon_form_names_form_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_form_names_form_name ON public.pokemon_form_names USING btree (form_name);


--
-- Name: ix_pokemon_form_names_pokemon_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_form_names_pokemon_name ON public.pokemon_form_names USING btree (pokemon_name);


--
-- Name: ix_pokemon_habitat_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_habitat_names_name ON public.pokemon_habitat_names USING btree (name);


--
-- Name: ix_pokemon_is_default; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_is_default ON public.pokemon USING btree (is_default);


--
-- Name: ix_pokemon_move_method_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_move_method_prose_name ON public.pokemon_move_method_prose USING btree (name);


--
-- Name: ix_pokemon_moves_level; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_moves_level ON public.pokemon_moves USING btree (level);


--
-- Name: ix_pokemon_moves_move_id; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_moves_move_id ON public.pokemon_moves USING btree (move_id);


--
-- Name: ix_pokemon_moves_pokemon_id; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_moves_pokemon_id ON public.pokemon_moves USING btree (pokemon_id);


--
-- Name: ix_pokemon_moves_pokemon_move_method_id; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_moves_pokemon_move_method_id ON public.pokemon_moves USING btree (pokemon_move_method_id);


--
-- Name: ix_pokemon_moves_version_group_id; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_moves_version_group_id ON public.pokemon_moves USING btree (version_group_id);


--
-- Name: ix_pokemon_order; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_order ON public.pokemon USING btree ("order");


--
-- Name: ix_pokemon_shape_prose_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_shape_prose_name ON public.pokemon_shape_prose USING btree (name);


--
-- Name: ix_pokemon_species_conquest_order; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_species_conquest_order ON public.pokemon_species USING btree (conquest_order);


--
-- Name: ix_pokemon_species_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_species_names_name ON public.pokemon_species_names USING btree (name);


--
-- Name: ix_pokemon_species_order; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_pokemon_species_order ON public.pokemon_species USING btree ("order");


--
-- Name: ix_region_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_region_names_name ON public.region_names USING btree (name);


--
-- Name: ix_stat_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_stat_names_name ON public.stat_names USING btree (name);


--
-- Name: ix_type_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_type_names_name ON public.type_names USING btree (name);


--
-- Name: ix_version_names_name; Type: INDEX; Schema: public; Owner: pokedex
--

CREATE INDEX ix_version_names_name ON public.version_names USING btree (name);


--
-- Name: abilities abilities_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: ability_changelog ability_changelog_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_changelog
    ADD CONSTRAINT ability_changelog_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.abilities(id);


--
-- Name: ability_changelog ability_changelog_changed_in_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_changelog
    ADD CONSTRAINT ability_changelog_changed_in_version_group_id_fkey FOREIGN KEY (changed_in_version_group_id) REFERENCES public.version_groups(id);


--
-- Name: ability_changelog_prose ability_changelog_prose_ability_changelog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_changelog_prose
    ADD CONSTRAINT ability_changelog_prose_ability_changelog_id_fkey FOREIGN KEY (ability_changelog_id) REFERENCES public.ability_changelog(id);


--
-- Name: ability_changelog_prose ability_changelog_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_changelog_prose
    ADD CONSTRAINT ability_changelog_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: ability_flavor_text ability_flavor_text_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_flavor_text
    ADD CONSTRAINT ability_flavor_text_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.abilities(id);


--
-- Name: ability_flavor_text ability_flavor_text_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_flavor_text
    ADD CONSTRAINT ability_flavor_text_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: ability_flavor_text ability_flavor_text_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_flavor_text
    ADD CONSTRAINT ability_flavor_text_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- Name: ability_names ability_names_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_names
    ADD CONSTRAINT ability_names_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.abilities(id);


--
-- Name: ability_names ability_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_names
    ADD CONSTRAINT ability_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: ability_prose ability_prose_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_prose
    ADD CONSTRAINT ability_prose_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.abilities(id);


--
-- Name: ability_prose ability_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.ability_prose
    ADD CONSTRAINT ability_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: berries berries_firmness_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berries
    ADD CONSTRAINT berries_firmness_id_fkey FOREIGN KEY (firmness_id) REFERENCES public.berry_firmness(id);


--
-- Name: berries berries_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berries
    ADD CONSTRAINT berries_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: berries berries_natural_gift_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berries
    ADD CONSTRAINT berries_natural_gift_type_id_fkey FOREIGN KEY (natural_gift_type_id) REFERENCES public.types(id);


--
-- Name: berry_firmness_names berry_firmness_names_berry_firmness_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berry_firmness_names
    ADD CONSTRAINT berry_firmness_names_berry_firmness_id_fkey FOREIGN KEY (berry_firmness_id) REFERENCES public.berry_firmness(id);


--
-- Name: berry_firmness_names berry_firmness_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berry_firmness_names
    ADD CONSTRAINT berry_firmness_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: berry_flavors berry_flavors_berry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berry_flavors
    ADD CONSTRAINT berry_flavors_berry_id_fkey FOREIGN KEY (berry_id) REFERENCES public.berries(id);


--
-- Name: berry_flavors berry_flavors_contest_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.berry_flavors
    ADD CONSTRAINT berry_flavors_contest_type_id_fkey FOREIGN KEY (contest_type_id) REFERENCES public.contest_types(id);


--
-- Name: characteristic_text characteristic_text_characteristic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.characteristic_text
    ADD CONSTRAINT characteristic_text_characteristic_id_fkey FOREIGN KEY (characteristic_id) REFERENCES public.characteristics(id);


--
-- Name: characteristic_text characteristic_text_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.characteristic_text
    ADD CONSTRAINT characteristic_text_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: characteristics characteristics_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.characteristics
    ADD CONSTRAINT characteristics_stat_id_fkey FOREIGN KEY (stat_id) REFERENCES public.stats(id);


--
-- Name: conquest_episode_names conquest_episode_names_episode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_episode_names
    ADD CONSTRAINT conquest_episode_names_episode_id_fkey FOREIGN KEY (episode_id) REFERENCES public.conquest_episodes(id);


--
-- Name: conquest_episode_names conquest_episode_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_episode_names
    ADD CONSTRAINT conquest_episode_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: conquest_episode_warriors conquest_episode_warriors_episode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_episode_warriors
    ADD CONSTRAINT conquest_episode_warriors_episode_id_fkey FOREIGN KEY (episode_id) REFERENCES public.conquest_episodes(id);


--
-- Name: conquest_episode_warriors conquest_episode_warriors_warrior_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_episode_warriors
    ADD CONSTRAINT conquest_episode_warriors_warrior_id_fkey FOREIGN KEY (warrior_id) REFERENCES public.conquest_warriors(id);


--
-- Name: conquest_kingdom_names conquest_kingdom_names_kingdom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_kingdom_names
    ADD CONSTRAINT conquest_kingdom_names_kingdom_id_fkey FOREIGN KEY (kingdom_id) REFERENCES public.conquest_kingdoms(id);


--
-- Name: conquest_kingdom_names conquest_kingdom_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_kingdom_names
    ADD CONSTRAINT conquest_kingdom_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: conquest_kingdoms conquest_kingdoms_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_kingdoms
    ADD CONSTRAINT conquest_kingdoms_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: conquest_max_links conquest_max_links_pokemon_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_max_links
    ADD CONSTRAINT conquest_max_links_pokemon_species_id_fkey FOREIGN KEY (pokemon_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: conquest_max_links conquest_max_links_warrior_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_max_links
    ADD CONSTRAINT conquest_max_links_warrior_rank_id_fkey FOREIGN KEY (warrior_rank_id) REFERENCES public.conquest_warrior_ranks(id);


--
-- Name: conquest_move_data conquest_move_data_displacement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_data
    ADD CONSTRAINT conquest_move_data_displacement_id_fkey FOREIGN KEY (displacement_id) REFERENCES public.conquest_move_displacements(id);


--
-- Name: conquest_move_data conquest_move_data_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_data
    ADD CONSTRAINT conquest_move_data_effect_id_fkey FOREIGN KEY (effect_id) REFERENCES public.conquest_move_effects(id);


--
-- Name: conquest_move_data conquest_move_data_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_data
    ADD CONSTRAINT conquest_move_data_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: conquest_move_data conquest_move_data_range_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_data
    ADD CONSTRAINT conquest_move_data_range_id_fkey FOREIGN KEY (range_id) REFERENCES public.conquest_move_ranges(id);


--
-- Name: conquest_move_displacement_prose conquest_move_displacement_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_displacement_prose
    ADD CONSTRAINT conquest_move_displacement_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: conquest_move_displacement_prose conquest_move_displacement_prose_move_displacement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_displacement_prose
    ADD CONSTRAINT conquest_move_displacement_prose_move_displacement_id_fkey FOREIGN KEY (move_displacement_id) REFERENCES public.conquest_move_displacements(id);


--
-- Name: conquest_move_effect_prose conquest_move_effect_prose_conquest_move_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_effect_prose
    ADD CONSTRAINT conquest_move_effect_prose_conquest_move_effect_id_fkey FOREIGN KEY (conquest_move_effect_id) REFERENCES public.conquest_move_effects(id);


--
-- Name: conquest_move_effect_prose conquest_move_effect_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_effect_prose
    ADD CONSTRAINT conquest_move_effect_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: conquest_move_range_prose conquest_move_range_prose_conquest_move_range_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_range_prose
    ADD CONSTRAINT conquest_move_range_prose_conquest_move_range_id_fkey FOREIGN KEY (conquest_move_range_id) REFERENCES public.conquest_move_ranges(id);


--
-- Name: conquest_move_range_prose conquest_move_range_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_move_range_prose
    ADD CONSTRAINT conquest_move_range_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: conquest_pokemon_abilities conquest_pokemon_abilities_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_abilities
    ADD CONSTRAINT conquest_pokemon_abilities_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.abilities(id);


--
-- Name: conquest_pokemon_abilities conquest_pokemon_abilities_pokemon_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_abilities
    ADD CONSTRAINT conquest_pokemon_abilities_pokemon_species_id_fkey FOREIGN KEY (pokemon_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: conquest_pokemon_evolution conquest_pokemon_evolution_evolved_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_evolution
    ADD CONSTRAINT conquest_pokemon_evolution_evolved_species_id_fkey FOREIGN KEY (evolved_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: conquest_pokemon_evolution conquest_pokemon_evolution_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_evolution
    ADD CONSTRAINT conquest_pokemon_evolution_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: conquest_pokemon_evolution conquest_pokemon_evolution_kingdom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_evolution
    ADD CONSTRAINT conquest_pokemon_evolution_kingdom_id_fkey FOREIGN KEY (kingdom_id) REFERENCES public.conquest_kingdoms(id);


--
-- Name: conquest_pokemon_evolution conquest_pokemon_evolution_required_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_evolution
    ADD CONSTRAINT conquest_pokemon_evolution_required_stat_id_fkey FOREIGN KEY (required_stat_id) REFERENCES public.conquest_stats(id);


--
-- Name: conquest_pokemon_evolution conquest_pokemon_evolution_warrior_gender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_evolution
    ADD CONSTRAINT conquest_pokemon_evolution_warrior_gender_id_fkey FOREIGN KEY (warrior_gender_id) REFERENCES public.genders(id);


--
-- Name: conquest_pokemon_moves conquest_pokemon_moves_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_moves
    ADD CONSTRAINT conquest_pokemon_moves_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: conquest_pokemon_moves conquest_pokemon_moves_pokemon_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_moves
    ADD CONSTRAINT conquest_pokemon_moves_pokemon_species_id_fkey FOREIGN KEY (pokemon_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: conquest_pokemon_stats conquest_pokemon_stats_conquest_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_stats
    ADD CONSTRAINT conquest_pokemon_stats_conquest_stat_id_fkey FOREIGN KEY (conquest_stat_id) REFERENCES public.conquest_stats(id);


--
-- Name: conquest_pokemon_stats conquest_pokemon_stats_pokemon_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_pokemon_stats
    ADD CONSTRAINT conquest_pokemon_stats_pokemon_species_id_fkey FOREIGN KEY (pokemon_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: conquest_stat_names conquest_stat_names_conquest_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_stat_names
    ADD CONSTRAINT conquest_stat_names_conquest_stat_id_fkey FOREIGN KEY (conquest_stat_id) REFERENCES public.conquest_stats(id);


--
-- Name: conquest_stat_names conquest_stat_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_stat_names
    ADD CONSTRAINT conquest_stat_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: conquest_transformation_pokemon conquest_transformation_pokemon_pokemon_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_transformation_pokemon
    ADD CONSTRAINT conquest_transformation_pokemon_pokemon_species_id_fkey FOREIGN KEY (pokemon_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: conquest_transformation_pokemon conquest_transformation_pokemon_transformation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_transformation_pokemon
    ADD CONSTRAINT conquest_transformation_pokemon_transformation_id_fkey FOREIGN KEY (transformation_id) REFERENCES public.conquest_warrior_transformation(transformed_warrior_rank_id);


--
-- Name: conquest_transformation_warriors conquest_transformation_warriors_present_warrior_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_transformation_warriors
    ADD CONSTRAINT conquest_transformation_warriors_present_warrior_id_fkey FOREIGN KEY (present_warrior_id) REFERENCES public.conquest_warriors(id);


--
-- Name: conquest_transformation_warriors conquest_transformation_warriors_transformation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_transformation_warriors
    ADD CONSTRAINT conquest_transformation_warriors_transformation_id_fkey FOREIGN KEY (transformation_id) REFERENCES public.conquest_warrior_transformation(transformed_warrior_rank_id);


--
-- Name: conquest_warrior_names conquest_warrior_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_names
    ADD CONSTRAINT conquest_warrior_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: conquest_warrior_names conquest_warrior_names_warrior_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_names
    ADD CONSTRAINT conquest_warrior_names_warrior_id_fkey FOREIGN KEY (warrior_id) REFERENCES public.conquest_warriors(id);


--
-- Name: conquest_warrior_rank_stat_map conquest_warrior_rank_stat_map_warrior_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_rank_stat_map
    ADD CONSTRAINT conquest_warrior_rank_stat_map_warrior_rank_id_fkey FOREIGN KEY (warrior_rank_id) REFERENCES public.conquest_warrior_ranks(id);


--
-- Name: conquest_warrior_rank_stat_map conquest_warrior_rank_stat_map_warrior_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_rank_stat_map
    ADD CONSTRAINT conquest_warrior_rank_stat_map_warrior_stat_id_fkey FOREIGN KEY (warrior_stat_id) REFERENCES public.conquest_warrior_stats(id);


--
-- Name: conquest_warrior_ranks conquest_warrior_ranks_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_ranks
    ADD CONSTRAINT conquest_warrior_ranks_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.conquest_warrior_skills(id);


--
-- Name: conquest_warrior_ranks conquest_warrior_ranks_warrior_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_ranks
    ADD CONSTRAINT conquest_warrior_ranks_warrior_id_fkey FOREIGN KEY (warrior_id) REFERENCES public.conquest_warriors(id);


--
-- Name: conquest_warrior_skill_names conquest_warrior_skill_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_skill_names
    ADD CONSTRAINT conquest_warrior_skill_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: conquest_warrior_skill_names conquest_warrior_skill_names_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_skill_names
    ADD CONSTRAINT conquest_warrior_skill_names_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.conquest_warrior_skills(id);


--
-- Name: conquest_warrior_specialties conquest_warrior_specialties_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_specialties
    ADD CONSTRAINT conquest_warrior_specialties_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: conquest_warrior_specialties conquest_warrior_specialties_warrior_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_specialties
    ADD CONSTRAINT conquest_warrior_specialties_warrior_id_fkey FOREIGN KEY (warrior_id) REFERENCES public.conquest_warriors(id);


--
-- Name: conquest_warrior_stat_names conquest_warrior_stat_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_stat_names
    ADD CONSTRAINT conquest_warrior_stat_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: conquest_warrior_stat_names conquest_warrior_stat_names_warrior_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_stat_names
    ADD CONSTRAINT conquest_warrior_stat_names_warrior_stat_id_fkey FOREIGN KEY (warrior_stat_id) REFERENCES public.conquest_warrior_stats(id);


--
-- Name: conquest_warrior_transformation conquest_warrior_transformatio_transformed_warrior_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_transformation
    ADD CONSTRAINT conquest_warrior_transformatio_transformed_warrior_rank_id_fkey FOREIGN KEY (transformed_warrior_rank_id) REFERENCES public.conquest_warrior_ranks(id);


--
-- Name: conquest_warrior_transformation conquest_warrior_transformation_collection_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_transformation
    ADD CONSTRAINT conquest_warrior_transformation_collection_type_id_fkey FOREIGN KEY (collection_type_id) REFERENCES public.types(id);


--
-- Name: conquest_warrior_transformation conquest_warrior_transformation_completed_episode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_transformation
    ADD CONSTRAINT conquest_warrior_transformation_completed_episode_id_fkey FOREIGN KEY (completed_episode_id) REFERENCES public.conquest_episodes(id);


--
-- Name: conquest_warrior_transformation conquest_warrior_transformation_current_episode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_transformation
    ADD CONSTRAINT conquest_warrior_transformation_current_episode_id_fkey FOREIGN KEY (current_episode_id) REFERENCES public.conquest_episodes(id);


--
-- Name: conquest_warrior_transformation conquest_warrior_transformation_distant_warrior_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warrior_transformation
    ADD CONSTRAINT conquest_warrior_transformation_distant_warrior_id_fkey FOREIGN KEY (distant_warrior_id) REFERENCES public.conquest_warriors(id);


--
-- Name: conquest_warriors conquest_warriors_archetype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warriors
    ADD CONSTRAINT conquest_warriors_archetype_id_fkey FOREIGN KEY (archetype_id) REFERENCES public.conquest_warrior_archetypes(id);


--
-- Name: conquest_warriors conquest_warriors_gender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.conquest_warriors
    ADD CONSTRAINT conquest_warriors_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES public.genders(id);


--
-- Name: contest_combos contest_combos_first_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_combos
    ADD CONSTRAINT contest_combos_first_move_id_fkey FOREIGN KEY (first_move_id) REFERENCES public.moves(id);


--
-- Name: contest_combos contest_combos_second_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_combos
    ADD CONSTRAINT contest_combos_second_move_id_fkey FOREIGN KEY (second_move_id) REFERENCES public.moves(id);


--
-- Name: contest_effect_prose contest_effect_prose_contest_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_effect_prose
    ADD CONSTRAINT contest_effect_prose_contest_effect_id_fkey FOREIGN KEY (contest_effect_id) REFERENCES public.contest_effects(id);


--
-- Name: contest_effect_prose contest_effect_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_effect_prose
    ADD CONSTRAINT contest_effect_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: contest_type_names contest_type_names_contest_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_type_names
    ADD CONSTRAINT contest_type_names_contest_type_id_fkey FOREIGN KEY (contest_type_id) REFERENCES public.contest_types(id);


--
-- Name: contest_type_names contest_type_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.contest_type_names
    ADD CONSTRAINT contest_type_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: egg_group_prose egg_group_prose_egg_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.egg_group_prose
    ADD CONSTRAINT egg_group_prose_egg_group_id_fkey FOREIGN KEY (egg_group_id) REFERENCES public.egg_groups(id);


--
-- Name: egg_group_prose egg_group_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.egg_group_prose
    ADD CONSTRAINT egg_group_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: encounter_condition_prose encounter_condition_prose_encounter_condition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_prose
    ADD CONSTRAINT encounter_condition_prose_encounter_condition_id_fkey FOREIGN KEY (encounter_condition_id) REFERENCES public.encounter_conditions(id);


--
-- Name: encounter_condition_prose encounter_condition_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_prose
    ADD CONSTRAINT encounter_condition_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: encounter_condition_value_map encounter_condition_value_map_encounter_condition_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_value_map
    ADD CONSTRAINT encounter_condition_value_map_encounter_condition_value_id_fkey FOREIGN KEY (encounter_condition_value_id) REFERENCES public.encounter_condition_values(id);


--
-- Name: encounter_condition_value_map encounter_condition_value_map_encounter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_value_map
    ADD CONSTRAINT encounter_condition_value_map_encounter_id_fkey FOREIGN KEY (encounter_id) REFERENCES public.encounters(id);


--
-- Name: encounter_condition_value_prose encounter_condition_value_pro_encounter_condition_value_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_value_prose
    ADD CONSTRAINT encounter_condition_value_pro_encounter_condition_value_id_fkey FOREIGN KEY (encounter_condition_value_id) REFERENCES public.encounter_condition_values(id);


--
-- Name: encounter_condition_value_prose encounter_condition_value_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_value_prose
    ADD CONSTRAINT encounter_condition_value_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: encounter_condition_values encounter_condition_values_encounter_condition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_condition_values
    ADD CONSTRAINT encounter_condition_values_encounter_condition_id_fkey FOREIGN KEY (encounter_condition_id) REFERENCES public.encounter_conditions(id);


--
-- Name: encounter_method_prose encounter_method_prose_encounter_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_method_prose
    ADD CONSTRAINT encounter_method_prose_encounter_method_id_fkey FOREIGN KEY (encounter_method_id) REFERENCES public.encounter_methods(id);


--
-- Name: encounter_method_prose encounter_method_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_method_prose
    ADD CONSTRAINT encounter_method_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: encounter_slots encounter_slots_encounter_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_slots
    ADD CONSTRAINT encounter_slots_encounter_method_id_fkey FOREIGN KEY (encounter_method_id) REFERENCES public.encounter_methods(id);


--
-- Name: encounter_slots encounter_slots_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounter_slots
    ADD CONSTRAINT encounter_slots_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- Name: encounters encounters_encounter_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounters
    ADD CONSTRAINT encounters_encounter_slot_id_fkey FOREIGN KEY (encounter_slot_id) REFERENCES public.encounter_slots(id);


--
-- Name: encounters encounters_location_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounters
    ADD CONSTRAINT encounters_location_area_id_fkey FOREIGN KEY (location_area_id) REFERENCES public.location_areas(id);


--
-- Name: encounters encounters_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounters
    ADD CONSTRAINT encounters_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id);


--
-- Name: encounters encounters_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.encounters
    ADD CONSTRAINT encounters_version_id_fkey FOREIGN KEY (version_id) REFERENCES public.versions(id);


--
-- Name: evolution_chains evolution_chains_baby_trigger_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.evolution_chains
    ADD CONSTRAINT evolution_chains_baby_trigger_item_id_fkey FOREIGN KEY (baby_trigger_item_id) REFERENCES public.items(id);


--
-- Name: evolution_trigger_prose evolution_trigger_prose_evolution_trigger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.evolution_trigger_prose
    ADD CONSTRAINT evolution_trigger_prose_evolution_trigger_id_fkey FOREIGN KEY (evolution_trigger_id) REFERENCES public.evolution_triggers(id);


--
-- Name: evolution_trigger_prose evolution_trigger_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.evolution_trigger_prose
    ADD CONSTRAINT evolution_trigger_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: experience experience_growth_rate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.experience
    ADD CONSTRAINT experience_growth_rate_id_fkey FOREIGN KEY (growth_rate_id) REFERENCES public.growth_rates(id);


--
-- Name: generation_names generation_names_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.generation_names
    ADD CONSTRAINT generation_names_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: generation_names generation_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.generation_names
    ADD CONSTRAINT generation_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: generations generations_main_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.generations
    ADD CONSTRAINT generations_main_region_id_fkey FOREIGN KEY (main_region_id) REFERENCES public.regions(id);


--
-- Name: growth_rate_prose growth_rate_prose_growth_rate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.growth_rate_prose
    ADD CONSTRAINT growth_rate_prose_growth_rate_id_fkey FOREIGN KEY (growth_rate_id) REFERENCES public.growth_rates(id);


--
-- Name: growth_rate_prose growth_rate_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.growth_rate_prose
    ADD CONSTRAINT growth_rate_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: item_categories item_categories_pocket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_categories
    ADD CONSTRAINT item_categories_pocket_id_fkey FOREIGN KEY (pocket_id) REFERENCES public.item_pockets(id);


--
-- Name: item_category_prose item_category_prose_item_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_category_prose
    ADD CONSTRAINT item_category_prose_item_category_id_fkey FOREIGN KEY (item_category_id) REFERENCES public.item_categories(id);


--
-- Name: item_category_prose item_category_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_category_prose
    ADD CONSTRAINT item_category_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: item_flag_map item_flag_map_item_flag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flag_map
    ADD CONSTRAINT item_flag_map_item_flag_id_fkey FOREIGN KEY (item_flag_id) REFERENCES public.item_flags(id);


--
-- Name: item_flag_map item_flag_map_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flag_map
    ADD CONSTRAINT item_flag_map_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: item_flag_prose item_flag_prose_item_flag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flag_prose
    ADD CONSTRAINT item_flag_prose_item_flag_id_fkey FOREIGN KEY (item_flag_id) REFERENCES public.item_flags(id);


--
-- Name: item_flag_prose item_flag_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flag_prose
    ADD CONSTRAINT item_flag_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: item_flavor_summaries item_flavor_summaries_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flavor_summaries
    ADD CONSTRAINT item_flavor_summaries_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: item_flavor_summaries item_flavor_summaries_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flavor_summaries
    ADD CONSTRAINT item_flavor_summaries_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: item_flavor_text item_flavor_text_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flavor_text
    ADD CONSTRAINT item_flavor_text_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: item_flavor_text item_flavor_text_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flavor_text
    ADD CONSTRAINT item_flavor_text_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: item_flavor_text item_flavor_text_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_flavor_text
    ADD CONSTRAINT item_flavor_text_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- Name: item_fling_effect_prose item_fling_effect_prose_item_fling_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_fling_effect_prose
    ADD CONSTRAINT item_fling_effect_prose_item_fling_effect_id_fkey FOREIGN KEY (item_fling_effect_id) REFERENCES public.item_fling_effects(id);


--
-- Name: item_fling_effect_prose item_fling_effect_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_fling_effect_prose
    ADD CONSTRAINT item_fling_effect_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: item_game_indices item_game_indices_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_game_indices
    ADD CONSTRAINT item_game_indices_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: item_game_indices item_game_indices_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_game_indices
    ADD CONSTRAINT item_game_indices_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: item_names item_names_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_names
    ADD CONSTRAINT item_names_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: item_names item_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_names
    ADD CONSTRAINT item_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: item_pocket_names item_pocket_names_item_pocket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_pocket_names
    ADD CONSTRAINT item_pocket_names_item_pocket_id_fkey FOREIGN KEY (item_pocket_id) REFERENCES public.item_pockets(id);


--
-- Name: item_pocket_names item_pocket_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_pocket_names
    ADD CONSTRAINT item_pocket_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: item_prose item_prose_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_prose
    ADD CONSTRAINT item_prose_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: item_prose item_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.item_prose
    ADD CONSTRAINT item_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: items items_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.item_categories(id);


--
-- Name: items items_fling_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_fling_effect_id_fkey FOREIGN KEY (fling_effect_id) REFERENCES public.item_fling_effects(id);


--
-- Name: language_names language_names_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.language_names
    ADD CONSTRAINT language_names_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: language_names language_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.language_names
    ADD CONSTRAINT language_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: location_area_encounter_rates location_area_encounter_rates_encounter_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_area_encounter_rates
    ADD CONSTRAINT location_area_encounter_rates_encounter_method_id_fkey FOREIGN KEY (encounter_method_id) REFERENCES public.encounter_methods(id);


--
-- Name: location_area_encounter_rates location_area_encounter_rates_location_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_area_encounter_rates
    ADD CONSTRAINT location_area_encounter_rates_location_area_id_fkey FOREIGN KEY (location_area_id) REFERENCES public.location_areas(id);


--
-- Name: location_area_encounter_rates location_area_encounter_rates_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_area_encounter_rates
    ADD CONSTRAINT location_area_encounter_rates_version_id_fkey FOREIGN KEY (version_id) REFERENCES public.versions(id);


--
-- Name: location_area_prose location_area_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_area_prose
    ADD CONSTRAINT location_area_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: location_area_prose location_area_prose_location_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_area_prose
    ADD CONSTRAINT location_area_prose_location_area_id_fkey FOREIGN KEY (location_area_id) REFERENCES public.location_areas(id);


--
-- Name: location_areas location_areas_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_areas
    ADD CONSTRAINT location_areas_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: location_game_indices location_game_indices_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_game_indices
    ADD CONSTRAINT location_game_indices_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: location_game_indices location_game_indices_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_game_indices
    ADD CONSTRAINT location_game_indices_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: location_names location_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_names
    ADD CONSTRAINT location_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: location_names location_names_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.location_names
    ADD CONSTRAINT location_names_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: locations locations_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: machines machines_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT machines_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: machines machines_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT machines_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: machines machines_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT machines_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- Name: move_battle_style_prose move_battle_style_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_battle_style_prose
    ADD CONSTRAINT move_battle_style_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_battle_style_prose move_battle_style_prose_move_battle_style_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_battle_style_prose
    ADD CONSTRAINT move_battle_style_prose_move_battle_style_id_fkey FOREIGN KEY (move_battle_style_id) REFERENCES public.move_battle_styles(id);


--
-- Name: move_changelog move_changelog_changed_in_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_changelog
    ADD CONSTRAINT move_changelog_changed_in_version_group_id_fkey FOREIGN KEY (changed_in_version_group_id) REFERENCES public.version_groups(id);


--
-- Name: move_changelog move_changelog_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_changelog
    ADD CONSTRAINT move_changelog_effect_id_fkey FOREIGN KEY (effect_id) REFERENCES public.move_effects(id);


--
-- Name: move_changelog move_changelog_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_changelog
    ADD CONSTRAINT move_changelog_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: move_changelog move_changelog_target_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_changelog
    ADD CONSTRAINT move_changelog_target_id_fkey FOREIGN KEY (target_id) REFERENCES public.move_targets(id);


--
-- Name: move_changelog move_changelog_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_changelog
    ADD CONSTRAINT move_changelog_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: move_damage_class_prose move_damage_class_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_damage_class_prose
    ADD CONSTRAINT move_damage_class_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_damage_class_prose move_damage_class_prose_move_damage_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_damage_class_prose
    ADD CONSTRAINT move_damage_class_prose_move_damage_class_id_fkey FOREIGN KEY (move_damage_class_id) REFERENCES public.move_damage_classes(id);


--
-- Name: move_effect_changelog move_effect_changelog_changed_in_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_changelog
    ADD CONSTRAINT move_effect_changelog_changed_in_version_group_id_fkey FOREIGN KEY (changed_in_version_group_id) REFERENCES public.version_groups(id);


--
-- Name: move_effect_changelog move_effect_changelog_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_changelog
    ADD CONSTRAINT move_effect_changelog_effect_id_fkey FOREIGN KEY (effect_id) REFERENCES public.move_effects(id);


--
-- Name: move_effect_changelog_prose move_effect_changelog_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_changelog_prose
    ADD CONSTRAINT move_effect_changelog_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_effect_changelog_prose move_effect_changelog_prose_move_effect_changelog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_changelog_prose
    ADD CONSTRAINT move_effect_changelog_prose_move_effect_changelog_id_fkey FOREIGN KEY (move_effect_changelog_id) REFERENCES public.move_effect_changelog(id);


--
-- Name: move_effect_prose move_effect_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_prose
    ADD CONSTRAINT move_effect_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_effect_prose move_effect_prose_move_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_effect_prose
    ADD CONSTRAINT move_effect_prose_move_effect_id_fkey FOREIGN KEY (move_effect_id) REFERENCES public.move_effects(id);


--
-- Name: move_flag_map move_flag_map_move_flag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flag_map
    ADD CONSTRAINT move_flag_map_move_flag_id_fkey FOREIGN KEY (move_flag_id) REFERENCES public.move_flags(id);


--
-- Name: move_flag_map move_flag_map_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flag_map
    ADD CONSTRAINT move_flag_map_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: move_flag_prose move_flag_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flag_prose
    ADD CONSTRAINT move_flag_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_flag_prose move_flag_prose_move_flag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flag_prose
    ADD CONSTRAINT move_flag_prose_move_flag_id_fkey FOREIGN KEY (move_flag_id) REFERENCES public.move_flags(id);


--
-- Name: move_flavor_summaries move_flavor_summaries_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flavor_summaries
    ADD CONSTRAINT move_flavor_summaries_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_flavor_summaries move_flavor_summaries_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flavor_summaries
    ADD CONSTRAINT move_flavor_summaries_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: move_flavor_text move_flavor_text_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flavor_text
    ADD CONSTRAINT move_flavor_text_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: move_flavor_text move_flavor_text_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flavor_text
    ADD CONSTRAINT move_flavor_text_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: move_flavor_text move_flavor_text_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_flavor_text
    ADD CONSTRAINT move_flavor_text_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- Name: move_meta_ailment_names move_meta_ailment_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_ailment_names
    ADD CONSTRAINT move_meta_ailment_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_meta_ailment_names move_meta_ailment_names_move_meta_ailment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_ailment_names
    ADD CONSTRAINT move_meta_ailment_names_move_meta_ailment_id_fkey FOREIGN KEY (move_meta_ailment_id) REFERENCES public.move_meta_ailments(id);


--
-- Name: move_meta_category_prose move_meta_category_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_category_prose
    ADD CONSTRAINT move_meta_category_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_meta_category_prose move_meta_category_prose_move_meta_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_category_prose
    ADD CONSTRAINT move_meta_category_prose_move_meta_category_id_fkey FOREIGN KEY (move_meta_category_id) REFERENCES public.move_meta_categories(id);


--
-- Name: move_meta move_meta_meta_ailment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta
    ADD CONSTRAINT move_meta_meta_ailment_id_fkey FOREIGN KEY (meta_ailment_id) REFERENCES public.move_meta_ailments(id);


--
-- Name: move_meta move_meta_meta_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta
    ADD CONSTRAINT move_meta_meta_category_id_fkey FOREIGN KEY (meta_category_id) REFERENCES public.move_meta_categories(id);


--
-- Name: move_meta move_meta_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta
    ADD CONSTRAINT move_meta_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: move_meta_stat_changes move_meta_stat_changes_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_stat_changes
    ADD CONSTRAINT move_meta_stat_changes_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: move_meta_stat_changes move_meta_stat_changes_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_meta_stat_changes
    ADD CONSTRAINT move_meta_stat_changes_stat_id_fkey FOREIGN KEY (stat_id) REFERENCES public.stats(id);


--
-- Name: move_names move_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_names
    ADD CONSTRAINT move_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_names move_names_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_names
    ADD CONSTRAINT move_names_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: move_target_prose move_target_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_target_prose
    ADD CONSTRAINT move_target_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: move_target_prose move_target_prose_move_target_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.move_target_prose
    ADD CONSTRAINT move_target_prose_move_target_id_fkey FOREIGN KEY (move_target_id) REFERENCES public.move_targets(id);


--
-- Name: moves moves_contest_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_contest_effect_id_fkey FOREIGN KEY (contest_effect_id) REFERENCES public.contest_effects(id);


--
-- Name: moves moves_contest_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_contest_type_id_fkey FOREIGN KEY (contest_type_id) REFERENCES public.contest_types(id);


--
-- Name: moves moves_damage_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_damage_class_id_fkey FOREIGN KEY (damage_class_id) REFERENCES public.move_damage_classes(id);


--
-- Name: moves moves_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_effect_id_fkey FOREIGN KEY (effect_id) REFERENCES public.move_effects(id);


--
-- Name: moves moves_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: moves moves_super_contest_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_super_contest_effect_id_fkey FOREIGN KEY (super_contest_effect_id) REFERENCES public.super_contest_effects(id);


--
-- Name: moves moves_target_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_target_id_fkey FOREIGN KEY (target_id) REFERENCES public.move_targets(id);


--
-- Name: moves moves_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: nature_battle_style_preferences nature_battle_style_preferences_move_battle_style_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.nature_battle_style_preferences
    ADD CONSTRAINT nature_battle_style_preferences_move_battle_style_id_fkey FOREIGN KEY (move_battle_style_id) REFERENCES public.move_battle_styles(id);


--
-- Name: nature_battle_style_preferences nature_battle_style_preferences_nature_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.nature_battle_style_preferences
    ADD CONSTRAINT nature_battle_style_preferences_nature_id_fkey FOREIGN KEY (nature_id) REFERENCES public.natures(id);


--
-- Name: nature_names nature_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.nature_names
    ADD CONSTRAINT nature_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: nature_names nature_names_nature_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.nature_names
    ADD CONSTRAINT nature_names_nature_id_fkey FOREIGN KEY (nature_id) REFERENCES public.natures(id);


--
-- Name: nature_pokeathlon_stats nature_pokeathlon_stats_nature_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.nature_pokeathlon_stats
    ADD CONSTRAINT nature_pokeathlon_stats_nature_id_fkey FOREIGN KEY (nature_id) REFERENCES public.natures(id);


--
-- Name: nature_pokeathlon_stats nature_pokeathlon_stats_pokeathlon_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.nature_pokeathlon_stats
    ADD CONSTRAINT nature_pokeathlon_stats_pokeathlon_stat_id_fkey FOREIGN KEY (pokeathlon_stat_id) REFERENCES public.pokeathlon_stats(id);


--
-- Name: natures natures_decreased_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.natures
    ADD CONSTRAINT natures_decreased_stat_id_fkey FOREIGN KEY (decreased_stat_id) REFERENCES public.stats(id);


--
-- Name: natures natures_hates_flavor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.natures
    ADD CONSTRAINT natures_hates_flavor_id_fkey FOREIGN KEY (hates_flavor_id) REFERENCES public.contest_types(id);


--
-- Name: natures natures_increased_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.natures
    ADD CONSTRAINT natures_increased_stat_id_fkey FOREIGN KEY (increased_stat_id) REFERENCES public.stats(id);


--
-- Name: natures natures_likes_flavor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.natures
    ADD CONSTRAINT natures_likes_flavor_id_fkey FOREIGN KEY (likes_flavor_id) REFERENCES public.contest_types(id);


--
-- Name: pal_park pal_park_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pal_park
    ADD CONSTRAINT pal_park_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.pal_park_areas(id);


--
-- Name: pal_park_area_names pal_park_area_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pal_park_area_names
    ADD CONSTRAINT pal_park_area_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pal_park_area_names pal_park_area_names_pal_park_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pal_park_area_names
    ADD CONSTRAINT pal_park_area_names_pal_park_area_id_fkey FOREIGN KEY (pal_park_area_id) REFERENCES public.pal_park_areas(id);


--
-- Name: pal_park pal_park_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pal_park
    ADD CONSTRAINT pal_park_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokeathlon_stat_names pokeathlon_stat_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokeathlon_stat_names
    ADD CONSTRAINT pokeathlon_stat_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokeathlon_stat_names pokeathlon_stat_names_pokeathlon_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokeathlon_stat_names
    ADD CONSTRAINT pokeathlon_stat_names_pokeathlon_stat_id_fkey FOREIGN KEY (pokeathlon_stat_id) REFERENCES public.pokeathlon_stats(id);


--
-- Name: pokedex_prose pokedex_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokedex_prose
    ADD CONSTRAINT pokedex_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokedex_prose pokedex_prose_pokedex_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokedex_prose
    ADD CONSTRAINT pokedex_prose_pokedex_id_fkey FOREIGN KEY (pokedex_id) REFERENCES public.pokedexes(id);


--
-- Name: pokedex_version_groups pokedex_version_groups_pokedex_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokedex_version_groups
    ADD CONSTRAINT pokedex_version_groups_pokedex_id_fkey FOREIGN KEY (pokedex_id) REFERENCES public.pokedexes(id);


--
-- Name: pokedex_version_groups pokedex_version_groups_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokedex_version_groups
    ADD CONSTRAINT pokedex_version_groups_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- Name: pokedexes pokedexes_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokedexes
    ADD CONSTRAINT pokedexes_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: pokemon_abilities pokemon_abilities_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_abilities
    ADD CONSTRAINT pokemon_abilities_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.abilities(id);


--
-- Name: pokemon_abilities pokemon_abilities_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_abilities
    ADD CONSTRAINT pokemon_abilities_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id);


--
-- Name: pokemon_color_names pokemon_color_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_color_names
    ADD CONSTRAINT pokemon_color_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokemon_color_names pokemon_color_names_pokemon_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_color_names
    ADD CONSTRAINT pokemon_color_names_pokemon_color_id_fkey FOREIGN KEY (pokemon_color_id) REFERENCES public.pokemon_colors(id);


--
-- Name: pokemon_dex_numbers pokemon_dex_numbers_pokedex_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_dex_numbers
    ADD CONSTRAINT pokemon_dex_numbers_pokedex_id_fkey FOREIGN KEY (pokedex_id) REFERENCES public.pokedexes(id);


--
-- Name: pokemon_dex_numbers pokemon_dex_numbers_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_dex_numbers
    ADD CONSTRAINT pokemon_dex_numbers_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_egg_groups pokemon_egg_groups_egg_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_egg_groups
    ADD CONSTRAINT pokemon_egg_groups_egg_group_id_fkey FOREIGN KEY (egg_group_id) REFERENCES public.egg_groups(id);


--
-- Name: pokemon_egg_groups pokemon_egg_groups_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_egg_groups
    ADD CONSTRAINT pokemon_egg_groups_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_evolution pokemon_evolution_evolution_trigger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_evolution_trigger_id_fkey FOREIGN KEY (evolution_trigger_id) REFERENCES public.evolution_triggers(id);


--
-- Name: pokemon_evolution pokemon_evolution_evolved_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_evolved_species_id_fkey FOREIGN KEY (evolved_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_evolution pokemon_evolution_gender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES public.genders(id);


--
-- Name: pokemon_evolution pokemon_evolution_held_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_held_item_id_fkey FOREIGN KEY (held_item_id) REFERENCES public.items(id);


--
-- Name: pokemon_evolution pokemon_evolution_known_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_known_move_id_fkey FOREIGN KEY (known_move_id) REFERENCES public.moves(id);


--
-- Name: pokemon_evolution pokemon_evolution_known_move_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_known_move_type_id_fkey FOREIGN KEY (known_move_type_id) REFERENCES public.types(id);


--
-- Name: pokemon_evolution pokemon_evolution_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: pokemon_evolution pokemon_evolution_party_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_party_species_id_fkey FOREIGN KEY (party_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_evolution pokemon_evolution_party_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_party_type_id_fkey FOREIGN KEY (party_type_id) REFERENCES public.types(id);


--
-- Name: pokemon_evolution pokemon_evolution_trade_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_trade_species_id_fkey FOREIGN KEY (trade_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_evolution pokemon_evolution_trigger_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_evolution
    ADD CONSTRAINT pokemon_evolution_trigger_item_id_fkey FOREIGN KEY (trigger_item_id) REFERENCES public.items(id);


--
-- Name: pokemon_form_generations pokemon_form_generations_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_form_generations
    ADD CONSTRAINT pokemon_form_generations_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: pokemon_form_generations pokemon_form_generations_pokemon_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_form_generations
    ADD CONSTRAINT pokemon_form_generations_pokemon_form_id_fkey FOREIGN KEY (pokemon_form_id) REFERENCES public.pokemon_forms(id);


--
-- Name: pokemon_form_names pokemon_form_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_form_names
    ADD CONSTRAINT pokemon_form_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokemon_form_names pokemon_form_names_pokemon_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_form_names
    ADD CONSTRAINT pokemon_form_names_pokemon_form_id_fkey FOREIGN KEY (pokemon_form_id) REFERENCES public.pokemon_forms(id);


--
-- Name: pokemon_form_pokeathlon_stats pokemon_form_pokeathlon_stats_pokeathlon_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_form_pokeathlon_stats
    ADD CONSTRAINT pokemon_form_pokeathlon_stats_pokeathlon_stat_id_fkey FOREIGN KEY (pokeathlon_stat_id) REFERENCES public.pokeathlon_stats(id);


--
-- Name: pokemon_form_pokeathlon_stats pokemon_form_pokeathlon_stats_pokemon_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_form_pokeathlon_stats
    ADD CONSTRAINT pokemon_form_pokeathlon_stats_pokemon_form_id_fkey FOREIGN KEY (pokemon_form_id) REFERENCES public.pokemon_forms(id);


--
-- Name: pokemon_forms pokemon_forms_introduced_in_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_forms
    ADD CONSTRAINT pokemon_forms_introduced_in_version_group_id_fkey FOREIGN KEY (introduced_in_version_group_id) REFERENCES public.version_groups(id);


--
-- Name: pokemon_forms pokemon_forms_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_forms
    ADD CONSTRAINT pokemon_forms_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id);


--
-- Name: pokemon_game_indices pokemon_game_indices_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_game_indices
    ADD CONSTRAINT pokemon_game_indices_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id);


--
-- Name: pokemon_game_indices pokemon_game_indices_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_game_indices
    ADD CONSTRAINT pokemon_game_indices_version_id_fkey FOREIGN KEY (version_id) REFERENCES public.versions(id);


--
-- Name: pokemon_habitat_names pokemon_habitat_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_habitat_names
    ADD CONSTRAINT pokemon_habitat_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokemon_habitat_names pokemon_habitat_names_pokemon_habitat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_habitat_names
    ADD CONSTRAINT pokemon_habitat_names_pokemon_habitat_id_fkey FOREIGN KEY (pokemon_habitat_id) REFERENCES public.pokemon_habitats(id);


--
-- Name: pokemon_items pokemon_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_items
    ADD CONSTRAINT pokemon_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: pokemon_items pokemon_items_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_items
    ADD CONSTRAINT pokemon_items_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id);


--
-- Name: pokemon_items pokemon_items_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_items
    ADD CONSTRAINT pokemon_items_version_id_fkey FOREIGN KEY (version_id) REFERENCES public.versions(id);


--
-- Name: pokemon_move_method_prose pokemon_move_method_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_move_method_prose
    ADD CONSTRAINT pokemon_move_method_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokemon_move_method_prose pokemon_move_method_prose_pokemon_move_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_move_method_prose
    ADD CONSTRAINT pokemon_move_method_prose_pokemon_move_method_id_fkey FOREIGN KEY (pokemon_move_method_id) REFERENCES public.pokemon_move_methods(id);


--
-- Name: pokemon_moves pokemon_moves_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_moves
    ADD CONSTRAINT pokemon_moves_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(id);


--
-- Name: pokemon_moves pokemon_moves_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_moves
    ADD CONSTRAINT pokemon_moves_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id);


--
-- Name: pokemon_moves pokemon_moves_pokemon_move_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_moves
    ADD CONSTRAINT pokemon_moves_pokemon_move_method_id_fkey FOREIGN KEY (pokemon_move_method_id) REFERENCES public.pokemon_move_methods(id);


--
-- Name: pokemon_moves pokemon_moves_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_moves
    ADD CONSTRAINT pokemon_moves_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- Name: pokemon_shape_prose pokemon_shape_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_shape_prose
    ADD CONSTRAINT pokemon_shape_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokemon_shape_prose pokemon_shape_prose_pokemon_shape_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_shape_prose
    ADD CONSTRAINT pokemon_shape_prose_pokemon_shape_id_fkey FOREIGN KEY (pokemon_shape_id) REFERENCES public.pokemon_shapes(id);


--
-- Name: pokemon_species pokemon_species_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species
    ADD CONSTRAINT pokemon_species_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.pokemon_colors(id);


--
-- Name: pokemon_species pokemon_species_evolution_chain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species
    ADD CONSTRAINT pokemon_species_evolution_chain_id_fkey FOREIGN KEY (evolution_chain_id) REFERENCES public.evolution_chains(id);


--
-- Name: pokemon_species pokemon_species_evolves_from_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species
    ADD CONSTRAINT pokemon_species_evolves_from_species_id_fkey FOREIGN KEY (evolves_from_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_species_flavor_summaries pokemon_species_flavor_summaries_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_flavor_summaries
    ADD CONSTRAINT pokemon_species_flavor_summaries_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokemon_species_flavor_summaries pokemon_species_flavor_summaries_pokemon_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_flavor_summaries
    ADD CONSTRAINT pokemon_species_flavor_summaries_pokemon_species_id_fkey FOREIGN KEY (pokemon_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_species_flavor_text pokemon_species_flavor_text_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_flavor_text
    ADD CONSTRAINT pokemon_species_flavor_text_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: pokemon_species_flavor_text pokemon_species_flavor_text_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_flavor_text
    ADD CONSTRAINT pokemon_species_flavor_text_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_species_flavor_text pokemon_species_flavor_text_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_flavor_text
    ADD CONSTRAINT pokemon_species_flavor_text_version_id_fkey FOREIGN KEY (version_id) REFERENCES public.versions(id);


--
-- Name: pokemon_species pokemon_species_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species
    ADD CONSTRAINT pokemon_species_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: pokemon_species pokemon_species_growth_rate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species
    ADD CONSTRAINT pokemon_species_growth_rate_id_fkey FOREIGN KEY (growth_rate_id) REFERENCES public.growth_rates(id);


--
-- Name: pokemon_species pokemon_species_habitat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species
    ADD CONSTRAINT pokemon_species_habitat_id_fkey FOREIGN KEY (habitat_id) REFERENCES public.pokemon_habitats(id);


--
-- Name: pokemon pokemon_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_species_names pokemon_species_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_names
    ADD CONSTRAINT pokemon_species_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokemon_species_names pokemon_species_names_pokemon_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_names
    ADD CONSTRAINT pokemon_species_names_pokemon_species_id_fkey FOREIGN KEY (pokemon_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_species_prose pokemon_species_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_prose
    ADD CONSTRAINT pokemon_species_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: pokemon_species_prose pokemon_species_prose_pokemon_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species_prose
    ADD CONSTRAINT pokemon_species_prose_pokemon_species_id_fkey FOREIGN KEY (pokemon_species_id) REFERENCES public.pokemon_species(id);


--
-- Name: pokemon_species pokemon_species_shape_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_species
    ADD CONSTRAINT pokemon_species_shape_id_fkey FOREIGN KEY (shape_id) REFERENCES public.pokemon_shapes(id);


--
-- Name: pokemon_stats pokemon_stats_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_stats
    ADD CONSTRAINT pokemon_stats_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id);


--
-- Name: pokemon_stats pokemon_stats_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_stats
    ADD CONSTRAINT pokemon_stats_stat_id_fkey FOREIGN KEY (stat_id) REFERENCES public.stats(id);


--
-- Name: pokemon_types pokemon_types_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_types
    ADD CONSTRAINT pokemon_types_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(id);


--
-- Name: pokemon_types pokemon_types_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.pokemon_types
    ADD CONSTRAINT pokemon_types_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: region_names region_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.region_names
    ADD CONSTRAINT region_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: region_names region_names_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.region_names
    ADD CONSTRAINT region_names_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: stat_names stat_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.stat_names
    ADD CONSTRAINT stat_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: stat_names stat_names_stat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.stat_names
    ADD CONSTRAINT stat_names_stat_id_fkey FOREIGN KEY (stat_id) REFERENCES public.stats(id);


--
-- Name: stats stats_damage_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_damage_class_id_fkey FOREIGN KEY (damage_class_id) REFERENCES public.move_damage_classes(id);


--
-- Name: super_contest_combos super_contest_combos_first_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.super_contest_combos
    ADD CONSTRAINT super_contest_combos_first_move_id_fkey FOREIGN KEY (first_move_id) REFERENCES public.moves(id);


--
-- Name: super_contest_combos super_contest_combos_second_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.super_contest_combos
    ADD CONSTRAINT super_contest_combos_second_move_id_fkey FOREIGN KEY (second_move_id) REFERENCES public.moves(id);


--
-- Name: super_contest_effect_prose super_contest_effect_prose_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.super_contest_effect_prose
    ADD CONSTRAINT super_contest_effect_prose_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: super_contest_effect_prose super_contest_effect_prose_super_contest_effect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.super_contest_effect_prose
    ADD CONSTRAINT super_contest_effect_prose_super_contest_effect_id_fkey FOREIGN KEY (super_contest_effect_id) REFERENCES public.super_contest_effects(id);


--
-- Name: type_efficacy type_efficacy_damage_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.type_efficacy
    ADD CONSTRAINT type_efficacy_damage_type_id_fkey FOREIGN KEY (damage_type_id) REFERENCES public.types(id);


--
-- Name: type_efficacy type_efficacy_target_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.type_efficacy
    ADD CONSTRAINT type_efficacy_target_type_id_fkey FOREIGN KEY (target_type_id) REFERENCES public.types(id);


--
-- Name: type_game_indices type_game_indices_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.type_game_indices
    ADD CONSTRAINT type_game_indices_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: type_game_indices type_game_indices_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.type_game_indices
    ADD CONSTRAINT type_game_indices_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: type_names type_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.type_names
    ADD CONSTRAINT type_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: type_names type_names_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.type_names
    ADD CONSTRAINT type_names_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- Name: types types_damage_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_damage_class_id_fkey FOREIGN KEY (damage_class_id) REFERENCES public.move_damage_classes(id);


--
-- Name: types types_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: version_group_pokemon_move_methods version_group_pokemon_move_methods_pokemon_move_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_group_pokemon_move_methods
    ADD CONSTRAINT version_group_pokemon_move_methods_pokemon_move_method_id_fkey FOREIGN KEY (pokemon_move_method_id) REFERENCES public.pokemon_move_methods(id);


--
-- Name: version_group_pokemon_move_methods version_group_pokemon_move_methods_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_group_pokemon_move_methods
    ADD CONSTRAINT version_group_pokemon_move_methods_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- Name: version_group_regions version_group_regions_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_group_regions
    ADD CONSTRAINT version_group_regions_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: version_group_regions version_group_regions_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_group_regions
    ADD CONSTRAINT version_group_regions_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- Name: version_groups version_groups_generation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_groups
    ADD CONSTRAINT version_groups_generation_id_fkey FOREIGN KEY (generation_id) REFERENCES public.generations(id);


--
-- Name: version_names version_names_local_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_names
    ADD CONSTRAINT version_names_local_language_id_fkey FOREIGN KEY (local_language_id) REFERENCES public.languages(id);


--
-- Name: version_names version_names_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.version_names
    ADD CONSTRAINT version_names_version_id_fkey FOREIGN KEY (version_id) REFERENCES public.versions(id);


--
-- Name: versions versions_version_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pokedex
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_version_group_id_fkey FOREIGN KEY (version_group_id) REFERENCES public.version_groups(id);


--
-- PostgreSQL database dump complete
--

