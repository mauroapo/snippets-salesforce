public without sharing class EventRelationInvite 
//snippet to send invite to email
{
    public void sendInviteToEmail()
    {
       Event ev = new Event();
        ev.Subject = 'Test Subject';
        ev.Description = 'description';
        ev.Location = 'location';
        ev.StartDateTime = datetime.now().addHours(1);
        ev.EndDateTime = datetime.now().addHours(2);
        insert ev;

        // Here below is the code that 'invites' the contact
        Database.DMLOptions dmo = new Database.DMLOptions();
        dmo.EmailHeader.triggerOtherEmail = true;

        List<SObject> relations = new List<SObject>();
        EventRelation r = new EventRelation();
        r.EventId = ev.Id;

        // The RelationId field can have the Id of a User, Contact or Lead.
        // In our case we are using the Id of a Contact as an example.
        // If you want to invite several people, create one EventRelation
        // for every single person to be invited to the event.
        r.RelationId = '0038G00000Jnx2DQAR';
        relations.add(r);
        database.insert(relations, dmo);
    }
}