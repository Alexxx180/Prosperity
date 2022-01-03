namespace Prosperity.Model
{
    public class Pair<TName, TValue>
    {
        public Pair()
        {
            Name = default;
            Value = default;
        }

        public Pair(TName name, TValue value) {
            Name = name;
            Value = value;
        }

        public TName Name { get; set; }
        public TValue Value { get; set; }
    }
}