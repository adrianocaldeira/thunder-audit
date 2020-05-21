using NHibernate.Event;
using System.Threading;
using System.Threading.Tasks;

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
        /// 
        /// </summary>
        /// <param name="event"></param>
        /// <param name="cancellationToken"></param>
        /// <returns></returns>
        public Task<bool> OnPreUpdateAsync(PreUpdateEvent @event, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="event"></param>
        /// <param name="cancellationToken"></param>
        /// <returns></returns>
        public Task<bool> OnPreDeleteAsync(PreDeleteEvent @event, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }

        /// <summary/>
        /// <param name="event"/>
        public void OnPostInsert(PostInsertEvent @event)
        {
            Audit.Save(@event);
        }

        public Task OnPostInsertAsync(PostInsertEvent @event, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }
    }
}
