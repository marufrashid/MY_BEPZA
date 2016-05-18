package com.bepza.approval

//import com.bepza.cp.CpZone

class ApprovalGroupZone {
    ApprovalGroup approvalGroup
    //CpZone zone

    static constraints = {
        approvalGroup nullable: false
       // zone nullable: false, unique: ["approvalGroup"]
    }

    static mapping = {
        table 'approval_group_zone'
        //id column: 'id', params: [sequence: 'menu_seq'] // only for oracle db
        version false
    }
}
