using System.Collections.Generic;
using System.Text.RegularExpressions;
using ControlMaterials;
using ControlMaterials.Documents;
using ControlMaterials.Tables;
using Prosperity.Controls.Tables;
using ControlMaterials.Tables.ThemePlan;
using static Prosperity.Writers.Import.Importer;

namespace Prosperity.Writers.Import
{
    internal static class DisciplineProgramSender
    {
        private static Task SplitCodeName(string value)
        {
            int splitIndex = value.IndexOf(" ");

            string code = value.Substring(0, splitIndex);
            string name = value.Substring(splitIndex);

            Task fullName = new Task(code, name);
            return fullName;
        }

        internal static void SendProgram(DisciplineProgram program, LayoutMaster layout)
        {
            if (program is null)
                return;

            if (NA(program.ProfessionName) ||
                NA(program.Name))
                return;

            // layout.Tools.Do.PrepareImport()

            uint disciplineId, specialityId;
            ulong temporaryId;

            Task discipline = SplitCodeName(program.Name);
            Task speciality = SplitCodeName(program.ProfessionName);

            layout.Tools.AddRow.SpecialityCode(speciality.Name);
            temporaryId = layout.Tools.Do.GetLastImportId();

            specialityId = layout.ImportSpeciality
                (temporaryId.ToUInt(), speciality.Hours);

            Dictionary<string, uint>
                generalCompetetions = layout.ImportGeneralCompetetions
                (specialityId, program.GeneralCompetetions);

            Dictionary<string, uint>
                professionalCompetetions = layout.ImportProfessionalCompetetions
                (specialityId, program.ProfessionalCompetetions);


            layout.Tools.AddRow.DisciplineCode(discipline.Name);
            temporaryId = layout.Tools.Do.GetLastImportId();

            layout.Tools.AddRow.Discipline(temporaryId.ToUInt(), discipline.Hours);
            disciplineId = layout.Tools.Do.GetLastImportId().ToUInt();

            layout.Tools.AddRow.Conformity(disciplineId, specialityId);
        }
        
    }
}