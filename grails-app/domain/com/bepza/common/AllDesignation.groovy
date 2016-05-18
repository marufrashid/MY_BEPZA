package com.bepza.common

import com.bepza.auth.User

/**
 * Created by msaifullah on 11/8/2015.
 */
class AllDesignation {

    static mapping = {
        table 'ALL_DESIGNATION'
        // version is set to false, because this isn't available by default for legacy databases
        version false
        id column: 'ID'
        entryByUserId column: 'ENTRY_BY_USER_ID'
        modifiedByUserId column: 'MODIFIED_BY_USER_ID'
    }

    Long id
    String code
    String designationName
    String shortName
    String keyword
    String remarks

    Boolean isActive
    Long sortOrder

    Date entryDate
    Date modifiedDate
    User entryByUserId
    User modifiedByUserId

    static constraints = {
        id(size: 0..19)
        code(size: 1..30, unique: true)
        designationName(nullable: false, size: 1..100, unique: true)
        keyword(nullable: true, size: 0..20)
        shortName(nullable: true, size: 0..20)
        sortOrder(nullable: true)
        isActive(nullable: true)
        remarks(nullable: true, size: 0..500)
        entryDate(nullable: true)
        modifiedDate(nullable: true)
        entryByUserId(nullable: true)
        modifiedByUserId(nullable: true)
    }

    String toString() {
        return "${designationName}"
    }
}
