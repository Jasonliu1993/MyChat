package PushList

class ListOfFriends {
    String uid
    String F_uid
    String F_name
    String status
    static constraints = {
        uid (nullable: true)
    }
    static mapping = {
        table 'USER_DATABASE.ListOfFriends'
        uid (column: 'uid')
        F_uid (column: 'F_uid')
        F_name (column: 'F_name')
        status (column: 'status')
    }
}
