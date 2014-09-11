using Thunder.Data.Pattern;

namespace Thunder.Audit
{
    /// <summary>
    ///     Type audit
    /// </summary>
    public class AuditType : Persist<AuditType, short>
    {
        /// <summary>
        ///     Get or set name
        /// </summary>
        public virtual string Name { get; set; }

        /// <summary>
        /// Insert
        /// </summary>
        /// <returns><see cref="AuditType"/></returns>
        public static AuditType Insert()
        {
            return new AuditType { Id = 1 };
        }

        /// <summary>
        /// Update
        /// </summary>
        /// <returns><see cref="AuditType"/></returns>
        public static AuditType Update()
        {
            return new AuditType { Id = 2 };
        }

        /// <summary>
        /// Delete
        /// </summary>
        /// <returns><see cref="AuditType"/></returns>
        public static AuditType Delete()
        {
            return new AuditType { Id = 3 };
        }

        /// <summary>
        /// Is update
        /// </summary>
        public virtual bool IsUpdate
        {
            get { return Equals(this, Update()); }
        }
    }
}