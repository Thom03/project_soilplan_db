-- start of application table and trigger
CREATE TABLE soilplandata."Application_audit"
(
  id bigint NOT NULL DEFAULT nextval('"Application_audit_id_seq"'::regclass),
  geom geometry(MultiPolygon,4326),
  fid double precision,
  date date,
  approved boolean,
  district_number integer,
  farm_number integer,
  purpose_number integer,
  total_area_da real,
  spread_area_da real,
  manufacturer type character varying(254),
  sludge_category integer,
  max_dm_t_da real,
  dm real,
  max_sludge_t_da reaL,
  max_dm_t real,
  max_sludge_t real,
  delivered_amount real,
  comment text,  
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);
CREATE INDEX "sidx_Application_audit_geom"
  ON soilplandata."Application_audit"
  USING gist
  (geom);

CREATE TABLE soilplandata."Application"
(
  id bigint NOT NULL DEFAULT nextval('"Application_audit_id_seq"'::regclass),
  geom geometry(MultiPolygon,4326),
  fid double precision,
  date date,
  approved boolean,
  district_number integer,
  farm_number integer,
  purpose_number integer,
  total_area_da real,
  spread_area_da real,
  manufacturer type character varying(254),
  sludge_category integer,
  max_dm_t_da real,
  dm real,
  max_sludge_t_da reaL,
  max_dm_t real,
  max_sludge_t real,
  delivered_amount real,
  comment text,  
  CONSTRAINT "Application_pkey" PRIMARY KEY (id)
);
CREATE INDEX "sidx_Application_geom"
  ON soilplandata."Application"
  USING gist
  (geom);


-- End of application table and trigger


-- Start of spreading table and trigger

CREATE TABLE soilplandata."Spreading_audit"
(
  id bigint NOT NULL DEFAULT nextval('"Spreading_audit_id_seq"'::regclass),
  geom geometry(MultiPolygon,4326),
  spread_date date,
  manufacturer_actual text,
  spread_area_da real,
  spread_sludge_t real,
  sludge_approved_t real,
  sludge_remaining_t real, 
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);
CREATE INDEX "sidx_Spreading_audit_geom"
  ON soilplandata."Spreading_audit"
  USING gist
  (geom);

CREATE TABLE soilplandata."Spreading"
(
  id bigint NOT NULL DEFAULT nextval('"Spreading_id_seq"'::regclass),
  geom geometry(MultiPolygon,4326),
  spread_date date,
  manufacturer_actual text,
  spread_area_da real,
  spread_sludge_t real,
  sludge_approved_t real,
  sludge_remaining_t real, 
  CONSTRAINT "AnnotationA_pkey" PRIMARY KEY (id)
);
CREATE INDEX "sidx_Spreading_geom"
  ON soilplandata."Spreading"
  USING gist
  (geom);

  -- End of spreading table and trigger


  -- Start of hq table and trigger

CREATE TABLE soilplandata."Hq_audit"
(
  id bigint NOT NULL DEFAULT nextval('"Hq_audit_id_seq"'::regclass),
  geom geometry(MultiPoint,4326),
  name text,
  address text,
  city text,
  municipality text,
  phone text,
  email text,
  landowner text,
  landowner_address text,
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);
CREATE INDEX "Hq_audit_geom"
  ON soilplandata."Hq_audit"
  USING gist
  (geom);

CREATE TABLE soilplandata."Hq"
(
  id bigint NOT NULL DEFAULT nextval('"Hq_id_seq"'::regclass),
  geom geometry(MultiPoint,4326),
  name text,
  address text,
  city text,
  municipality text,
  phone text,
  email text,
  landowner text,
  landowner_address text,
  CONSTRAINT "Hq_pkey" PRIMARY KEY (id)
);
CREATE INDEX "Hq_geom"
  ON soilplandata."Hq"
  USING gist
  (geom);  


   -- End of hq table and trigger

     -- Start of storage table and trigger

CREATE TABLE soilplandata."Storage"
(
  id bigint NOT NULL DEFAULT nextval('"Storage_id_seq"'::regclass),
  geom geometry(MultiPoint,4326),
  fid double precision,
  capacity_t real,
  sand boolean,
  silt boolean,
  clay boolean,
  organic_soil boolean,
  distance_drinking_water_m real,
  distance_non_drinking_water_m real,
  distance_neighbor_m real,
  risk_of_overwater boolean,
  risk_management text,
  CONSTRAINT "Storage_pkey" PRIMARY KEY (id)
);
CREATE INDEX "Storage_geom"
  ON soilplandata."Storage"
  USING gist
  (geom);

CREATE TABLE soilplandata."Storage_audit"
(
  id bigint NOT NULL DEFAULT nextval('"Storage_audit_id_seq"'::regclass),
  geom geometry(MultiPoint,4326),
  fid double precision,
  capacity_t real,
  sand boolean,
  silt boolean,
  clay boolean,
  organic_soil boolean,
  distance_drinking_water_m real,
  distance_non_drinking_water_m real,
  distance_neighbor_m real,
  risk_of_overwater boolean,
  risk_management text,
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);


     -- End of storage table and trigger

          -- Start of water table and trigger


CREATE TABLE soilplandata."Water"
(
  id bigint NOT NULL DEFAULT nextval('"Water_id_seq"'::regclass),
  geom geometry(MultiPoint,4326),
  fid double precision,
  type text,
  drinking_water boolean, 
  CONSTRAINT "Water_pkey" PRIMARY KEY (id)
);
CREATE INDEX "Water_geom"
  ON soilplandata."Water"
  USING gist
  (geom);

CREATE TABLE soilplandata."Water_audit"
(
  id bigint NOT NULL DEFAULT nextval('"Water_audit_id_seq"'::regclass),
  geom geometry(MultiPolygon,4326),
  fid double precision,
  type text,
  drinking_water boolean, 
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);          

          -- End of water table and trigger


-- start of soil sample table and trigger
CREATE TABLE soilplandata."SoilSample_audit"
(
  id bigint NOT NULL DEFAULT nextval('"SoilSample_audit_id_seq"'::regclass),
  geom geometry(MultiPoint,4326),
  fid double precision,
  number integer,
  date date,
  soil_type text,
  clay_classification text,
  kg_l real,
  mold_classification text,
  ph real,
  phosphor real,
  potassium real,
  magnesium real,
  calcium real,
  valid_from date,
  valid_untill date,   
  created timestamp without time zone,
  created_by character varying(32),
  deleted timestamp without time zone,
  deleted_by character varying(32)
);
CREATE INDEX "sidx_SoilSample_audit_geom"
  ON soilplandata."SoilSample_audit"
  USING gist
  (geom);

CREATE TABLE soilplandata."SoilSample"
(
  id bigint NOT NULL DEFAULT nextval('"SoilSample_audit_id_seq"'::regclass),
  geom geometry(MultiPoint,4326),
  fid double precision,
  number integer,
  date date,
  soil_type text,
  clay_classification text,
  kg_l real,
  mold_classification text,
  ph real,
  phosphor real,
  potassium real,
  magnesium real,
  calcium real,
  valid_from date,
  valid_untill date,  
  CONSTRAINT "SoilSample_pkey" PRIMARY KEY (id)
);
CREATE INDEX "sidx_SoilSample_geom"
  ON soilplandata."SoilSample"
  USING gist
  (geom);


-- End of application table and trigger          