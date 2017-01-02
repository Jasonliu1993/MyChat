package Login

import BasicMessage.PersonalInformation

class LoginController {

    def mainPage() {
        def varName = params.name
        def varPassWord = params.password
        session.userName = varName
        session.inputText = ""
        LoginData varLoginData = LoginData.findWhere(name: varName)
        if (varLoginData) {
            if (varLoginData.pd == varPassWord) {
                /*def nowDate = new Date()
                print "+++++++++" + nowDate.toString()
                def L_text = "Login Successful! time:" + nowDate.toString()*/
                def varFriends = Friends.findByUid(varName)
                redirect(controller: "Chat", action: "mainPage", params: ["varFriends": varFriends])
            } else {
                render view: 'error'
            }
        } else {
            render view: 'error'
        }
    }

    def register() {

    }

    def saveRegister() {
        def name = params.name
        def UID = params.UID
        def password = params.password
        def emailAddress = params.emailAddress
        def phoneNumber = params.phoneNumber
        print "++++" + name + "+++++"
        def varLoginData = new LoginData()
        def varPersonalMessage = new PersonalInformation()
        varLoginData.name = UID
        varLoginData.pd = password
        varPersonalMessage.uid = UID
        varPersonalMessage.emailAddress = emailAddress
        varPersonalMessage.phoneNumber = phoneNumber

        if (!varLoginData.save(flush: true)) {
            varLoginData.errors.allErrors.each {
                println it
            }
        }
        if (!varPersonalMessage.save(flush: true)) {
            varPersonalMessage.errors.allErrors.each {
                println it
            }
        }
        render (view : 'registerSuccessful.gsp')
    }
}