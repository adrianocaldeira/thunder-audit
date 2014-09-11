using System.Collections.Generic;
using System.Linq;
using NHibernate.Event;

namespace Thunder.Audit
{
    internal class AuditDifference
    {
        public string Property { get; set; }
        public string OldValue { get; set; }
        public string NewValue { get; set; }

        public static IList<AuditDifference> Retrieve(PreUpdateEvent @event)
        {
            if (!@event.Entity.GetType().GetInterfaces().Contains(typeof(IAuditable))) 
                return new List<AuditDifference>();

            var indexes = @event.Persister.FindDirty(@event.State, @event.OldState, @event.Entity, @event.Session);

            return (from index in indexes
                let oldValue = GetValue(@event.OldState, index)
                let newValue = GetValue(@event.State, index)
                where oldValue != newValue
                select new AuditDifference
                {
                    NewValue = newValue, 
                    OldValue = oldValue, 
                    Property = @event.Persister.PropertyNames[index]
                }).ToList();
        }

        private static string GetValue(IList<object> stateArray, int position)
        {
            var value = stateArray[position];

            return value == null || value.ToString() == string.Empty ? "" : value.ToString(); 
        }
    }
}