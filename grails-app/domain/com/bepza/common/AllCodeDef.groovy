package com.bepza.common

import com.bepza.auth.User

/**
 * The AllCodeDef entity.

 * @date : Thu Apr 04 14:04:20 BDT 2016
 */
class AllCodeDef {
    static mapping = {
        table 'ALL_CODE_DEF'
        // version is set to false, because this isn't available by default for legacy databases
        version false
        id column: 'ID'
        entryByUserId column: 'ENTRY_BY_USER_ID'
        modifiedByUserId column: 'MODIFIED_BY_USER_ID'
    }

    String code
    String tableName
    Long id
    Long cdLength
    String dscrptn
    Long nxtVal
    String pojoClass
    String prefix

    Date entryDate
    Date modifiedDate
    User entryByUserId
    User modifiedByUserId

    static constraints = {
        code(size: 0..100, blank: false)
        tableName(nullable: true, size: 0..30)
        id(size: 0..19)
        cdLength(nullable: true, size: 0..19)
        dscrptn(nullable: true, size: 0..500)
        nxtVal(nullable: true, size: 0..19)
        pojoClass(nullable: true, size: 0..30)
        prefix(nullable: true, size: 0..30)
        entryDate(nullable: true)
        modifiedDate(nullable: true)
        entryByUserId(nullable: true)
        modifiedByUserId(nullable: true)
    }

    String toString() {
        return "${code}"
    }
}