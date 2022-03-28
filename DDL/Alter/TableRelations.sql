-- All table relations

	ALTER TABLE Works
ADD FOREIGN KEY Works_Work_types (`Type`)
	  REFERENCES Work_types (`ID`);
	  
	 ALTER TABLE Tasks
ADD FOREIGN KEY Tasks_Works (`Work`)
	  REFERENCES Works (`ID`);

	 ALTER TABLE Works
ADD FOREIGN KEY Works_Themes (`Theme`)
	  REFERENCES Themes (`ID`);
	  
	 ALTER TABLE Themes
ADD FOREIGN KEY Themes_Levels (`Level`)
	  REFERENCES Levels (`ID`);
	  
	 ALTER TABLE Themes
ADD FOREIGN KEY Themes_Theme_plan (`Topic`)
	  REFERENCES Theme_plan (`ID`);
	  
	  
	 ALTER TABLE General_mastering
ADD FOREIGN KEY General_mastering_Disciplines (`Discipline`)
	  REFERENCES Disciplines (`ID`);
	  
	 ALTER TABLE General_mastering
ADD FOREIGN KEY General_mastering_General_competetions (`Mastering`)
	  REFERENCES General_competetions (`ID`);
	  
  	 ALTER TABLE General_selection
ADD FOREIGN KEY General_selection_General_mastering (`Mastering`)
	  REFERENCES General_mastering (`ID`);
	  
	 ALTER TABLE General_selection
ADD FOREIGN KEY General_selection_Themes (`Theme`)
	  REFERENCES Themes (`ID`);

	 ALTER TABLE Professional_mastering
ADD FOREIGN KEY Professional_mastering_Disciplines (`Discipline`)
	  REFERENCES Disciplines (`ID`);
	  
	 ALTER TABLE Professional_mastering
ADD FOREIGN KEY Competetions_mastering_Professional_competetions (`Mastering`)
	  REFERENCES Professional_competetions (`ID`);
	  
  	 ALTER TABLE Professional_selection
ADD FOREIGN KEY Professional_selection_Professional_mastering (`Mastering`)
	  REFERENCES Professional_mastering (`ID`);
	  
	 ALTER TABLE Professional_selection
ADD FOREIGN KEY Professional_selection_Themes (`Theme`)
	  REFERENCES Themes (`ID`);
	  
	  
	 ALTER TABLE General_competetions
ADD FOREIGN KEY General_competetions_Specialities (`Speciality`)
	  REFERENCES Specialities (`ID`);
	  
	 ALTER TABLE Professional_competetions
ADD FOREIGN KEY Professional_competetions_Specialities (`Speciality`)
	  REFERENCES Specialities (`ID`);
	  
  	 ALTER TABLE Specialities
ADD FOREIGN KEY Specialities_Speciality_codes (`Code`)
	  REFERENCES Speciality_codes (`ID`);
	  
  	 ALTER TABLE Conformity
ADD FOREIGN KEY Conformity_Specialities (`Speciality`)
	  REFERENCES Specialities (`ID`);
	  
	 ALTER TABLE Theme_plan
ADD FOREIGN KEY Theme_plan_Disciplines (`Discipline`)
	  REFERENCES Disciplines (`ID`);


	 ALTER TABLE Meta_data
ADD FOREIGN KEY Meta_data_Disciplines (`Discipline`)
	  REFERENCES Disciplines (`ID`);

  	 ALTER TABLE Meta_data
ADD FOREIGN KEY Meta_data_Meta_types (`Type`)
	  REFERENCES Meta_types (`ID`);
	  
  	 ALTER TABLE Sources
ADD FOREIGN KEY Sources_Disciplines (`Discipline`)
	  REFERENCES Disciplines (`ID`);
	  
  	 ALTER TABLE Sources
ADD FOREIGN KEY Sources_Source_types (`Type`)
	  REFERENCES Source_types (`ID`);
	  
  	 ALTER TABLE Disciplines
ADD FOREIGN KEY Disciplines_Discipline_codes (`Code`)
	  REFERENCES Discipline_codes (`ID`);
	  
  	 ALTER TABLE Hours
ADD FOREIGN KEY Hours_Disciplines (`Discipline`)
	  REFERENCES Disciplines (`ID`);
	  
  	 ALTER TABLE Hours
ADD FOREIGN KEY Hours_Work_types (`WorkType`)
	  REFERENCES Work_types (`ID`);

	  
  	 ALTER TABLE Conformity
ADD FOREIGN KEY Conformity_Discipline (`Discipline`)
	  REFERENCES Disciplines (`ID`);
