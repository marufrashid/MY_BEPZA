package com.bepza.approval

import com.bepza.auth.User

/**
 * Created by msaifullah on 11/29/2015.
 */
class ApprovalGroupMember {
    static mapping = {
        table 'approval_group_member'
        // version is set to false, because this isn't available by default for legacy databases
        version false
        entryByUserId column: 'entry_by_user_id'
        modifiedByUserId column: 'modified_by_user_id'
        groupMember column: 'group_member_user_id'
    }

    String code
    ApprovalGroup approvalGroup
    User groupMember
    String description
    Boolean isActive = true
    Long sortOrder
    Date entryDate
    Date modifiedDate
    User entryByUserId
    User modifiedByUserId

    static constraints = {
        code(nullable: true,size: 1..30, unique: true)
        approvalGroup(nullable: false,blank:false)
        groupMember(nullable: false, blank:false)
        sortOrder(nullable: true)
        isActive(nullable: true)
        description(nullable: true, size: 0..500)
        entryDate(nullable: true)
        modifiedDate(nullable: true)
        entryByUserId(nullable: true)
        modifiedByUserId(nullable: true)
    }

    String toString() {
        return "${groupMember?.fullName}"
    }
}
