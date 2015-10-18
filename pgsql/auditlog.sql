drop view auditlog;

create view auditlog as
select
    tag,
    time::date as "date",
    time::time as "time",
    (record->>'pid')::int as pid,
    record->>'host' as host,
    record->>'user' as user,
    record->>'level' as level,
    record->>'dbname' as dbname,
    record->>'pgaudit.tag' as cmd_tag,
    record->>'pgaudit.class' as class,
    record->>'pgaudit.object_type' as obj_type,
    record->>'pgaudit.object_name' as obj_name,
    record->>'pgaudit.command_text' as cmd_text
  from
    auditlog_raw
 where
    record->>'event' = 'AUDIT'
union all
select
    tag,
    time::date as "date",
    time::time as "time",
    (record->>'pid')::int as pid,
    record->>'host' as host,
    record->>'user' as user,
	record->>'level' as level,
	record->>'dbname' as dbname,
	record->>'pgaudit.tag' as tag,
	'AUTH' as class,
    null as obj_type,
    null as obj_name,
    record->>'message' as cmd_text
  from
    auditlog_raw
 where
    record->>'event' like '%auth%'
union all
select
    tag,
    time::date as "date",
    time::time as "time",
    (record->>'pid')::int as pid,
    record->>'host' as host,
    record->>'user' as user,
	record->>'level' as level,
	record->>'dbname' as dbname,
	record->>'pgaudit.tag' as tag,
	'PERMISSION' as class,
    null as obj_type,
    null as obj_name,
    record->>'message' as cmd_text
  from
    auditlog_raw
 where
    record->>'event' like 'permission%';

-- Viewer
REVOKE ALL ON auditlog FROM audit102;
GRANT SELECT ON auditlog TO audit102;

