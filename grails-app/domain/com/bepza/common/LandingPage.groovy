package com.bepza.common

import com.bepza.auth.Role
import com.bepza.auth.User

class LandingPage {
    static mapping = {
        table 'landing_pages'
        // version is set to false, because this isn't available by default for legacy databases
        version false
        entryByUserId column: 'entry_by_user_id'
        modifiedByUserId column: 'modified_by_user_id'
    }

    Role userRole
    String pageUrl
    String remarks
    Boolean isActive

    Date entryDate
    Date modifiedDate
    User entryByUserId
    User modifiedByUserId

    static constraints = {
        userRole(nullable: false)
        pageUrl(nullable: false, unique: ["userRole"], size: 0..2000)
        isActive(nullable: true)
        remarks(nullable: true, size: 0..500)

        entryDate(nullable: true)
        modifiedDate(nullable: true)
        entryByUserId(nullable: true)
        modifiedByUserId(nullable: true)
    }

    String toString() {
        return "${userRole}: ${pageUrl}"
    }
}
