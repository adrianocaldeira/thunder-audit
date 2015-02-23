using Thunder.Audit;
using Thunder.Data.Pattern;

namespace Test.Model
{
    public class PersonPhone : Persist<PersonPhone, int>, IAuditable
    {
        public virtual string Number { get; set; }
        public virtual string AuditDescription { get; set; }
        public virtual string AuditUser { get; set; }
        public virtual string AuditGroupReference { get; set; }
    }
}