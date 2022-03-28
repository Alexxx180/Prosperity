-- view permissions

GRANT EXECUTE ON PROCEDURE Prosperity.get_conformity_full_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_specialities_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_speciality_codes_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_speciality_general_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_speciality_professional_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_disciplines_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_discipline_codes_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_discipline_total_hours_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_theme_plan_by_discipline_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_themes_by_section_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_work_by_theme_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_work_types_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_task_by_work_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_discipline_meta_data_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_meta_types_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_discipline_sources_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_source_types_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_discipline_general_mastering_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_discipline_professional_mastering_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_theme_general_mastering_selection_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_theme_professional_mastering_selection_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_all_levels_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_conformity_general_competetions_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_conformity_professional_competetions_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.get_discipline_by_theme
TO 'redactor';

-- add permissions

GRANT EXECUTE ON PROCEDURE Prosperity.add_conformity
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_discipline
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_discipline_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_general_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_general_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_general_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_hour
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_level
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_meta_data
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_meta_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_professional_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_professional_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_professional_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_section
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_source
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_source_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_speciality
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_speciality_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_task
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_theme
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_work
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.add_work_type
TO 'redactor';

-- edit permissions

GRANT EXECUTE ON PROCEDURE Prosperity.set_conformity
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_discipline
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_discipline_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_general_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_general_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_general_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_hour
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_level
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_meta_data
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_meta_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_professional_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_professional_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_professional_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_section
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_source
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_source_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_speciality
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_speciality_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_task
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_theme
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_work
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.set_work_type
TO 'redactor';

-- mark permissions

GRANT EXECUTE ON PROCEDURE Prosperity.mark_conformity
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_discipline
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_discipline_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_general_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_general_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_general_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_hour
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_level
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_meta_data
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_meta_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_professional_competetion
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_professional_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_professional_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_section
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_source
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_source_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_speciality
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_speciality_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_task
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_theme
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_work
TO 'redactor';
GRANT EXECUTE ON PROCEDURE Prosperity.mark_work_type
TO 'redactor';

-- misc permissions

GRANT EXECUTE ON PROCEDURE Prosperity.send_report
TO 'redactor';
