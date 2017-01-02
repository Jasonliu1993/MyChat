package Login

class PersonalStatus {
    String uid
    Character status
    static constraints = {
        uid nullable: false
        status nullable: false
    }
    static mapping = {
        table 'USER_DATABASE.PersonalStatus'
        uid column: 'uid'
        status column: 'status'
    }
}
