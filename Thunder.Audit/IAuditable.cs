namespace Thunder.Audit
{
    public interface IAuditable
    {
        string AuditableDescription { get; set; }
        string AuditableUser { get; set; }
    }
}
