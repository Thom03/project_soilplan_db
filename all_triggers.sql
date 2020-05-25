CREATE OR REPLACE FUNCTION application_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO soilplandata."Application_audit"
      (id, geom, fid, approved, district_number, farm_number, purpose_number, total_area_da, spread_area_da, manufacturer, sludge_category, max_dm_t_da, dm, max_sludge_t_da, max_dm_t, max_sludge_t,delivered_amount, comment, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.approved, NEW.district_number, NEW.farm_number, NEW.purpose_number, NEW.total_area_da, NEW.spread_area_da, NEW.manufacturer, NEW.sludge_category, NEW.max_dm_t_da, NEW.dm, NEW.max_sludge_t_da, NEW.max_dm_t, NEW.max_sludge_t,NEW.delivered_amount, NEW.comment, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER application_insert_trigger
AFTER INSERT ON soilplandata."Application"
  FOR EACH ROW EXECUTE PROCEDURE application_insert();


CREATE OR REPLACE FUNCTION application_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE soilplandata."Application_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER application_delete_trigger
AFTER DELETE ON soilplandata."Application"
  FOR EACH ROW EXECUTE PROCEDURE application_delete();


CREATE OR REPLACE FUNCTION soilplandata.applicatin_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE soilplandata."Application_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO soilplandata."Application_audit"
      (id, geom, fid,  approved, district_number, farm_number, purpose_number, total_area_da, spread_area_da, manufacturer, sludge_category, max_dm_t_da, dm, max_sludge_t_da, max_dm_t, max_sludge_t,delivered_amount, comment, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.approved, NEW.district_number, NEW.farm_number, NEW.purpose_number, NEW.total_area_da, NEW.spread_area_da, NEW.manufacturer, NEW.sludge_category, NEW.max_dm_t_da, NEW.dm, NEW.max_sludge_t_da, NEW.max_dm_t, NEW.max_sludge_t,NEW.delivered_amount, NEW.comment, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;





CREATE OR REPLACE FUNCTION spreading_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO soilplandata."Spreading_audit"
      (id, geom, application_id, spread_date, manufacturer_actual, spread_area_da, spread_sludge_t, sludge_approved_t, sludge_remaining_t, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.application_id, NEW.spread_date, NEW.manufacturer_actual, NEW.spread_area_da, NEW.spread_sludge_t, NEW.sludge_approved_t, NEW.sludge_remaining_t, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER spreading_insert_trigger
AFTER INSERT ON soilplandata."Spreading"
  FOR EACH ROW EXECUTE PROCEDURE spreading_insert();


CREATE OR REPLACE FUNCTION spreading_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE soilplandata."Spreading_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER spreading_delete_trigger
AFTER DELETE ON soilplandata."Spreading"
  FOR EACH ROW EXECUTE PROCEDURE spreading_delete();


CREATE OR REPLACE FUNCTION soilplandata.spreading_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE soilplandata."Spreading_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO soilplandata."Spreading_audit"
      (id, geom, application_id, spread_date, manufacturer_actual, spread_area_da, spread_sludge_t, sludge_approved_t, sludge_remaining_t, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.application_id, NEW.spread_date, NEW.manufacturer_actual, NEW.spread_area_da, NEW.spread_sludge_t, NEW.sludge_approved_t, NEW.sludge_remaining_t, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;






CREATE OR REPLACE FUNCTION hq_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO soilplandata."Hq_audit"
      (id, geom, application_id, hq_name, address, city, municipality, phone, email, landowner, landowner_address, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.application_id, NEW.hq_name, NEW.address,  NEW.city,  NEW.municipality,  NEW.phone,  NEW.email,  NEW.landowner,  NEW.landowner_address, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER hq_insert_trigger
AFTER INSERT ON soilplandata."Hq"
  FOR EACH ROW EXECUTE PROCEDURE hq_insert();


CREATE OR REPLACE FUNCTION hq_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE soilplandata."Hq_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER hq_delete_trigger
AFTER DELETE ON soilplandata."Hq"
  FOR EACH ROW EXECUTE PROCEDURE hq_delete();


CREATE OR REPLACE FUNCTION soilplandata.hq_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE soilplandata."Hq_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO soilplandata."Hq_audit"
      (id, geom, application_id, hq_name, address, city, municipality, phone, email, landowner, landowner_address, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.application_id, NEW.hq_name, NEW.address,  NEW.city,  NEW.municipality,  NEW.phone,  NEW.email,  NEW.landowner,  NEW.landowner_address, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION storage_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO soilplandata."Storage_audit"
      (id, geom, fid, application_id, capacity_t, sand, silt, clay, organic_soil, distance_drinking_water_m, distance_non_drinking_water_m, distance_neighbor_m,risk_of_overwater, risk_management, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.application_id, NEW.capacity_t, NEW.sand, NEW.silt, NEW.clay, NEW.organic_soil, NEW.distance_drinking_water_m, NEW.distance_non_drinking_water_m, NEW.distance_neighbor_m, NEW.risk_of_overwater, NEW.risk_management, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER storage_insert_trigger
AFTER INSERT ON soilplandata."Storage"
  FOR EACH ROW EXECUTE PROCEDURE storage_insert();


CREATE OR REPLACE FUNCTION storage_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE soilplandata."Storage_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER storage_delete_trigger
AFTER DELETE ON soilplandata."Storage"
  FOR EACH ROW EXECUTE PROCEDURE storage_delete();


CREATE OR REPLACE FUNCTION soilplandata.storage_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE soilplandata."Storage_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO soilplandata."Storage_audit"
      (id, geom, fid, application_id, capacity_t, sand, silt, clay, organic_soil, distance_drinking_water_m, distance_non_drinking_water_m, distance_neighbor_m,risk_of_overwater, risk_management, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.application_id, NEW.capacity_t, NEW.sand, NEW.silt, NEW.clay, NEW.organic_soil, NEW.distance_drinking_water_m, NEW.distance_non_drinking_water_m, NEW.distance_neighbor_m, NEW.risk_of_overwater, NEW.risk_management, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;





  

CREATE OR REPLACE FUNCTION water_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO soilplandata."Water_audit"
      (id, geom, fid, application_id, type, drinking_water, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.application_id, NEW.type, NEW.drinking_water,  current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER water_insert_trigger
AFTER INSERT ON soilplandata."Water"
  FOR EACH ROW EXECUTE PROCEDURE water_insert();


CREATE OR REPLACE FUNCTION water_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE soilplandata."Water_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER water_delete_trigger
AFTER DELETE ON soilplandata."Water"
  FOR EACH ROW EXECUTE PROCEDURE water_delete();


CREATE OR REPLACE FUNCTION soilplandata.water_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE soilplandata."Water_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO soilplandata."Water_audit"
      (id, geom, fid, application_id, type, drinking_water, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.application_id, NEW.type, NEW.drinking_water, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION soilsample_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO soilplandata."SoilSample_audit"
      (id, geom, fid, application_id, number, date, soil_type, clay_classification, kg_l, mold_classification, ph,phosphor, potassium, magnesium ,calcium, valid_from, valid_untill,  created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.application_id, NEW.number, NEW.date, NEW.soil_type, NEW.clay_classification, NEW.kg_l, NEW.mold_classification, NEW.ph,NEW.phosphor, NEW.potassium, NEW.magnesium ,NEW.calcium, NEW.valid_from, NEW.valid_untill, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER soilsample_insert_trigger
AFTER INSERT ON soilplandata."SoilSample"
  FOR EACH ROW EXECUTE PROCEDURE soilsample_insert();


CREATE OR REPLACE FUNCTION soilsample_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE soilplandata."SoilSample_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER soilsample_delete_trigger
AFTER DELETE ON soilplandata."SoilSample"
  FOR EACH ROW EXECUTE PROCEDURE soilsample_delete();


CREATE OR REPLACE FUNCTION soilplandata.soilsample_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE soilplandata."SoilSample_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO soilplandata."SoilSample_audit"
      (id, geom, fid, application_id, number, date, soil_type, clay_classification, kg_l, mold_classification, ph,phosphor, potassium, magnesium ,calcium, valid_from, valid_untill, created, created_by)
    VALUES
      (NEW.id, NEW.geom,  NEW.fid, NEW.application_id, NEW.number, NEW.date, NEW.soil_type, NEW.clay_classification, NEW.kg_l, NEW.mold_classification, NEW.ph,NEW.phosphor, NEW.potassium, NEW.magnesium ,NEW.calcium, NEW.valid_from, NEW.valid_untill, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

