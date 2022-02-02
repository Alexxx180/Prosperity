CREATE ROLE 'developer', 'administrator', 'redactor', 'viewer';

GRANT ALL ON prosperity.* TO 'developer';

-- viewer

GRANT EXECUTE ON PROCEDURE prosperity.get_professional_competetion(comp_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_specialities_full
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_general(speciality_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_professional(speciality_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_disciplines_full
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_disciplines(speciality_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_total_hours(discipline_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_plan_by_discipline(discipline_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_themes_by_section(section_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_by_theme(theme_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_types
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_task_by_work(work_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_meta_data(discipline_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_types
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_sources(discipline_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_type(type_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_mastering(discipline_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_mastering(discipline_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_general_mastering_selection(theme_id)
TO 'viewer';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_professional_mastering_selection(theme_id)
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
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_general_unmarked(speciality_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_professional_unmarked(speciality_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_disciplines_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_codes_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_total_hours_unmarked(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_plan_by_discipline_unmarked(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_themes_by_section_unmarked(section_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_by_theme_unmarked(theme_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_types_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_task_by_work_unmarked(work_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_meta_data_unmarked(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_types_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_sources_unmarked(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_type_unmarked(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_mastering_unmarked(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_mastering_unmarked(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_general_mastering_selection_unmarked(theme_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_professional_mastering_selection_unmarked(theme_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_all_levels_unmarked
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_general_competetions_unmarked(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_professional_competetions_unmarked(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_by_theme_unmarked(theme_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_by_theme_unmarked(theme_id)
TO 'redactor';

-- add

GRANT EXECUTE ON PROCEDURE prosperity.add_conformity(conformity_discipline, conformity_speciality)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_discipline(discipline_code, discipline_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_discipline_code(discipline_code)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_general_competetion(comp_speciality, comp_no, comp_name, comp_knowledge, comp_skills)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_general_mastering(mastering_discipline, general_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_general_selection(selection_theme, mastering_selection)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_hour(discipline_id, work_type_id, hours_count)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_level(level_name, level_description)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_meta_data(data_discipline, data_type_id, data_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_meta_type(type_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_professional_competetion(comp_speciality, comp_no1, comp_no2, comp_name, comp_knowledge, comp_skills, comp_experience)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_professional_mastering(mastering_discipline, professional_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_professional_selection(selection_theme, mastering_selection)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_section(section_discipline, section_no, section_name, section_hours)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_source(discipline_id, type_id, source_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_source_type(type_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_speciality(speciality_code, speciality_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_speciality_code(speciality_code)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_task(task_work_id, task_name, task_hours)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_theme(theme_topic, theme_mastering_level, theme_no, theme_name, theme_hours)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_work(work_theme, work_type)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.add_work_type(type_name)
TO 'redactor';

-- edit

GRANT EXECUTE ON PROCEDURE prosperity.set_conformity(conformity_id, conformity_discipline, conformity_speciality)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_discipline(discipline_id, discipline_code, discipline_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_discipline_code(code_id, discipline_code)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_general_competetion(comp_id, comp_speciality, comp_no, comp_name, comp_knowledge, comp_skills)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_general_mastering(mastering_id, mastering_discipline, general_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_general_selection(selection_id, selection_theme, mastering_selection)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_hour(hour_id, discipline_id, work_type_id, hours_count)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_level(level_id, level_name, level_description)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_meta_data(data_id, data_discipline, data_type_id, data_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_meta_type(type_id, type_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_professional_competetion(comp_id, comp_speciality, comp_no1, comp_no2, comp_name, comp_knowledge, comp_skills, comp_experience)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_professional_mastering(mastering_id, mastering_discipline, professional_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_professional_selection(selection_id, selection_theme, mastering_selection)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_section(section_id, section_discipline, section_no, section_name, section_hours)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_source(source_id, discipline_id, type_id, source_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_source_type(type_id, type_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_speciality(speciality_id, speciality_code, speciality_name)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_speciality_code(code_id, speciality_code)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_task(task_id, task_work_id, task_name, task_hours)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_theme(theme_id, theme_topic, theme_mastering_level, theme_no, theme_name, theme_hours)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_work(work_id, work_theme, work_type)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.set_work_type(type_id, type_name)
TO 'redactor';

-- mark

GRANT EXECUTE ON PROCEDURE prosperity.mark_conformity(conformity_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_discipline(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_discipline_code(code_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_general_competetion(comp_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_general_mastering(mastering_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_general_selection(selection_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_hour(hour_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_level(level_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_meta_data(data_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_meta_type(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_professional_competetion(comp_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_professional_mastering(mastering_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_professional_selection(selection_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_section(section_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_source(source_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_source_type(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_speciality(speciality_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_speciality_code(code_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_task(task_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_theme(theme_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_work(work_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.mark_work_type(type_id)
TO 'redactor';

-- administrator

-- view
-- unmarked

GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_full_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_specialities_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_codes_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_general_unmarked(speciality_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_professional_unmarked(speciality_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_disciplines_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_codes_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_total_hours_unmarked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_plan_by_discipline_unmarked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_themes_by_section_unmarked(section_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_by_theme_unmarked(theme_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_types_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_task_by_work_unmarked(work_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_meta_data_unmarked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_types_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_sources_unmarked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_type_unmarked(type_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_mastering_unmarked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_mastering_unmarked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_general_mastering_selection_unmarked(theme_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_professional_mastering_selection_unmarked(theme_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_all_levels_unmarked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_general_competetions_unmarked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_professional_competetions_unmarked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_by_theme_unmarked(theme_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_by_theme_unmarked(theme_id)
TO 'administrator';

-- marked

GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_full_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_specialities_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_codes_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_general_marked(speciality_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_professional_marked(speciality_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_disciplines_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_codes_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_total_hours_marked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_plan_by_discipline_marked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_themes_by_section_marked(section_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_by_theme_marked(theme_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_work_types_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_task_by_work_marked(work_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_meta_data_marked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_types_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_sources_marked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_type_marked(type_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_mastering_marked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_mastering_marked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_general_mastering_selection_marked(theme_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_theme_professional_mastering_selection_marked(theme_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_all_levels_marked
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_general_competetions_marked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_conformity_professional_competetions_marked(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_general_by_theme_marked(theme_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_professional_by_theme_marked(theme_id)
TO 'administrator';

-- analyze

GRANT EXECUTE ON PROCEDURE prosperity.analyze_discipline(discipline_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.analyze_speciality(speciality_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.analyze_theme(theme_id)
TO 'administrator';
GRANT EXECUTE ON PROCEDURE prosperity.analyze_topic(topic_id)
TO 'administrator';

-- unmark

GRANT EXECUTE ON PROCEDURE prosperity.unmark_conformity(conformity_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_discipline(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_discipline_code(code_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_general_competetion(comp_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_general_mastering(mastering_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_general_selection(selection_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_hour(hour_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_level(level_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_meta_data(data_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_meta_type(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_professional_competetion(comp_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_professional_mastering(mastering_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_professional_selection(selection_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_section(section_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_source(source_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_source_type(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_speciality(speciality_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_speciality_code(code_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_task(task_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_theme(theme_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_work(work_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_work_type(type_id)
TO 'redactor';

-- drop

GRANT EXECUTE ON PROCEDURE prosperity.drop_conformity(conformity_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_discipline(discipline_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_discipline_code(code_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_general_competetion(comp_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_general_mastering(mastering_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_general_selection(selection_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_hour(hour_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_level(level_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_meta_data(data_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_meta_type(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_professional_competetion(comp_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_professional_mastering(mastering_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_professional_selection(selection_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_section(section_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_source(source_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_source_type(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_speciality(speciality_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_speciality_code(code_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_task(task_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_theme(theme_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_work(work_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_work_type(type_id)
TO 'redactor';

-- unmark all

GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_conformities
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_disciplines
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_discipline_codes
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_general_competetions
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_general_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_general_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_hours
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_levels
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_meta_data
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_meta_types
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_professional_competetions
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_professional_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_professional_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_sections
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_sources
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_source_types
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_specialities
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_speciality_codes
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_tasks
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_themes
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_works
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.unmark_all_work_types
TO 'redactor';

-- used record-types count

GRANT EXECUTE ON PROCEDURE prosperity.get_work_type_linked(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_level_linked(level_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_source_type_linked(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_meta_type_linked(type_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_discipline_code_linked(code_id)
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.get_speciality_code_linked(code_id)
TO 'redactor';

-- drop all

GRANT EXECUTE ON PROCEDURE prosperity.drop_all_conformities
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_disciplines
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_discipline_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_general_competetions
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_general_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_general_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_hours
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_levels
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_meta_data
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_meta_type
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_professional_competetions
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_professional_mastering
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_professional_selection
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_theme_plan
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_sources
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_source_types
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_specialities
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_speciality_code
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_tasks
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_themes
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_works
TO 'redactor';
GRANT EXECUTE ON PROCEDURE prosperity.drop_all_work_types
TO 'redactor';