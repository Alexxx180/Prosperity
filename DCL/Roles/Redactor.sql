-- view permissions

GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_full_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_specialities_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_codes_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_general_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_professional_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_disciplines_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_codes_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_total_hours_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_plan_by_discipline_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_themes_by_section_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_by_theme_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_types_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_task_by_work_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_meta_data_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_types_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_sources_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_types_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_mastering_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_mastering_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_general_mastering_selection_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_professional_mastering_selection_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_all_levels_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_general_competetions_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_professional_competetions_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_by_theme_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_by_theme_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_by_theme
TO 'redactor';

-- add permissions

GRANT EXECUTE ON PROCEDURE prosperity.add_conformity
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_discipline
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_discipline_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_general_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_general_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_general_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_hour
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_level
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_meta_data
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_meta_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_professional_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_professional_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_professional_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_section
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_source
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_source_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_speciality
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_speciality_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_task
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_theme
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_work
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_work_type
TO 'redactor';

-- edit permissions

GRANT EXECUTE ON PROCEDURE prosperity.set_conformity
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_discipline
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_discipline_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_general_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_general_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_general_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_hour
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_level
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_meta_data
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_meta_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_professional_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_professional_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_professional_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_section
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_source
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_source_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_speciality
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_speciality_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_task
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_theme
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_work
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_work_type
TO 'redactor';

-- mark permissions

GRANT EXECUTE ON PROCEDURE prosperity.mark_conformity
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_discipline
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_discipline_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_general_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_general_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_general_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_hour
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_level
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_meta_data
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_meta_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_professional_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_professional_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_professional_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_section
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_source
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_source_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_speciality
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_speciality_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_task
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_theme
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_work
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_work_type
TO 'redactor';

-- misc permissions

GRANT EXECUTE ON PROCEDURE prosperity.send_report
TO 'redactor';