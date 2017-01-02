package BasicMessage

class PersonalInformation {
    String uid
    String phoneNumber
    String emailAddress
    static constraints = {
        uid nullable: false
    }
    static mapping = {
        table 'USER_DATABASE.PersonalInformation'
        uid column: 'uid'
        phoneNumber column: 'phoneNumber'
        emailAddress column: 'emailAddress'
    }
}
