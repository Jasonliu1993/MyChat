package PushList

class ListOfMessage {
    String uid
    String Message
    String toUserID
    Date sendDatetime
    String status
    static constraints = {
        uid (nullable: true)
    }
    static mapping = {
        table 'USER_DATABASE.ListOfMessage'
        uid (column: 'uid')
        Message (column: 'F_message')
        toUserID (column: 'F_uid')
        sendDatetime (colunm:'F_status')
        status (colunm: 'status')
    }
}
