package com.bepza.common

import com.bepza.auth.User

class HomeController {
    def springSecurityService

    def index() {
        def currentUser = (User) springSecurityService?.currentUser
        def landingPage = LandingPage.findByUserRoleInListAndIsActive(currentUser?.authorities, true)
        if (landingPage) {
            redirect(uri: landingPage?.pageUrl)
            return
        }
        /*render(view: "index", model: [:])
        return*/
    }
}
