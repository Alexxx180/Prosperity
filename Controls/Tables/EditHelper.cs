using System;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;

namespace Prosperity.Controls.Tables
{
    public static class EditHelper
    {
        //public static void AddElement<T>(StackPanel stack, int no = 1)
        //{
        //    UIElement component = (UIElement)Activator.CreateInstance(typeof(T), no);
        //    _ = stack.Children.Add(component);
        //}

        //public static void AddElement<T>(StackPanel stack, params object[] args)
        //{
        //    UIElement component = (UIElement)Activator.CreateInstance(typeof(T), args);
        //    _ = stack.Children.Add(component);
        //}

        private static string GetProposedText(TextBox textBox, string newText)
        {
            var text = textBox.Text;
            if (textBox.SelectionStart != -1)
                text = text.Remove(textBox.SelectionStart, textBox.SelectionLength);
            text = text.Insert(textBox.CaretIndex, newText);
            return text;
        }

        private static readonly Regex _hours = new Regex("^([1-9]|[1-9]\\d\\d?)$");
        public static void CheckForHours(object sender, TextCompositionEventArgs e)
        {
            TextBox box = e.OriginalSource as TextBox;
            string full = box.Text.Insert(box.CaretIndex, e.Text);
            e.Handled = !_hours.IsMatch(full);
        }
        public static void CheckForPastingHours(object sender, DataObjectPastingEventArgs e)
        {
            TextBox textBox = sender as TextBox;

            if (e.DataObject.GetDataPresent(typeof(string)))
            {
                string pastedText = e.DataObject.GetData(typeof(string)) as string;
                string proposedText = GetProposedText(textBox, pastedText);

                if (!_hours.IsMatch(proposedText))
                {
                    e.CancelCommand();
                }
            }
            else
            {
                e.CancelCommand();
            }
        }
    }
}