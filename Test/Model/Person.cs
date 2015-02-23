using System.Collections.Generic;
using Thunder.Audit;
using Thunder.Data.Pattern;

namespace Test.Model
{
    public class Person : Persist<Person, int>, IAuditable
    {
        public Person()
        {
            Phones = new List<PersonPhone>();
            Cars = new List<Car>();
        }

        public virtual string Name { get; set; }
        public virtual IList<PersonPhone> Phones { get; set; }
        public virtual IList<Car> Cars { get; set; }
        public virtual string AuditDescription { get; set; }
        public virtual string AuditUser { get; set; }
        public virtual string AuditGroupReference { get; set; }
    }
}