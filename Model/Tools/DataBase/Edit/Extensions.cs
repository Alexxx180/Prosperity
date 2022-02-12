using System;
using System.Collections.Generic;
using Serilog;

namespace Prosperity.Model.Tools.DataBase.Edit
{
    internal static class Extensions
    {
        private static void NoArgument(string argumentName)
        {
            ArgumentNullException exception = new ArgumentNullException(argumentName);
            string problem = "Unable to convert data into outer format. Argument is invalid. ";
            string cause = "This may be caused by schema changes in DB or with developer actions";
            Log.Error(problem + cause + ": " + exception.Message);
            Sql.ConnectionMessage("преобразование данных", exception.Message);
        }

        public static void AddRange<T>(this ICollection<T> target, IEnumerable<T> source)
        {
            if (target == null)
                NoArgument(nameof(target));
            if (source == null)
                NoArgument(nameof(source));
            foreach (T element in source)
                target.Add(element);
        }
    }
}