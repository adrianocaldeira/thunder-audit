using System.Collections.Generic;
using NHibernate.Event;
using Test.Model;
using Thunder.Audit;
using Thunder.NHibernate;
using Thunder.NHibernate.Pattern;

namespace Test
{
    class Program
    {
        static void Main(string[] args)
        {
            SessionManager.Listeners = new Dictionary<ListenerType, object[]>
            {
                {ListenerType.PreInsert, new IPreInsertEventListener[] {new CreatedAndUpdatedPropertyEventListener()}},
                {ListenerType.PreUpdate, new IPreUpdateEventListener[] {new CreatedAndUpdatedPropertyEventListener(), new EventListener()}},
                {ListenerType.PreDelete, new IPreDeleteEventListener[] {new EventListener()}},
                {ListenerType.PostInsert, new IPostInsertEventListener[] {new EventListener()}},
            };

            SessionManager.Bind();

            SessionManager.CurrentSession.Save(new AuditType { Id = 1, Name = "Insert" });
            SessionManager.CurrentSession.Save(new AuditType { Id = 2, Name = "Update" });
            SessionManager.CurrentSession.Save(new AuditType { Id = 3, Name = "Delete" });

            SessionManager.CurrentSession.Save(new Car { Model = "BMW"});
            SessionManager.CurrentSession.Save(new Car { Model = "VOLVO" });
            SessionManager.CurrentSession.Save(new Car { Model = "FORD" });
            SessionManager.CurrentSession.Save(new Car { Model = "KIA" });
            SessionManager.CurrentSession.Save(new Car { Model = "GM" });

            SessionManager.CurrentSession.Save(new Person
            {
                Name = "Adriano Caldeira",
                Phones = new List<PersonPhone>
                {
                    new PersonPhone{Number = "00 0000-0000"},
                    new PersonPhone{Number = "00 1111-1111"}
                },
                Cars = new List<Car>
                {
                    new Car{Id = 1},
                    new Car{Id = 2}
                }
            });

            
            SessionManager.Unbind();
        }
    }
}
