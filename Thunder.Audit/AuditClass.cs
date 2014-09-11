using System.Linq;
using NHibernate;
using NHibernate.Linq;
using Thunder.Data.Pattern;

namespace Thunder.Audit
{
    /// <summary>
    ///     Audit class
    /// </summary>
    public class AuditClass : Persist<AuditClass, int>
    {
        /// <summary>
        ///     Get or set name
        /// </summary>
        public virtual string Name { get; set; }
        
        /// <summary>
        ///     Get or set description
        /// </summary>
        public virtual string Description { get; set; }

        /// <summary>
        /// Find audit class
        /// </summary>
        /// <param name="session"><see cref="ISession"/></param>
        /// <param name="name">Class Name</param>
        /// <returns></returns>
        internal static AuditClass Find(ISession session, string name)
        {
            return session.Query<AuditClass>().FirstOrDefault(x => x.Name == name);
        }
    }
}