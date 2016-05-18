package com.bepza.vr

import com.bepza.approval.ApprovalGroup
import com.bepza.auth.User
import com.bepza.common.AllLookup

class VrApplicationInfoApprovalHistory {

    static mapping = {
        table 'VR_APP_INFO_APRVL_HISTRY'
        // version is set to false, because this isn't available by default for legacy databases
        version false
    }

    VrApplicationInfo application
    ApprovalGroup approvalGroup
    User approvalGroupMember
    AllLookup approvalStatus
    Date actionDate
    String remarks
    ApprovalGroup sentToGroup
    User sentToMember

    static constraints = {
        application(nullable: false)
        approvalGroup(nullable: false)
        approvalGroupMember(nullable: false)
        approvalStatus(nullable: false)
        actionDate(nullable: false)
        remarks(nullable: true, size: 0..500)
        sentToGroup nullable: true
        sentToMember nullable: true
    }

    String toString() {
        return "${application}-${approvalStatus}"
    }
}
