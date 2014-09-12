using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using NHibernate;
using NHibernate.Event;
using Thunder.Data.Pattern;

namespace Thunder.Audit
{
    /// <summary>
    ///     Audit
    /// </summary>
    public class Audit : Persist<Audit, long>
    {
        /// <summary>
        ///     Get or set <see cref="AuditType" />
        /// </summary>
        public virtual AuditType Type { get; set; }

        /// <summary>
        ///     Get or set <see cref="AuditClass" />
        /// </summary>
        public virtual AuditClass Class { get; set; }

        /// <summary>
        /// Get or set reference
        /// </summary>
        public virtual string Reference { get; set; }

        /// <summary>
        /// Get or set description
        /// </summary>
        public virtual string Description { get; set; }

        /// <summary>
        /// Get or set user
        /// </summary>
        public virtual string User { get; set; }

        /// <summary>
        /// Get or ser changes
        /// </summary>
        public virtual IList<AuditClassPropertyChange> Changes { get; set; }

        /// <summary>
        /// Save <see cref="Audit"/>
        /// </summary>
        /// <param name="session"><see cref="ISession"/></param>
        /// <param name="persistId">Persist id</param>
        /// <param name="auditClass"><see cref="AuditClass"/></param>
        /// <param name="auditType"><see cref="AuditType"/></param>
        /// <param name="description">Description</param>
        /// <param name="user">User</param>
        /// <returns><see cref="Audit"/></returns>
        internal static Audit Save(ISession session, string persistId, AuditClass auditClass, AuditType auditType, 
            string description, string user)
        {
            if (string.IsNullOrEmpty(user)) 
                user = Thread.CurrentPrincipal.Identity.Name;

            var audit = new Audit
            {
                Class = auditClass,
                Type = auditType,
                Reference = persistId,
                Created = DateTime.Now,
                Description = description ?? string.Empty,
                User = string.IsNullOrEmpty(user) ? "User not informed" : user
            };
            
            session.Save(audit);

            return audit;
        }

        /// <summary>
        /// Save <see cref="Audit"/>
        /// </summary>
        /// <param name="event"><see cref="PreUpdateEvent"/></param>
        internal static void Save(PreUpdateEvent @event)
        {
            var differences = AuditDifference.Retrieve(@event);

            if (!differences.Any()) return;

            var session = @event.Session.GetSession(EntityMode.Poco);
            var auditClass = AuditClass.Find(session, @event.Entity.GetType().FullName);
            var auditable = (IAuditable)@event.Entity;

            if (auditClass == null) return;

            var audit = Save(session, @event.Id.ToString(), auditClass, AuditType.Update(), 
                auditable.AuditDescription, auditable.AuditUser);

            foreach (var difference in differences)
            {
                AuditClassPropertyChange.Save(session,
                    audit,
                    AuditClassProperty.Find(session, auditClass, difference.Property),
                    difference.OldValue,
                    difference.NewValue);
            }
        }

        /// <summary>
        /// Save <see cref="Audit"/>
        /// </summary>
        /// <param name="event"><see cref="PreInsertEvent"/></param>
        internal static void Save(PostInsertEvent @event)
        {
            if (!@event.Entity.GetType().GetInterfaces().Contains(typeof (IAuditable))) return;

            var session = @event.Session.GetSession(EntityMode.Poco);
            var auditClass = AuditClass.Find(session, @event.Entity.GetType().FullName);
            
            if (auditClass == null) return;

            var auditable = (IAuditable)@event.Entity;

            Save(session, @event.Id.ToString(), auditClass, AuditType.Insert(),
                auditable.AuditDescription, auditable.AuditUser);
        }

        /// <summary>
        /// Save <see cref="Audit"/>
        /// </summary>
        /// <param name="event"><see cref="PreDeleteEvent"/></param>
        internal static void Save(PreDeleteEvent @event)
        {
            if (!@event.Entity.GetType().GetInterfaces().Contains(typeof(IAuditable))) return;

            var session = @event.Session.GetSession(EntityMode.Poco);
            var auditClass = AuditClass.Find(session, @event.Entity.GetType().FullName);

            if (auditClass == null) return;

            var auditable = (IAuditable)@event.Entity;

            Save(session, @event.Id.ToString(), auditClass, AuditType.Delete(),
                auditable.AuditDescription, auditable.AuditUser);
        }
    }
}