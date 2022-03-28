-- view permissions

GRANT EXECUTE ON PROCEDURE prosperity.get_professional_competetion
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_specialities_full
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_general
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_professional
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_disciplines_full
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_disciplines
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_total_hours
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_plan_by_discipline
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_themes_by_section
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_by_theme
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_types
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_task_by_work
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_meta_data
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_types
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_sources
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_type
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_types
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_mastering
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_mastering
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_general_mastering_selection
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_professional_mastering_selection
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_all_levels
TO 'viewer';