package Login

class Friends implements Serializable{
    String uid
    String F_uid
    String F_name
    static constraints = {
        uid (nullable: true)
    }
    static mapping = {
        table 'USER_DATABASE.FriendMessage'
        uid (column: 'uid')
        F_uid (column: 'F_uid')
        F_name (column: 'F_name')
    }
}