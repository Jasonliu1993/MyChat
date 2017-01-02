package Login

class LoginData {
    String name
    String pd
    static constraints = {
        name nullable: false
    }
    static mapping = {
        table 'USER_DATABASE.LoginData'
        name column: 'name'
        pd column: 'pass_word'
    }
}
