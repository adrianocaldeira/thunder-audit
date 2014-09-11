using NHibernate;
using Thunder.Data.Pattern;

namespace Thunder.Audit
{
    /// <summary>
    ///     Audit class property change
    /// </summary>
    public class AuditClassPropertyChange : Persist<AuditClassPropertyChange, long>
    {
        /// <summary>
        /// Get or set <see cref="Audit"/>
        /// </summary>
        public virtual Audit Audit { get; set; }

        /// <summary>
        /// Get or set <see cref="AuditClassProperty"/>
        /// </summary>
        public virtual AuditClassProperty Property { get; set; }

        /// <summary>
        ///     Get or set old value
        /// </summary>
        public virtual string OldValue { get; set; }

        /// <summary>
        ///     Get or set new value
        /// </summary>
        public virtual string NewValue { get; set; }

        /// <summary>
        /// Save <see cref="AuditClassPropertyChange"/>
        /// </summary>
        /// <param name="session"><see cref="ISession"/></param>
        /// <param name="audit"><see cref="Audit"/></param>
        /// <param name="auditClassProperty"><see cref="AuditClassProperty"/></param>
        /// <param name="oldValue">Old value</param>
        /// <param name="newValue">New value</param>
        internal static void Save(ISession session, Audit audit, AuditClassProperty auditClassProperty, string oldValue, string newValue)
        {
            session.Save(new AuditClassPropertyChange
            {
                Audit = audit,
                Property = auditClassProperty,
                NewValue = newValue,
                OldValue = oldValue
            });
        }
    }
}