using System;
using System.Globalization;
using System.Windows.Data;

namespace Prosperity.Controls.Binds.Converters
{
    public class ProcentualHeightConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (parameter is string p)
            {
                if (value is double v)
                {
                    bool result = double.TryParse(p, out double param);
                    if (result)
                    {
                        return v / param;
                    }
                }
            }
            return value;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
