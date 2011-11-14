PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20111107034512');
INSERT INTO "schema_migrations" VALUES('20111107035143');
INSERT INTO "schema_migrations" VALUES('20111107035834');
INSERT INTO "schema_migrations" VALUES('20111107035932');
CREATE TABLE "lugars" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nombre" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "lugars" VALUES(1,'Ocotal','2011-11-07 04:08:00.726469','2011-11-07 04:08:00.726469');
INSERT INTO "lugars" VALUES(2,'Somoto','2011-11-07 04:08:17.052697','2011-11-07 04:08:17.052697');
INSERT INTO "lugars" VALUES(3,'Jalapa','2011-11-07 04:08:38.631675','2011-11-07 04:08:38.631675');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nombre" varchar(255), "password_digest" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "users" VALUES(1,'Ronald','','2011-11-07 04:41:47.244688','2011-11-07 04:41:47.244688');
INSERT INTO "users" VALUES(2,'Wilman','','2011-11-07 04:42:02.506730','2011-11-07 04:42:02.506730');
INSERT INTO "users" VALUES(3,'Alexander','','2011-11-07 04:42:18.099778','2011-11-07 04:42:18.099778');
INSERT INTO "users" VALUES(4,'Oliver','','2011-11-07 08:42:18.099778','2011-11-07 08:42:18.099778');
CREATE TABLE "registros" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "fecha" date, "turno_id" integer, "llamada" decimal, "ciber" decimal, "impresion" decimal, "claro" decimal, "movistar" decimal, "lugar_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "turnos" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "descripcion" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "turnos" VALUES(1,'Mañana','2011-11-07 04:09:37.947019','2011-11-07 04:09:37.947019');
INSERT INTO "turnos" VALUES(2,'Tarde','2011-11-07 04:09:53.516864','2011-11-07 04:09:53.516864');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('lugars',3);
INSERT INTO "sqlite_sequence" VALUES('turnos',2);
INSERT INTO "sqlite_sequence" VALUES('users',3);
INSERT INTO "sqlite_sequence" VALUES('registros',4);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
COMMIT;