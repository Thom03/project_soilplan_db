CREATE TABLE public."Application_audit"
(
  id bigint NOT NULL DEFAULT nextval('"AirportA_audit_id_seq"'::regclass),
  geom geometry(MultiPolygon,4210),
  fid double precision,
  name character varying(254),
  type character varying(254),
  code double precision,
  status character varying(254),
  remarks character varying(254),
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);
CREATE INDEX "sidx_Application_audit_geom"
  ON public."AirportA_audit"
  USING gist
  (geom);

CREATE TABLE public."AirportA"
(
  id bigint NOT NULL DEFAULT nextval('"AirportA_id_seq"'::regclass),
  geom geometry(MultiPolygon,4210),
  fid double precision,
  name character varying(254),
  type character varying(254),
  code double precision,
  status character varying(254),
  remarks character varying(254),
  date_time date,
  "user" character varying(30),
  CONSTRAINT "AirportA_pkey" PRIMARY KEY (id)
);
CREATE INDEX "sidx_AirportA_geom"
  ON public."AirportA"
  USING gist
  (geom);

CREATE TABLE public."AnnotationA_audit"
(
  id bigint NOT NULL DEFAULT nextval('"AnnotationA_audit_id_seq"'::regclass),
  geom geometry(MultiPolygon,4210),
  name character varying(254),
  type character varying(254),
  code numeric,
  remarks character varying(254),
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);
CREATE INDEX "sidx_AnnotationA_audit_geom"
  ON public."AnnotationA_audit"
  USING gist
  (geom);

CREATE TABLE public."AnnotationA"
(
  id bigint NOT NULL DEFAULT nextval('"AnnotationA_id_seq"'::regclass),
  geom geometry(MultiPolygon,4210),
  name character varying(254),
  type character varying(254),
  code numeric,
  remarks character varying(254),
  date_time character varying(254),
  "user" character varying(254),
  CONSTRAINT "AnnotationA_pkey" PRIMARY KEY (id)
);
CREATE INDEX "sidx_AnnotationA_geom"
  ON public."AnnotationA"
  USING gist
  (geom);

CREATE TABLE public."AnnotationP_audit"
(
  id bigint NOT NULL DEFAULT nextval('"AnnotationP_audit_id_seq"'::regclass),
  geom geometry(MultiPoint,4210),
  name character varying(254),
  type character varying(254),
  code numeric,
  abbrev character varying(254),
  remarks character varying(254),
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);
CREATE INDEX "AnnotationP_audit_geom"
  ON public."AnnotationP_audit"
  USING gist
  (geom);

CREATE TABLE public."AnnotationP"
(
  id bigint NOT NULL DEFAULT nextval('"AnnotationP_id_seq"'::regclass),
  geom geometry(MultiPoint,4210),
  name character varying(254),
  type character varying(254),
  code numeric,
  abbrev character varying(254),
  remarks character varying(254),
  date_time character varying(254),
  "user" character varying(254),
  CONSTRAINT "AnnotationP_pkey" PRIMARY KEY (id)
);
CREATE INDEX "AnnotationP_geom"
  ON public."AnnotationP"
  USING gist
  (geom);  

CREATE TABLE public."BoundaryA"
(
  id bigint NOT NULL DEFAULT nextval('"BoundaryA_id_seq"'::regclass),
  geom geometry(MultiPolygon,4210),
  fid double precision,
  name character varying(254),
  type character varying(254),
  code double precision,
  area double precision,
  remarks character varying(254),
  date_time date,
  "user" character varying(30),
  CONSTRAINT "BoundaryA_pkey" PRIMARY KEY (id)
);
CREATE INDEX "BoundaryA_geom"
  ON public."BoundaryA"
  USING gist
  (geom);

CREATE TABLE public."BoundaryA_audit"
(
  id bigint NOT NULL DEFAULT nextval('"BoundaryA_audit_id_seq"'::regclass),
  geom geometry(MultiPolygon,4210),
  fid double precision,
  name character varying(254),
  type character varying(254),
  code double precision,
  area double precision,
  remarks character varying(254),
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);
