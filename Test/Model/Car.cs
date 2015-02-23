using Thunder.Data.Pattern;

namespace Test.Model
{
    public class Car : Persist<Car, int>
    {
        public virtual string Model { get; set; }
    }
}