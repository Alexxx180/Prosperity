-- Drop all table relations

	 ALTER TABLE Works
DROP FOREIGN KEY Works_Types;

	  
	 ALTER TABLE Tasks
DROP FOREIGN KEY Tasks_Works;


	 ALTER TABLE Works
DROP FOREIGN KEY Works_Themes; 

	  
	 ALTER TABLE Themes
DROP FOREIGN KEY Themes_Levels; 

	  
	 ALTER TABLE Themes
DROP FOREIGN KEY Themes_Theme_Plan; 

	  
	  
	 ALTER TABLE General_Mastering
DROP FOREIGN KEY General_Mastering_Disciplines; 

	  
	 ALTER TABLE General_Mastering
DROP FOREIGN KEY General_Mastering_General_Competetions; 

	  
  	 ALTER TABLE General_Selection
DROP FOREIGN KEY General_Selection_General_Mastering; 

	  
	 ALTER TABLE General_Selection
DROP FOREIGN KEY General_Selection_Themes; 


	 ALTER TABLE Professional_Mastering
DROP FOREIGN KEY Professional_Mastering_Disciplines; 

	  
	 ALTER TABLE Professional_Mastering
DROP FOREIGN KEY Competetions_Mastering_Professional_Competetions; 

	  
  	 ALTER TABLE Professional_Selection
DROP FOREIGN KEY Professional_Selection_Professional_Mastering; 

	  
	 ALTER TABLE Professional_Selection
DROP FOREIGN KEY Professional_Selection_Themes; 

	  
	  
	 ALTER TABLE General_Competetions
DROP FOREIGN KEY General_Competetions_Specialities; 

	  
	 ALTER TABLE Professional_Competetions
DROP FOREIGN KEY Professional_Competetions_Specialities; 

	  
  	 ALTER TABLE Specialities
DROP FOREIGN KEY Specialities_Speciality_Codes; 

	  
  	 ALTER TABLE Conformity
DROP FOREIGN KEY Conformity_Specialities; 

	  
	 ALTER TABLE Theme_Plan
DROP FOREIGN KEY Theme_Plan_Disciplines; 



	 ALTER TABLE Meta_data
DROP FOREIGN KEY Meta_data_Disciplines; 


  	 ALTER TABLE Meta_data
DROP FOREIGN KEY Meta_data_Meta_Types; 

	  
  	 ALTER TABLE Sources
DROP FOREIGN KEY Sources_Disciplines; 

	  
  	 ALTER TABLE Sources
DROP FOREIGN KEY Sources_Source_Types; 

	  
  	 ALTER TABLE Disciplines
DROP FOREIGN KEY Disciplines_Discipline_Codes; 

	  
  	 ALTER TABLE Hours
DROP FOREIGN KEY Hours_Disciplines; 

	  
  	 ALTER TABLE Hours
DROP FOREIGN KEY Hours_Work_Types; 


	  
  	 ALTER TABLE Conformity
DROP FOREIGN KEY Conformity_Discipline; 
