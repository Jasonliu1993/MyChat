package Chat

class ChatMessage {
    String userID
    String Message
    String toUserID
    Date sendDatetime
    String status
    static mapping = {
        table 'USER_DATABASE.ChatMessage'
        userID (column: 'uid')
        Message (column: 'F_message')
        toUserID (column: 'F_uid')
        sendDatetime (colunm:'F_status')
        status (colunm: 'status')
    }
}
