CREATE OR REPLACE FUNCTION airporta_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."AirportA_audit"
      (id, geom, fid, name, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER airporta_insert_trigger
AFTER INSERT ON public."AirportA"
  FOR EACH ROW EXECUTE PROCEDURE airporta_insert();


CREATE OR REPLACE FUNCTION airporta_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."AirportA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER airporta_delete_trigger
AFTER DELETE ON public."AirportA"
  FOR EACH ROW EXECUTE PROCEDURE airporta_delete();


CREATE OR REPLACE FUNCTION public.airporta_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."AirportA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."AirportA_audit"
      (id, geom, fid, name, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER airporta_update_trigger
AFTER UPDATE ON public."AirportA"
  FOR EACH ROW EXECUTE PROCEDURE airporta_update();

CREATE OR REPLACE FUNCTION annotationa_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."AnnotationA_audit"
      (id, geom, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER annotationa_insert_trigger
AFTER INSERT ON public."AnnotationA"
  FOR EACH ROW EXECUTE PROCEDURE annotationa_insert();


CREATE OR REPLACE FUNCTION annotationa_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."AnnotationA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER annotationa_delete_trigger
AFTER DELETE ON public."AnnotationA"
  FOR EACH ROW EXECUTE PROCEDURE annotationa_delete();


CREATE OR REPLACE FUNCTION public.annotationa_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."AnnotationA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."AnnotationA_audit"
      (id, geom, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER annotationa_update_trigger
AFTER UPDATE ON public."AnnotationA"
  FOR EACH ROW EXECUTE PROCEDURE annotationa_update();

CREATE OR REPLACE FUNCTION annotationp_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."AnnotationP_audit"
      (id, geom, name, type, code, abbrev, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.abbrev, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER annotationp_insert_trigger
AFTER INSERT ON public."AnnotationP"
  FOR EACH ROW EXECUTE PROCEDURE annotationp_insert();


CREATE OR REPLACE FUNCTION annotationp_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."AnnotationP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER annotationp_delete_trigger
AFTER DELETE ON public."AnnotationP"
  FOR EACH ROW EXECUTE PROCEDURE annotationp_delete();


CREATE OR REPLACE FUNCTION public.annotationp_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."AnnotationP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."AnnotationP_audit"
      (id, geom, name, type, code, abbrev, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.abbrev, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER annotationp_update_trigger
AFTER UPDATE ON public."AnnotationP"
  FOR EACH ROW EXECUTE PROCEDURE annotationp_update();

CREATE OR REPLACE FUNCTION boundarya_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."BoundaryA_audit"
      (id, geom, fid, name, type, code, area, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.area, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER boundarya_insert_trigger
AFTER INSERT ON public."BoundaryA"
  FOR EACH ROW EXECUTE PROCEDURE boundarya_insert();


CREATE OR REPLACE FUNCTION boundarya_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."BoundaryA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER boundarya_delete_trigger
AFTER DELETE ON public."BoundaryA"
  FOR EACH ROW EXECUTE PROCEDURE boundarya_delete();


CREATE OR REPLACE FUNCTION public.boundarya_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."BoundaryA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."BoundaryA_audit"
      (id, geom, fid, name, type, code, area, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.area, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER boundarya_update_trigger
AFTER UPDATE ON public."BoundaryA"
  FOR EACH ROW EXECUTE PROCEDURE boundarya_update();

CREATE OR REPLACE FUNCTION buildings_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."BuildingsA_audit"
      (id, geom, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER buildings_insert_trigger
AFTER INSERT ON public."BuildingsA"
  FOR EACH ROW EXECUTE PROCEDURE buildings_insert();


CREATE OR REPLACE FUNCTION buildings_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."BuildingsA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER buildings_delete_trigger
AFTER DELETE ON public."BuildingsA"
  FOR EACH ROW EXECUTE PROCEDURE buildings_delete();


CREATE OR REPLACE FUNCTION public.buildings_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."BuildingsA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."BuildingsA_audit"
      (id, geom, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER buildings_update_trigger
AFTER UPDATE ON public."BuildingsA"
  FOR EACH ROW EXECUTE PROCEDURE buildings_update();

CREATE OR REPLACE FUNCTION communicationl_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."CommunicationL_audit"
      (id, geom, fid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER communicationl_insert_trigger
AFTER INSERT ON public."CommunicationL"
  FOR EACH ROW EXECUTE PROCEDURE communicationl_insert();


CREATE OR REPLACE FUNCTION communicationl_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."CommunicationL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER communicationl_delete_trigger
AFTER DELETE ON public."CommunicationL"
  FOR EACH ROW EXECUTE PROCEDURE communicationl_delete();


CREATE OR REPLACE FUNCTION public.communicationl_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."CommunicationL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."CommunicationL_audit"
      (id, geom, fid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER communicationl_update_trigger
AFTER UPDATE ON public."CommunicationL"
  FOR EACH ROW EXECUTE PROCEDURE communicationl_update();

CREATE OR REPLACE FUNCTION communicationp_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."CommunicationP_audit"
      (id, geom, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER communicationp_insert_trigger
AFTER INSERT ON public."CommunicationP"
  FOR EACH ROW EXECUTE PROCEDURE communicationp_insert();


CREATE OR REPLACE FUNCTION communicationp_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."CommunicationP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER communicationp_delete_trigger
AFTER DELETE ON public."CommunicationP"
  FOR EACH ROW EXECUTE PROCEDURE communicationp_delete();


CREATE OR REPLACE FUNCTION public.communicationp_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."CommunicationP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."CommunicationP_audit"
      (id, geom, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER communicationp_update_trigger
AFTER UPDATE ON public."CommunicationP"
  FOR EACH ROW EXECUTE PROCEDURE communicationp_update();

CREATE OR REPLACE FUNCTION electricitya_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."ElectricityA_audit"
      (id, geom, type, name, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.type, NEW.name, NEW.code, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER electricitya_insert_trigger
AFTER INSERT ON public."ElectricityA"
  FOR EACH ROW EXECUTE PROCEDURE electricitya_insert();


CREATE OR REPLACE FUNCTION electricitya_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."ElectricityA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER electricitya_delete_trigger
AFTER DELETE ON public."ElectricityA"
  FOR EACH ROW EXECUTE PROCEDURE electricitya_delete();


CREATE OR REPLACE FUNCTION public.electricitya_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."ElectricityA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."ElectricityA_audit"
      (id, geom, type, name, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.type, NEW.name, NEW.code, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER electricitya_update_trigger
AFTER UPDATE ON public."ElectricityA"
  FOR EACH ROW EXECUTE PROCEDURE electricitya_update();

CREATE OR REPLACE FUNCTION electricityl_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."ElectricityL_audit"
      (id, geom, fid, name, type, code, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER electricityl_insert_trigger
AFTER INSERT ON public."ElectricityL"
  FOR EACH ROW EXECUTE PROCEDURE electricityl_insert();


CREATE OR REPLACE FUNCTION electricityl_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."ElectricityL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER electricityl_delete_trigger
AFTER DELETE ON public."ElectricityL"
  FOR EACH ROW EXECUTE PROCEDURE electricityl_delete();


CREATE OR REPLACE FUNCTION public.electricityl_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."ElectricityL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."ElectricityL_audit"
      (id, geom, fid, name, type, code, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER electricityl_update_trigger
AFTER UPDATE ON public."ElectricityL"
  FOR EACH ROW EXECUTE PROCEDURE electricityl_update();

CREATE OR REPLACE FUNCTION electricityp_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."ElectricityP_audit"
      (id, geom, fid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER electricityp_insert_trigger
AFTER INSERT ON public."ElectricityP"
  FOR EACH ROW EXECUTE PROCEDURE electricityp_insert();


CREATE OR REPLACE FUNCTION electricityp_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."ElectricityP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER electricityp_delete_trigger
AFTER DELETE ON public."ElectricityP"
  FOR EACH ROW EXECUTE PROCEDURE electricityp_delete();


CREATE OR REPLACE FUNCTION public.electricityp_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."ElectricityP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."ElectricityP_audit"
      (id, geom, fid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER electricityp_update_trigger
AFTER UPDATE ON public."ElectricityP"
  FOR EACH ROW EXECUTE PROCEDURE electricityp_update();

CREATE OR REPLACE FUNCTION mininga_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."MiningA_audit"
      (id, geom, name, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER mininga_insert_trigger
AFTER INSERT ON public."MiningA"
  FOR EACH ROW EXECUTE PROCEDURE mininga_insert();


CREATE OR REPLACE FUNCTION mininga_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."MiningA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER mininga_delete_trigger
AFTER DELETE ON public."MiningA"
  FOR EACH ROW EXECUTE PROCEDURE mininga_delete();


CREATE OR REPLACE FUNCTION public.mininga_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."MiningA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."MiningA_audit"
      (id, geom, name, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER mininga_update_trigger
AFTER UPDATE ON public."MiningA"
  FOR EACH ROW EXECUTE PROCEDURE mininga_update();

CREATE OR REPLACE FUNCTION petothersa_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."PetOthersA_audit"
      (id, geom, type, code, status, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.type, NEW.code, NEW.status, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER petothersa_insert_trigger
AFTER INSERT ON public."PetOthersA"
  FOR EACH ROW EXECUTE PROCEDURE petothersa_insert();


CREATE OR REPLACE FUNCTION petothersa_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."PetOthersA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER petohersa_delete_trigger
AFTER DELETE ON public."PetOthersA"
  FOR EACH ROW EXECUTE PROCEDURE petothersa_delete();


CREATE OR REPLACE FUNCTION public.petothersa_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."PetOthersA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."PetOthersA_audit"
      (id, geom, type, code, status, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.type, NEW.code, NEW.status, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER petothersa_update_trigger
AFTER UPDATE ON public."PetOthersA"
  FOR EACH ROW EXECUTE PROCEDURE petothersa_update();

CREATE OR REPLACE FUNCTION petothersl_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."PetOthersL_audit"
      (id, geom, name, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER petothersl_insert_trigger
AFTER INSERT ON public."PetOthersL"
  FOR EACH ROW EXECUTE PROCEDURE petothersl_insert();


CREATE OR REPLACE FUNCTION petothersl_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."PetOthersL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER petohersl_delete_trigger
AFTER DELETE ON public."PetOthersL"
  FOR EACH ROW EXECUTE PROCEDURE petothersl_delete();


CREATE OR REPLACE FUNCTION public.petothersl_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."PetOthersL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."PetOthersL_audit"
      (id, geom, name, type, code, status, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.status, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER petothersl_update_trigger
AFTER UPDATE ON public."PetOthersL"
  FOR EACH ROW EXECUTE PROCEDURE petothersl_update();

CREATE OR REPLACE FUNCTION plantationa_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."PlantationA_audit"
      (id, geom, fid, abbrev, type, code, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.abbrev, NEW.type, NEW.code, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER plantationa_insert_trigger
AFTER INSERT ON public."PlantationA"
  FOR EACH ROW EXECUTE PROCEDURE plantationa_insert();


CREATE OR REPLACE FUNCTION plantationa_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."PlantationA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER plantationa_delete_trigger
AFTER DELETE ON public."PlantationA"
  FOR EACH ROW EXECUTE PROCEDURE plantationa_delete();


CREATE OR REPLACE FUNCTION public.plantationa_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."PlantationA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."PlantationA_audit"
      (id, geom, fid, abbrev, type, code, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.abbrev, NEW.type, NEW.code, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER plantationa_update_trigger
AFTER UPDATE ON public."PlantationA"
  FOR EACH ROW EXECUTE PROCEDURE plantationa_update();

CREATE OR REPLACE FUNCTION railwayl_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."RailwayL_audit"
      (id, geom, fid, name, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER railwayl_insert_trigger
AFTER INSERT ON public."RailwayL"
  FOR EACH ROW EXECUTE PROCEDURE railwayl_insert();


CREATE OR REPLACE FUNCTION railwayl_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."RailwayL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER railwayl_delete_trigger
AFTER DELETE ON public."RailwayL"
  FOR EACH ROW EXECUTE PROCEDURE railwayl_delete();


CREATE OR REPLACE FUNCTION public.railwayl_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."RailwayL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."RailwayL_audit"
      (id, geom, fid, name, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER railwayl_update_trigger
AFTER UPDATE ON public."RailwayL"
  FOR EACH ROW EXECUTE PROCEDURE railwayl_update();

CREATE OR REPLACE FUNCTION railwayp_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."RailwayP_audit"
      (id, geom, name, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER railwayp_insert_trigger
AFTER INSERT ON public."RailwayP"
  FOR EACH ROW EXECUTE PROCEDURE railwayp_insert();


CREATE OR REPLACE FUNCTION railwayp_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."RailwayP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER railwayp_delete_trigger
AFTER DELETE ON public."RailwayP"
  FOR EACH ROW EXECUTE PROCEDURE railwayp_delete();


CREATE OR REPLACE FUNCTION public.railwayp_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."RailwayP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."RailwayP_audit"
      (id, geom, name, type, code, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.status, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER railwayp_update_trigger
AFTER UPDATE ON public."RailwayP"
  FOR EACH ROW EXECUTE PROCEDURE railwayp_update();

CREATE OR REPLACE FUNCTION reliefa_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."ReliefA_audit"
      (id, geom, fid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER reliefa_insert_trigger
AFTER INSERT ON public."ReliefA"
  FOR EACH ROW EXECUTE PROCEDURE reliefa_insert();


CREATE OR REPLACE FUNCTION reliefa_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."ReliefA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER reliefa_delete_trigger
AFTER DELETE ON public."ReliefA"
  FOR EACH ROW EXECUTE PROCEDURE reliefa_delete();


CREATE OR REPLACE FUNCTION public.reliefa_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."ReliefA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."ReliefA_audit"
      (id, geom, fid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER reliefa_update_trigger
AFTER UPDATE ON public."ReliefA"
  FOR EACH ROW EXECUTE PROCEDURE reliefa_update();

CREATE OR REPLACE FUNCTION reliefp_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."ReliefP_audit"
      (id, geom, fid, height, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.height, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER reliefp_insert_trigger
AFTER INSERT ON public."ReliefP"
  FOR EACH ROW EXECUTE PROCEDURE reliefp_insert();


CREATE OR REPLACE FUNCTION reliefp_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."ReliefP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER reliefp_delete_trigger
AFTER DELETE ON public."ReliefP"
  FOR EACH ROW EXECUTE PROCEDURE reliefp_delete();


CREATE OR REPLACE FUNCTION public.reliefp_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."ReliefP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."ReliefP_audit"
      (id, geom, fid, height, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.height, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER reliefp_update_trigger
AFTER UPDATE ON public."ReliefP"
  FOR EACH ROW EXECUTE PROCEDURE reliefp_update();

CREATE OR REPLACE FUNCTION roadl_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."RoadL_audit"
      (id, geom, name, type, code, class, class_no, width, material, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.class, NEW.class_no, NEW.width, NEW.material, NEW.status, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER roadl_insert_trigger
AFTER INSERT ON public."RoadL"
  FOR EACH ROW EXECUTE PROCEDURE roadl_insert();


CREATE OR REPLACE FUNCTION roadl_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."RoadL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER roadl_delete_trigger
AFTER DELETE ON public."RoadL"
  FOR EACH ROW EXECUTE PROCEDURE roadl_delete();


CREATE OR REPLACE FUNCTION public.roadl_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."RoadL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."RoadL_audit"
      (id, geom, name, type, code, class, class_no, width, material, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.class, NEW.class_no, NEW.width, NEW.material, NEW.status, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER roadl_update_trigger
AFTER UPDATE ON public."RoadL"
  FOR EACH ROW EXECUTE PROCEDURE roadl_update();

CREATE OR REPLACE FUNCTION roadp_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."RoadP_audit"
      (id, geom, name, type, code, material, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.material, NEW.status, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER roadp_insert_trigger
AFTER INSERT ON public."RoadP"
  FOR EACH ROW EXECUTE PROCEDURE roadp_insert();


CREATE OR REPLACE FUNCTION roadp_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."RoadP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER roadp_delete_trigger
AFTER DELETE ON public."RoadP"
  FOR EACH ROW EXECUTE PROCEDURE roadp_delete();


CREATE OR REPLACE FUNCTION public.roadp_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."RoadP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."RoadP_audit"
      (id, geom, name, type, code, material, status, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.material, NEW.status, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER roadp_update_trigger
AFTER UPDATE ON public."RoadP"
  FOR EACH ROW EXECUTE PROCEDURE roadp_update();

CREATE OR REPLACE FUNCTION spotheight_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."SpotHeight_audit"
      (id, geom, height, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.height, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER spotheight_insert_trigger
AFTER INSERT ON public."SpotHeight"
  FOR EACH ROW EXECUTE PROCEDURE spotheight_insert();


CREATE OR REPLACE FUNCTION spotheight_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."SpotHeight_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER spotheight_delete_trigger
AFTER DELETE ON public."SpotHeight"
  FOR EACH ROW EXECUTE PROCEDURE spotheight_delete();


CREATE OR REPLACE FUNCTION public.spotheight_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."SpotHeight_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."SpotHeight_audit"
      (id, geom, height, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.height, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER spotheight_update_trigger
AFTER UPDATE ON public."SpotHeight_audit"
  FOR EACH ROW EXECUTE PROCEDURE spotheight_update();

CREATE OR REPLACE FUNCTION trigstationp_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."TrigonometricStationP_audit"
      (id, geom, fid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigstationp_insert_trigger
AFTER INSERT ON public."TrigonometricStationP"
  FOR EACH ROW EXECUTE PROCEDURE trigstationp_insert();


CREATE OR REPLACE FUNCTION trigstationp_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."TrigonometricStationP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigstationp_delete_trigger
AFTER DELETE ON public."TrigonometricStationP"
  FOR EACH ROW EXECUTE PROCEDURE trigstationp_delete();


CREATE OR REPLACE FUNCTION public.trigstationp_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."TrigonometricStationP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."TrigonometricStationP_audit"
      (id, geom, fid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER trigstationp_update_trigger
AFTER UPDATE ON public."TrigonometricStationP"
  FOR EACH ROW EXECUTE PROCEDURE trigstationp_update();

CREATE OR REPLACE FUNCTION vegetationa_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."VegetationA_audit"
      (id, geom, objectid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.objectid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER vegetationa_insert_trigger
AFTER INSERT ON public."VegetationA"
  FOR EACH ROW EXECUTE PROCEDURE vegetationa_insert();


CREATE OR REPLACE FUNCTION vegetationa_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."VegetationA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER vegetationa_delete_trigger
AFTER DELETE ON public."VegetationA"
  FOR EACH ROW EXECUTE PROCEDURE vegetationa_delete();


CREATE OR REPLACE FUNCTION public.vegetationa_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."VegetationA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."VegetationA_audit"
      (id, geom, objectid, name, type, code, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.objectid, NEW.name, NEW.type, NEW.code, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER vegetationa_update_trigger
AFTER UPDATE ON public."VegetationA"
  FOR EACH ROW EXECUTE PROCEDURE vegetationa_update();

CREATE OR REPLACE FUNCTION watera_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."WaterA_audit"
      (id, geom, name, type, code, flow, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.flow, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER watera_insert_trigger
AFTER INSERT ON public."WaterA_audit"
  FOR EACH ROW EXECUTE PROCEDURE watera_insert();


CREATE OR REPLACE FUNCTION watera_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."WaterA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER watera_delete_trigger
AFTER DELETE ON public."WaterA_audit"
  FOR EACH ROW EXECUTE PROCEDURE watera_delete();


CREATE OR REPLACE FUNCTION public.watera_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."WaterA_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."WaterA_audit"
      (id, geom, name, type, code, flow, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.flow, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER watera_update_trigger
AFTER UPDATE ON public."WaterA_audit"
  FOR EACH ROW EXECUTE PROCEDURE watera_update();

CREATE OR REPLACE FUNCTION waterl_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."WaterL_audit"
      (id, geom, name, type, code, flow, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.flow, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER waterl_insert_trigger
AFTER INSERT ON public."WaterL_audit"
  FOR EACH ROW EXECUTE PROCEDURE waterl_insert();


CREATE OR REPLACE FUNCTION waterl_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."WaterL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER waterl_delete_trigger
AFTER DELETE ON public."WaterL_audit"
  FOR EACH ROW EXECUTE PROCEDURE waterl_delete();


CREATE OR REPLACE FUNCTION public.waterl_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."WaterL_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."WaterL_audit"
      (id, geom, name, type, code, flow, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.name, NEW.type, NEW.code, NEW.flow, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER waterl_update_trigger
AFTER UPDATE ON public."WaterL_audit"
  FOR EACH ROW EXECUTE PROCEDURE waterl_update();

CREATE OR REPLACE FUNCTION waterp_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO public."WaterP_audit"
      (id, geom, fid, name, type, code, flow, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.flow, NEW.remarks, current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER waterp_insert_trigger
AFTER INSERT ON public."WaterP_audit"
  FOR EACH ROW EXECUTE PROCEDURE waterp_insert();


CREATE OR REPLACE FUNCTION waterp_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE public."WaterP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER waterp_delete_trigger
AFTER DELETE ON public."WaterP_audit"
  FOR EACH ROW EXECUTE PROCEDURE waterp_delete();


CREATE OR REPLACE FUNCTION public.waterp_update()
  RETURNS trigger AS
$BODY$
  BEGIN

    UPDATE public."WaterP_audit"
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and id = OLD.id;

    INSERT INTO public."WaterP_audit"
      (id, geom, fid, name, type, code, flow, remarks, created, created_by)
    VALUES
      (NEW.id, NEW.geom, NEW.fid, NEW.name, NEW.type, NEW.code, NEW.flow, NEW.remarks, current_timestamp, current_user);

    RETURN NEW;

  END;
$BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER waterp_update_trigger
AFTER UPDATE ON public."WaterP_audit"
  FOR EACH ROW EXECUTE PROCEDURE waterp_update();                                          
