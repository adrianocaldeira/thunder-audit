using NHibernate.Event;

namespace Thunder.Audit
{
    public class EventListener : IPreUpdateEventListener, IPostInsertEventListener, IPreDeleteEventListener
    {
        public bool OnPreUpdate(PreUpdateEvent @event)
        {
            Audit.Save(@event);

            return false;
        }

        public bool OnPreDelete(PreDeleteEvent @event)
        {
            Audit.Save(@event);

            return false;
        }

        public void OnPostInsert(PostInsertEvent @event)
        {
            Audit.Save(@event);
        }
    }
}
