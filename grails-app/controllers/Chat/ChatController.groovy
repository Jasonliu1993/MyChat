package Chat

import PushList.ListOfMessage
import grails.converters.JSON
import Login.Friends
import PushList.ListOfFriends

class ChatController {

    def sendMessage() {
        print "+++++++++printhere++++++"
        ChatMessage varChatMessage = new ChatMessage()
        print "++++" + params.inputText + "+" + params.inputTo + "+"
        varChatMessage.userID = session.userName
        varChatMessage.sendDatetime = new Date()
        varChatMessage.toUserID = params.inputTo
        varChatMessage.Message = params.inputText
        varChatMessage.status = "A"
        /**
         * 将消息放入ListOfMessage
         */
        ListOfMessage varListOfMessageMessage = new ListOfMessage()
        print "++++" + params.inputText + "+" + params.inputTo + "+"
        varListOfMessageMessage.uid = session.userName
        varListOfMessageMessage.sendDatetime = new Date()
        varListOfMessageMessage.toUserID = params.inputTo
        varListOfMessageMessage.Message = params.inputText
        varListOfMessageMessage.status = "A"
        if(!varListOfMessageMessage.save(flush:true)){
            varListOfMessageMessage.errors.allErrors.each{
                println it
            }
        }
        render  view : 'mainPage'
    }

    def mainPage(){

    }

    def receiveMessage(){
        print "+++++" + session.userName +"+++"
        print "+++++" + params.test + "++"
        def UID = session.userName
        def receiveMessage = ListOfMessage.findAllByToUserIDAndStatus(UID,'A')
        print "++++" + params.inputText + "+" + params.inputTo + "+"
        for (int i = 0 ; i < receiveMessage.size(); i++){
            print "++++" + receiveMessage[i].status + "+" + params.inputTo + "+"
            receiveMessage[i].status = "N"
            if(!receiveMessage[i].save(flush:true)){
                receiveMessage.errors.allErrors.each{
                    println it
                }
            }
        }
        render receiveMessage as JSON
    }

    def getFriendsList(){
        def UID = session.userName
        def listOfFriends = ListOfFriends.findByUid(UID)
        render listOfFriends as JSON
    }

    def initializeFriendList(){
        def UID = session.userName
        def listOfFriends = Friends.findAllByUid(UID)
        render listOfFriends as JSON
    }
}
