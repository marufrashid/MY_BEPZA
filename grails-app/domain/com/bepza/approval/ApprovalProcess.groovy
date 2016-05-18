package com.bepza.approval

import com.bepza.auth.User

/**
 * Created by msaifullah on 11/29/2015.
 */
class ApprovalProcess {
  //  def utilityService
    static mapping = {
        table 'approval_process'
        // version is set to false, because this isn't available by default for legacy databases
        version false
        entryByUserId column: 'entry_by_user_id'
        modifiedByUserId column: 'modified_by_user_id'
    }

    String	code
    String	processName
    String	processKeyword
    String remarks
    Boolean isActive
    Long sortOrder
    Date entryDate
    Date modifiedDate
    User entryByUserId
    User modifiedByUserId

    static constraints = {
        code(size: 1..30, unique: true,nullable: true)
        processName(nullable: false, size: 1..100)
        processKeyword(nullable: false, size: 0..100)
        sortOrder(nullable: true)
        isActive(nullable: true)
        remarks(nullable: true, size: 0..500)
        entryDate(nullable: true)
        modifiedDate(nullable: true)
        entryByUserId(nullable: true)
        modifiedByUserId(nullable: true)
    }
   /* def beforeInsert() {
        code = utilityService.getCode("ApprovalProcess", "AP-", 6, false)
    }*/
    String toString() {
        return "${processName}"
    }
}

