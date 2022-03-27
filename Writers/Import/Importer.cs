using System.Collections.Generic;
using System.Text.RegularExpressions;
using ControlMaterials.Tables;
using Prosperity.Controls.Tables;
using static System.Convert;

namespace Prosperity.Writers.Import
{
    internal static class Importer
    {
        private static ushort ToUShort(this object value)
        {
            return ToUInt16(value);
        }

        internal static uint ToUInt(this object value)
        {
            return ToUInt32(value);
        }

        internal static bool NA(string name)
        {
            return (name ?? "").Length == 0;
        }

        #region SpecialityImport Members
        internal static uint ImportSpeciality(this LayoutMaster master,
            uint specialityСodeId, string specialityName)
        {
            master.Tools.AddRow.Speciality(specialityСodeId.ToUInt(), specialityName);
            return master.Tools.Do.GetLastImportId().ToUInt();
        }

        internal static Dictionary<string, uint>
            ImportGeneralCompetetions(this LayoutMaster master,
            uint specialityId, List<Competetion> generalGroup)
        {
            Dictionary<string, uint>
                generalCompetetions = new
                Dictionary<string, uint>();

            for (ushort i = 0; i < generalGroup.Count; i++)
            {
                Competetion general = generalGroup[i];

                ushort generalNo = Regex.Match(general.PrefixNo, @"\d+").Value.ToUShort();
                master.Tools.AddRow.GeneralCompetetion(
                    specialityId.ToUInt(), generalNo, general.Name,
                    general.Abilities[1].Hours, general.Abilities[0].Hours);

                uint id = master.Tools.Do.GetLastImportId().ToUInt();

                generalCompetetions.Add(general.PrefixNo, id);
            }

            return generalCompetetions;
        }

        internal static Dictionary<string, uint>
            ImportProfessionalCompetetions
            (this LayoutMaster master, uint specialityId,
            List<List<Competetion>> professionalGroups)
        {
            Dictionary<string, uint>
                professionalCompetetions = new
                Dictionary<string, uint>();

            for (ushort i = 0; i < professionalGroups.Count; i++)
            {
                List<Competetion> group = professionalGroups[i];

                for (ushort ii = 0; ii < group.Count; ii++)
                {
                    Competetion professional = group[i];

                    string prefix = professional.PrefixNo;

                    int beginning = prefix.IndexOf(" ");
                    int divider = prefix.IndexOf('.');

                    ushort no1 = prefix.Substring(divider).ToUShort();
                    ushort no2 = prefix.Substring(beginning, divider).ToUShort();

                    master.Tools.AddRow.ProfessionalCompetetion
                        (specialityId.ToUInt(),
                        no1, no2, professional.Name,
                        professional.Abilities[2].Hours,
                        professional.Abilities[1].Hours,
                        professional.Abilities[0].Hours);

                    uint id = master.Tools.Do.GetLastImportId().ToUInt();

                    professionalCompetetions.Add(professional.PrefixNo, id);
                }
            }

            return professionalCompetetions;
        }
        #endregion

        #region DisciplineImport Members
        internal static uint ImportDiscipline(this LayoutMaster master,
            uint disciplineСodeId, string disciplineName)
        {
            master.Tools.AddRow.Speciality(disciplineСodeId.ToUInt(), disciplineName);
            return master.Tools.Do.GetLastImportId().ToUInt();
        }

        // Code men, code...
        #endregion
    }
}
