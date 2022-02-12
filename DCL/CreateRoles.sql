CREATE ROLE 'developer', 'administrator', 'redactor', 'viewer';

GRANT ALL ON prosperity.* TO 'developer';

-- viewer

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

-- redactor

-- view

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

-- add

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

-- edit

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

-- mark

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

-- misc

GRANT EXECUTE ON PROCEDURE prosperity.send_report
TO 'redactor';

-- administrator

-- view

GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_by_theme
TO 'administrator';

-- unmarked

GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_full_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_specialities_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_codes_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_general_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_professional_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_disciplines_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_codes_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_total_hours_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_plan_by_discipline_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_themes_by_section_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_by_theme_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_types_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_task_by_work_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_meta_data_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_types_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_sources_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_types_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_mastering_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_mastering_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_general_mastering_selection_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_professional_mastering_selection_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_all_levels_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_general_competetions_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_professional_competetions_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_by_theme_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_by_theme_unmarked
TO 'administrator';

-- marked

GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_full_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_specialities_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_codes_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_general_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_professional_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_disciplines_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_codes_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_total_hours_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_plan_by_discipline_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_themes_by_section_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_by_theme_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_types_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_task_by_work_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_meta_data_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_types_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_sources_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_types_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_mastering_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_mastering_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_general_mastering_selection_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_professional_mastering_selection_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_all_levels_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_general_competetions_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_professional_competetions_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_by_theme_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_by_theme_marked
TO 'administrator';

-- analyze

GRANT EXECUTE ON PROCEDURE prosperity.analyze_discipline
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.analyze_speciality
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.analyze_theme
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.analyze_topic
TO 'administrator';

-- unmark

GRANT EXECUTE ON PROCEDURE prosperity.unmark_conformity
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_discipline
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_discipline_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_general_competetion
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_general_mastering
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_general_selection
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_hour
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_level
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_meta_data
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_meta_type
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_professional_competetion
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_professional_mastering
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_professional_selection
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_section
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_source
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_source_type
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_speciality
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_speciality_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_task
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_theme
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_work
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_work_type
TO 'administrator';

-- drop

GRANT EXECUTE ON PROCEDURE prosperity.drop_conformity
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_discipline
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_discipline_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_general_competetion
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_general_mastering
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_general_selection
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_hour
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_level
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_meta_data
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_meta_type
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_professional_competetion
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_professional_mastering
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_professional_selection
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_section
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_source
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_source_type
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_speciality
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_speciality_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_task
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_theme
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_work
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_work_type
TO 'administrator';

-- unmark all

GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_conformities
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_disciplines
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_discipline_codes
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_general_competetions
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_general_mastering
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_general_selection
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_hours
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_levels
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_meta_data
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_meta_types
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_professional_competetions
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_professional_mastering
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_professional_selection
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_sections
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_sources
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_source_types
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_specialities
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_speciality_codes
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_tasks
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_themes
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_works
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_work_types
TO 'administrator';

-- used record-types count

GRANT EXECUTE ON PROCEDURE prosperity.get_work_type_linked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_level_linked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_type_linked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_type_linked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_code_linked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_code_linked
TO 'administrator';

-- drop all

GRANT EXECUTE ON PROCEDURE prosperity.drop_all_conformities
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_disciplines
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_discipline_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_general_competetions
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_general_mastering
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_general_selection
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_hours
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_levels
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_meta_data
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_meta_type
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_professional_competetions
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_professional_mastering
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_professional_selection
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_theme_plan
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_sources
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_source_types
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_specialities
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_speciality_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_tasks
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_themes
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_works
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_work_types
TO 'administrator';

-- increase column size

GRANT EXECUTE ON PROCEDURE prosperity.increase_disciplines_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_discipline_codes_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_general_competetions_knowledge
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_general_competetions_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_general_competetions_skills
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_levels_description
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_levels_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_meta_data_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_meta_types_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_professional_competetions_experience
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_professional_competetions_knowledge
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_professional_competetions_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_professional_competetions_skills
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_sources_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_source_types_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_specialities_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_speciality_codes_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_tasks_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_themes_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_theme_plan_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.increase_work_types_name
TO 'administrator';

-- check column sizes

GRANT EXECUTE ON PROCEDURE prosperity.check_disciplines_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_discipline_codes_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_general_competetions_knowledge
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_general_competetions_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_general_competetions_skills
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_levels_description
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_levels_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_meta_data_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_meta_types_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_professional_competetions_experience
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_professional_competetions_knowledge
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_professional_competetions_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_professional_competetions_skills
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_sources_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_source_types_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_specialities_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_speciality_codes_code
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_tasks_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_themes_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_theme_plan_name
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_work_types_name
TO 'administrator';

-- administrating: redactors management

GRANT EXECUTE ON PROCEDURE prosperity.get_redactors
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.check_redactor
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.add_redactor
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.drop_redactor
TO 'administrator';