-- drop procedure generator list

SELECT
    CONCAT('DROP ',ROUTINE_TYPE,' `',ROUTINE_SCHEMA,'`.`',ROUTINE_NAME,'`;
') as stmt
FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA LIKE 'prosperity';


-- below drop code

DROP PROCEDURE `prosperity`.`seek_for_column_type`;

DROP PROCEDURE `prosperity`.`get_meta_data`;

DROP PROCEDURE `prosperity`.`drop_meta_data`;

DROP PROCEDURE `prosperity`.`drop_all_meta_data`;

DROP PROCEDURE `prosperity`.`add_level`;

DROP PROCEDURE `prosperity`.`get_level`;

DROP PROCEDURE `prosperity`.`set_level`;

DROP PROCEDURE `prosperity`.`drop_level`;

DROP PROCEDURE `prosperity`.`drop_all_levels`;

DROP PROCEDURE `prosperity`.`get_hour`;

DROP PROCEDURE `prosperity`.`set_hour`;

DROP PROCEDURE `prosperity`.`drop_hour`;

DROP PROCEDURE `prosperity`.`drop_all_hours`;

DROP PROCEDURE `prosperity`.`get_discipline_code`;

DROP PROCEDURE `prosperity`.`drop_discipline_code`;

DROP PROCEDURE `prosperity`.`drop_all_discipline_code`;

DROP PROCEDURE `prosperity`.`add_speciality_code`;

DROP PROCEDURE `prosperity`.`get_speciality_code`;

DROP PROCEDURE `prosperity`.`set_speciality_code`;

DROP PROCEDURE `prosperity`.`drop_speciality_code`;

DROP PROCEDURE `prosperity`.`drop_all_speciality_code`;

DROP PROCEDURE `prosperity`.`add_work_type_ignore_increment`;

DROP PROCEDURE `prosperity`.`add_work_type`;

DROP PROCEDURE `prosperity`.`get_work_type`;

DROP PROCEDURE `prosperity`.`set_work_type`;

DROP PROCEDURE `prosperity`.`drop_work_type`;

DROP PROCEDURE `prosperity`.`drop_all_work_types`;

DROP PROCEDURE `prosperity`.`get_source_type`;

DROP PROCEDURE `prosperity`.`drop_source_type`;

DROP PROCEDURE `prosperity`.`drop_all_source_types`;

DROP PROCEDURE `prosperity`.`get_meta_type`;

DROP PROCEDURE `prosperity`.`set_meta_type`;

DROP PROCEDURE `prosperity`.`drop_meta_type`;

DROP PROCEDURE `prosperity`.`drop_all_meta_type`;

DROP PROCEDURE `prosperity`.`get_source`;

DROP PROCEDURE `prosperity`.`drop_source`;

DROP PROCEDURE `prosperity`.`drop_all_sources`;

DROP PROCEDURE `prosperity`.`add_conformity`;

DROP PROCEDURE `prosperity`.`get_conformity`;

DROP PROCEDURE `prosperity`.`set_conformity`;

DROP PROCEDURE `prosperity`.`drop_conformity`;

DROP PROCEDURE `prosperity`.`drop_all_conformities`;

DROP PROCEDURE `prosperity`.`add_speciality`;

DROP PROCEDURE `prosperity`.`get_speciality`;

DROP PROCEDURE `prosperity`.`set_speciality`;

DROP PROCEDURE `prosperity`.`drop_speciality`;

DROP PROCEDURE `prosperity`.`drop_all_specialities`;

DROP PROCEDURE `prosperity`.`add_general_competetion`;

DROP PROCEDURE `prosperity`.`get_general_competetion`;

DROP PROCEDURE `prosperity`.`set_general_competetion`;

DROP PROCEDURE `prosperity`.`drop_general_competetion`;

DROP PROCEDURE `prosperity`.`drop_all_general_competetions`;

DROP PROCEDURE `prosperity`.`add_professional_competetion`;

DROP PROCEDURE `prosperity`.`get_professional_competetion`;

DROP PROCEDURE `prosperity`.`set_professional_competetion`;

DROP PROCEDURE `prosperity`.`drop_professional_competetion`;

DROP PROCEDURE `prosperity`.`drop_all_professional_competetions`;

DROP PROCEDURE `prosperity`.`add_general_mastering`;

DROP PROCEDURE `prosperity`.`get_general_mastering`;

DROP PROCEDURE `prosperity`.`set_general_mastering`;

DROP PROCEDURE `prosperity`.`drop_general_mastering`;

DROP PROCEDURE `prosperity`.`drop_all_general_mastering`;

DROP PROCEDURE `prosperity`.`add_professional_mastering`;

DROP PROCEDURE `prosperity`.`get_professional_mastering`;

DROP PROCEDURE `prosperity`.`set_professional_mastering`;

DROP PROCEDURE `prosperity`.`drop_professional_mastering`;

DROP PROCEDURE `prosperity`.`drop_all_professional_mastering`;

DROP PROCEDURE `prosperity`.`add_general_selection`;

DROP PROCEDURE `prosperity`.`get_general_selection`;

DROP PROCEDURE `prosperity`.`set_general_selection`;

DROP PROCEDURE `prosperity`.`drop_general_selection`;

DROP PROCEDURE `prosperity`.`drop_all_general_selection`;

DROP PROCEDURE `prosperity`.`add_professional_selection`;

DROP PROCEDURE `prosperity`.`get_professional_selection`;

DROP PROCEDURE `prosperity`.`set_professional_selection`;

DROP PROCEDURE `prosperity`.`drop_professional_selection`;

DROP PROCEDURE `prosperity`.`drop_all_professional_selection`;

DROP PROCEDURE `prosperity`.`add_discipline`;

DROP PROCEDURE `prosperity`.`get_discipline`;

DROP PROCEDURE `prosperity`.`set_discipline`;

DROP PROCEDURE `prosperity`.`drop_discipline`;

DROP PROCEDURE `prosperity`.`drop_all_disciplines`;

DROP PROCEDURE `prosperity`.`add_section`;

DROP PROCEDURE `prosperity`.`get_section`;

DROP PROCEDURE `prosperity`.`set_section`;

DROP PROCEDURE `prosperity`.`drop_section`;

DROP PROCEDURE `prosperity`.`drop_all_theme_plan`;

DROP PROCEDURE `prosperity`.`add_theme`;

DROP PROCEDURE `prosperity`.`get_theme`;

DROP PROCEDURE `prosperity`.`set_theme`;

DROP PROCEDURE `prosperity`.`drop_theme`;

DROP PROCEDURE `prosperity`.`drop_all_themes`;

DROP PROCEDURE `prosperity`.`add_work`;

DROP PROCEDURE `prosperity`.`get_work`;

DROP PROCEDURE `prosperity`.`set_work`;

DROP PROCEDURE `prosperity`.`drop_work`;

DROP PROCEDURE `prosperity`.`drop_all_works`;

DROP PROCEDURE `prosperity`.`add_task`;

DROP PROCEDURE `prosperity`.`get_task`;

DROP PROCEDURE `prosperity`.`set_task`;

DROP PROCEDURE `prosperity`.`drop_task`;

DROP PROCEDURE `prosperity`.`drop_all_tasks`;

DROP FUNCTION `prosperity`.`get_work_by_task_id`;

DROP FUNCTION `prosperity`.`get_theme_by_task_id`;

DROP FUNCTION `prosperity`.`get_topic_by_theme_id`;

DROP FUNCTION `prosperity`.`get_discipline_by_task_id`;

DROP FUNCTION `prosperity`.`get_work_type_by_work_id`;

DROP FUNCTION `prosperity`.`get_work_type_by_task_id`;

DROP FUNCTION `prosperity`.`get_work_hours`;

DROP PROCEDURE `prosperity`.`add_meta_type`;

DROP PROCEDURE `prosperity`.`add_source_type`;

DROP PROCEDURE `prosperity`.`set_source_type`;

DROP PROCEDURE `prosperity`.`set_discipline_code`;

DROP PROCEDURE `prosperity`.`add_discipline_code`;

DROP PROCEDURE `prosperity`.`get_log`;

DROP PROCEDURE `prosperity`.`set_meta_data`;

DROP PROCEDURE `prosperity`.`add_meta_data`;

DROP PROCEDURE `prosperity`.`add_source`;

DROP PROCEDURE `prosperity`.`set_source`;

DROP FUNCTION `prosperity`.`get_topic_hours`;

DROP FUNCTION `prosperity`.`get_discipline_hours_by_work_type`;

DROP FUNCTION `prosperity`.`get_theme_hours`;

DROP PROCEDURE `prosperity`.`add_hour`;

DROP PROCEDURE `prosperity`.`mark_level`;

DROP PROCEDURE `prosperity`.`unmark_level`;

DROP PROCEDURE `prosperity`.`unmark_all_levels`;

DROP PROCEDURE `prosperity`.`drop_all_marked_levels`;

DROP PROCEDURE `prosperity`.`mark_hour`;

DROP PROCEDURE `prosperity`.`unmark_hour`;

DROP PROCEDURE `prosperity`.`unmark_all_hours`;

DROP PROCEDURE `prosperity`.`drop_all_marked_hours`;

DROP PROCEDURE `prosperity`.`mark_discipline_code`;

DROP PROCEDURE `prosperity`.`unmark_discipline_code`;

DROP PROCEDURE `prosperity`.`unmark_all_discipline_codes`;

DROP PROCEDURE `prosperity`.`drop_all_marked_discipline_codes`;

DROP PROCEDURE `prosperity`.`mark_speciality_code`;

DROP PROCEDURE `prosperity`.`unmark_speciality_code`;

DROP PROCEDURE `prosperity`.`unmark_all_speciality_codes`;

DROP PROCEDURE `prosperity`.`drop_all_marked_speciality_codes`;

DROP PROCEDURE `prosperity`.`mark_work_type`;

DROP PROCEDURE `prosperity`.`unmark_work_type`;

DROP PROCEDURE `prosperity`.`unmark_all_work_types`;

DROP PROCEDURE `prosperity`.`drop_all_marked_work_types`;

DROP PROCEDURE `prosperity`.`mark_source_type`;

DROP PROCEDURE `prosperity`.`unmark_source_type`;

DROP PROCEDURE `prosperity`.`unmark_all_source_types`;

DROP PROCEDURE `prosperity`.`drop_all_marked_source_types`;

DROP PROCEDURE `prosperity`.`mark_meta_type`;

DROP PROCEDURE `prosperity`.`unmark_meta_type`;

DROP PROCEDURE `prosperity`.`unmark_all_meta_types`;

DROP PROCEDURE `prosperity`.`drop_all_marked_meta_types`;

DROP PROCEDURE `prosperity`.`mark_source`;

DROP PROCEDURE `prosperity`.`unmark_source`;

DROP PROCEDURE `prosperity`.`unmark_all_sources`;

DROP PROCEDURE `prosperity`.`drop_all_marked_sources`;

DROP PROCEDURE `prosperity`.`mark_conformity`;

DROP PROCEDURE `prosperity`.`unmark_conformity`;

DROP PROCEDURE `prosperity`.`unmark_all_conformities`;

DROP PROCEDURE `prosperity`.`drop_all_marked_conformities`;

DROP PROCEDURE `prosperity`.`mark_speciality`;

DROP PROCEDURE `prosperity`.`unmark_speciality`;

DROP PROCEDURE `prosperity`.`unmark_all_specialities`;

DROP PROCEDURE `prosperity`.`drop_all_marked_specialities`;

DROP PROCEDURE `prosperity`.`mark_general_competetion`;

DROP PROCEDURE `prosperity`.`unmark_general_competetion`;

DROP PROCEDURE `prosperity`.`unmark_all_general_competetions`;

DROP PROCEDURE `prosperity`.`drop_all_marked_general_competetions`;

DROP PROCEDURE `prosperity`.`mark_professional_competetion`;

DROP PROCEDURE `prosperity`.`unmark_professional_competetion`;

DROP PROCEDURE `prosperity`.`unmark_all_professional_competetions`;

DROP PROCEDURE `prosperity`.`drop_all_marked_professional_competetions`;

DROP PROCEDURE `prosperity`.`mark_general_mastering`;

DROP PROCEDURE `prosperity`.`unmark_general_mastering`;

DROP PROCEDURE `prosperity`.`unmark_all_general_mastering`;

DROP PROCEDURE `prosperity`.`drop_all_marked_general_mastering`;

DROP PROCEDURE `prosperity`.`mark_professional_mastering`;

DROP PROCEDURE `prosperity`.`unmark_professional_mastering`;

DROP PROCEDURE `prosperity`.`unmark_all_professional_mastering`;

DROP PROCEDURE `prosperity`.`drop_all_marked_professional_mastering`;

DROP PROCEDURE `prosperity`.`mark_general_selection`;

DROP PROCEDURE `prosperity`.`unmark_general_selection`;

DROP PROCEDURE `prosperity`.`unmark_all_general_selection`;

DROP PROCEDURE `prosperity`.`drop_all_marked_general_selection`;

DROP PROCEDURE `prosperity`.`mark_professional_selection`;

DROP PROCEDURE `prosperity`.`unmark_professional_selection`;

DROP PROCEDURE `prosperity`.`unmark_all_professional_selection`;

DROP PROCEDURE `prosperity`.`drop_all_marked_professional_selection`;

DROP PROCEDURE `prosperity`.`mark_discipline`;

DROP PROCEDURE `prosperity`.`unmark_discipline`;

DROP PROCEDURE `prosperity`.`unmark_all_disciplines`;

DROP PROCEDURE `prosperity`.`drop_all_marked_disciplines`;

DROP PROCEDURE `prosperity`.`mark_section`;

DROP PROCEDURE `prosperity`.`unmark_section`;

DROP PROCEDURE `prosperity`.`unmark_all_sections`;

DROP PROCEDURE `prosperity`.`drop_all_marked_sections`;

DROP PROCEDURE `prosperity`.`mark_theme`;

DROP PROCEDURE `prosperity`.`unmark_theme`;

DROP PROCEDURE `prosperity`.`unmark_all_themes`;

DROP PROCEDURE `prosperity`.`drop_all_marked_themes`;

DROP PROCEDURE `prosperity`.`mark_work`;

DROP PROCEDURE `prosperity`.`unmark_work`;

DROP PROCEDURE `prosperity`.`unmark_all_works`;

DROP PROCEDURE `prosperity`.`drop_all_marked_works`;

DROP PROCEDURE `prosperity`.`mark_task`;

DROP PROCEDURE `prosperity`.`unmark_task`;

DROP PROCEDURE `prosperity`.`unmark_all_tasks`;

DROP PROCEDURE `prosperity`.`drop_all_marked_tasks`;

DROP PROCEDURE `prosperity`.`mark_meta_data`;

DROP PROCEDURE `prosperity`.`unmark_meta_data`;

DROP PROCEDURE `prosperity`.`unmark_all_meta_data`;

DROP PROCEDURE `prosperity`.`drop_all_marked_meta_data`;

