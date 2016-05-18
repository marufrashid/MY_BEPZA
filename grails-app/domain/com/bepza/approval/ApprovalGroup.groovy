package com.bepza.approval

import com.bepza.auth.User

/**
 * Created by msaifullah on 11/29/2015.
 */
class ApprovalGroup {
    //def utilityService
    static mapping = {
        table 'approval_group'
        // version is set to false, because this isn't available by default for legacy databases
        version false
        entryByUserId column: 'entry_by_user_id'
        modifiedByUserId column: 'modified_by_user_id'
        approvalGroupMember cascade: 'all'
        approvalGroupStatus cascade: 'all'
        approvalGroupZone cascade: 'all'
    }

    String code
    ApprovalProcess approvalProcess
    String keyword
    String groupName
    String description
    Boolean isActive = true
    Integer priority
    String groupScope = "OWN_ZONE"
    Date entryDate
    Date modifiedDate
    User entryByUserId
    User modifiedByUserId

    static hasMany = [approvalGroupMember: ApprovalGroupMember, approvalGroupStatus: ApprovalGroupStatus, approvalGroupZone: ApprovalGroupZone]

    static constraints = {
        code(size: 1..30, unique: true, nullable: true)
        approvalProcess(nullable: false)
        keyword(nullable: false, size: 1..100, unique: ["approvalProcess"])
        groupName(nullable: false, size: 1..100)
        priority(nullable: false, unique: ["approvalProcess"])
        isActive(nullable: true)
        description(nullable: true, size: 0..500)
        groupScope nullable: false, inList: ["OWN_ZONE", "HEAD_OFFICE"]
        entryDate(nullable: true)
        modifiedDate(nullable: true)
        entryByUserId(nullable: true)
        modifiedByUserId(nullable: true)
    }
    /*def beforeInsert() {
        def currentDate = new SimpleDateFormat("MMyy").format(new Date())
        code = utilityService.getCode("ApprovalGroup", "AG-", + currentDate, 4, false)
    }*/
    String toString() {
        return "${groupName}"
    }
}

