using System.Linq;
using NHibernate;
using NHibernate.Linq;
using Thunder.Data.Pattern;

namespace Thunder.Audit
{
    /// <summary>
    ///     Audit class property
    /// </summary>
    public class AuditClassProperty : Persist<AuditClassProperty, long>
    {
        /// <summary>
        /// Get or set class
        /// </summary>
        public virtual AuditClass Class { get; set; }

        /// <summary>
        ///     Get or set name
        /// </summary>
        public virtual string Name { get; set; }

        /// <summary>
        ///     Get or set description
        /// </summary>
        public virtual string Description { get; set; }

        /// <summary>
        /// Find <see cref="AuditClassProperty"/>
        /// </summary>
        /// <param name="session"><see cref="ISession"/></param>
        /// <param name="auditClass"><see cref="AuditClass"/></param>
        /// <param name="name">Property name</param>
        /// <returns><see cref="AuditClassProperty"/></returns>
        internal static AuditClassProperty Find(ISession session, AuditClass auditClass, string name)
        {
            var auditClassProperty = session.Query<AuditClassProperty>().FirstOrDefault(x => x.Class.Id == auditClass.Id
                && x.Name == name) ?? new AuditClassProperty
                {
                    Class = auditClass,
                    Name = name,
                    Description = name
                };

            session.SaveOrUpdate(auditClassProperty);

            return auditClassProperty;
        }
    }
}