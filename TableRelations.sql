-- Проверено: работает без ошибок, запустилось с первого раза

	 ALTER TABLE Works
ADD FOREIGN KEY Works_Types (`Type`)
	  REFERENCES Work_Types (ID);
	  
	 ALTER TABLE Tasks
ADD FOREIGN KEY Tasks_Works (`Work`)
	  REFERENCES Works (ID);

	 ALTER TABLE Works
ADD FOREIGN KEY Works_Themes (`Theme`)
	  REFERENCES Themes (ID);
	  
	 ALTER TABLE Themes
ADD FOREIGN KEY Themes_Levels (`Level`)
	  REFERENCES Levels (ID);
	  
	 ALTER TABLE Themes
ADD FOREIGN KEY Themes_Theme_Plan (`Topic`)
	  REFERENCES Theme_Plan (ID);
	  
	  
	 ALTER TABLE General_Mastering
ADD FOREIGN KEY General_Mastering_Disciplines (`Discipline`)
	  REFERENCES Disciplines (ID);
	  
	 ALTER TABLE General_Mastering
ADD FOREIGN KEY General_Mastering_General_Competetions (`Mastering`)
	  REFERENCES General_Competetions (ID);
	  
  	 ALTER TABLE General_Selection
ADD FOREIGN KEY General_Selection_General_Mastering (`Mastering`)
	  REFERENCES General_Mastering (ID);
	  
	 ALTER TABLE General_Selection
ADD FOREIGN KEY General_Selection_Themes (`Theme`)
	  REFERENCES Themes (ID);

	 ALTER TABLE Professional_Mastering
ADD FOREIGN KEY Professional_Mastering_Disciplines (`Discipline`)
	  REFERENCES Disciplines (ID);
	  
	 ALTER TABLE Professional_Mastering
ADD FOREIGN KEY Competetions_Mastering_Professional_Competetions (`Mastering`)
	  REFERENCES Professional_Competetions (ID);
	  
  	 ALTER TABLE Professional_Selection
ADD FOREIGN KEY Professional_Selection_Professional_Mastering (`Mastering`)
	  REFERENCES Professional_Mastering (ID);
	  
	 ALTER TABLE Professional_Selection
ADD FOREIGN KEY Professional_Selection_Themes (`Theme`)
	  REFERENCES Themes (ID);
	  
	  
	 ALTER TABLE General_Competetions
ADD FOREIGN KEY General_Competetions_Specialities (`Speciality`)
	  REFERENCES Specialities (ID);
	  
	 ALTER TABLE Professional_Competetions
ADD FOREIGN KEY Professional_Competetions_Specialities (`Speciality`)
	  REFERENCES Specialities (ID);
	  
  	 ALTER TABLE Specialities
ADD FOREIGN KEY Specialities_Speciality_Codes (`Code`)
	  REFERENCES Speciality_Codes (ID);
	  
  	 ALTER TABLE Conformity
ADD FOREIGN KEY Conformity_Specialities (`Speciality`)
	  REFERENCES Specialities (ID);
	  
	 ALTER TABLE Theme_Plan
ADD FOREIGN KEY Theme_Plan_Disciplines (`Discipline`)
	  REFERENCES Disciplines (ID);
	  
  	 ALTER TABLE Sources
ADD FOREIGN KEY Sources_Disciplines (`Discipline`)
	  REFERENCES Disciplines (ID);
	  
  	 ALTER TABLE Sources
ADD FOREIGN KEY Sources_Source_Types (`Type`)
	  REFERENCES Source_Types (ID);
	  
  	 ALTER TABLE Disciplines
ADD FOREIGN KEY Disciplines_Discipline_Codes (`Code`)
	  REFERENCES Discipline_Codes (ID);
	  
  	 ALTER TABLE Hours
ADD FOREIGN KEY Hours_Disciplines (`Discipline`)
	  REFERENCES Disciplines (ID);
	  
  	 ALTER TABLE Hours
ADD FOREIGN KEY Hours_Work_Types (`WorkType`)
	  REFERENCES Work_types (ID);
	  
  	 ALTER TABLE Conformity
ADD FOREIGN KEY Conformity_Discipline (`Discipline`)
	  REFERENCES Disciplines (ID);