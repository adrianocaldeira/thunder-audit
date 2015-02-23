using NHibernate.Event;

namespace Thunder.Audit
{
    /// <summary>
    /// Audit event listener
    /// </summary>
    public class EventListener : 
        IPreUpdateEventListener,
        IPostInsertEventListener, 
        IPreDeleteEventListener,
        IPostCollectionRecreateEventListener,
        IPostCollectionUpdateEventListener
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

        public void OnPostRecreateCollection(PostCollectionRecreateEvent @event)
        {
            var a = @event;
        }

        public void OnPostUpdateCollection(PostCollectionUpdateEvent @event)
        {
            var a = @event;
        }
    }
}
