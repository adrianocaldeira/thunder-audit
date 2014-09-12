namespace Thunder.Audit
{
    /// <summary>
    /// Auditable 
    /// </summary>
    public interface IAuditable
    {
        /// <summary>
        /// Get or set audit description
        /// </summary>
        string AuditDescription { get; set; }

        /// <summary>
        /// Get or set audit user
        /// </summary>
        string AuditUser { get; set; }

        /// <summary>
        /// Get or set audit group reference
        /// </summary>
        string AuditGroupReference { get; set; }
    }
}