package com.bepza.approval

import com.bepza.common.AllLookup

class ApprovalGroupStatus {
    ApprovalGroup approvalGroup
    AllLookup groupStatus
    Integer sortOrder
    /*String keyword
    String title
    Integer sortOrder
    Boolean isActive = true
    Date entryDate
    Date modifiedDate
    User entryByUserId
    User modifiedByUserId*/

    static constraints = {
        approvalGroup nullable: false
        groupStatus nullable: false, unique: ["approvalGroup"]
        sortOrder nullable: true
        /*keyword nullable: false
        title nullable: false
        sortOrder nullable: true
        isActive nullable: false
        entryDate nullable: true
        modifiedDate nullable: true
        entryByUserId nullable: true
        modifiedByUserId nullable: true*/
    }
    static mapping = {
        table 'approval_group_status'
        //id column: 'id', params: [sequence: 'menu_seq'] // only for oracle db
        version false
        //entryByUserId column: 'entry_by_user_id'
        //modifiedByUserId column: 'modified_by_user_id'
    }

    String toString(){
        return groupStatus
    }
}
