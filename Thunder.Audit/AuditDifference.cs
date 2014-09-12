using System;
using System.Collections.Generic;
using System.Linq;
using NHibernate.Event;
using NHibernate.Type;

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
            var list = new List<AuditDifference>();

            foreach (var index in indexes)
            {
                if (@event.Persister.PropertyTypes[index] is ComponentType)
                {
                    var oldObject = @event.OldState[index];
                    var newObject = @event.State[index];

                    foreach (var property in newObject.GetType().GetProperties())
                    {
                        if (!property.CanRead) continue;

                        var newValue = property.GetValue(newObject, null) == null ? "" : property.GetValue(newObject, null).ToString();
                        var oldValue = oldObject == null || property.GetValue(oldObject, null) == null ? "" : property.GetValue(oldObject, null).ToString();

                        if (oldValue == newValue) continue;

                        list.Add(new AuditDifference
                        {
                            NewValue = newValue,
                            OldValue = oldValue,
                            Property = @event.Persister.PropertyNames[index] + "." + property.Name
                        });
                    }
                }
                else
                {
                    var oldValue = GetValue(@event.OldState, index);
                    var newValue = GetValue(@event.State, index);

                    if (oldValue != newValue)
                    {
                        list.Add(new AuditDifference
                        {
                            NewValue = newValue,
                            OldValue = oldValue,
                            Property = @event.Persister.PropertyNames[index]
                        });
                    }
                }

            }
            return list;
        }

        private static string GetValue(IList<object> stateArray, int position)
        {
            var value = stateArray[position];

            return value == null || value.ToString() == string.Empty ? "" : value.ToString(); 
        }
    }
}