using System;
using System.Collections.Generic;
using Serilog;

namespace Prosperity.Model.DataBase
{
    /// <summary>
    /// Converters used for converting database objects to string fields
    /// </summary>
    public static class Converters
    {
        private static void NoArgument(string argumentName)
        {
            ArgumentNullException exception = new ArgumentNullException(argumentName);
            string problem = "Unable to convert data into inner format. Argument is invalid. ";
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

        public static TOutput[] ConvertAll<TInput, TOutput>(TInput[] array, Func<TInput, TOutput> converter)
        {
            TOutput[] result = new TOutput[array.Length];
            for (int i = 0; i < array.Length; i++)
                result[i] = converter(array[i]);
            return result;
        }

        public static List<TOutput> ConvertAll<TInput, TOutput>(List<TInput> list, Func<TInput, TOutput> converter)
        {
            List<TOutput> result = new List<TOutput>();
            for (int i = 0; i < list.Count; i++)
                result.Add(converter(list[i]));
            return result;
        }

        public static string ElementToString(object value) => value.ToString();
        public static string[] ElementsToString(object[] values) => ConvertAll(values, ElementToString);
    }
}