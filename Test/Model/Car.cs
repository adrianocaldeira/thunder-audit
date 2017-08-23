using Thunder.Data;

namespace Test.Model
{
    public class Car : Persist<Car, int>
    {
        public virtual string Model { get; set; }
    }
}