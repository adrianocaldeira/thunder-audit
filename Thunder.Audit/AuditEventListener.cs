using NHibernate.Event;

namespace Thunder.Audit
{
    /// <summary>
    /// Audit event listener
    /// </summary>
    public class EventListener : 
        IPreUpdateEventListener,
        IPostInsertEventListener, 
        IPreDeleteEventListener
    {
        /// <summary>
        /// Return true if the operation should be vetoed
        /// </summary>
        /// <param name="event"/>
        public bool OnPreUpdate(PreUpdateEvent @event)
        {
            Audit.Save(@event);

            return false;
        }

        /// <summary>
        /// Return true if the operation should be vetoed
        /// </summary>
        /// <param name="event"/>
        public bool OnPreDelete(PreDeleteEvent @event)
        {
            Audit.Save(@event);

            return false;
        }

        /// <summary/>
        /// <param name="event"/>
        public void OnPostInsert(PostInsertEvent @event)
        {
            Audit.Save(@event);
        }
    }
}
