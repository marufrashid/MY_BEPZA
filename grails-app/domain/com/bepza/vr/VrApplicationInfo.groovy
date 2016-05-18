package com.bepza.vr

import com.bepza.approval.ApprovalGroup
import com.bepza.auth.User
import com.bepza.common.AllDesignation
import com.bepza.common.AllLookup
import com.bepza.common.CpEntrprsMst

import java.text.SimpleDateFormat

class VrApplicationInfo {

    def utilityService

    static mapping = {
        table 'VR_APPLICATION_INFO'
        cache true
        version false
        id column: 'ID'

    }

    Long id
    CpEntrprsMst enterprise
    String code //format = {IM}{mmyy}{4 digit sequence}

    String nameOfForeigner
    String nameOfForFamMember
    String foreignerRefNo
    AllDesignation designation
    AllLookup nationality
    String relation
    Date dateOfBirth
    String passportNo
    Date passportIssueDate
    Date PassportExpireDate
    AllLookup visaCategory
    String purpose
    String foreignerSummary

    String remarks
    AllLookup currentStatus
    AllLookup previousStatus
    ApprovalGroup currentServeGroup
    User currentServeMember
    Boolean isActive = true

    Date submitDate
    User submittedBy

    Boolean isSaveAsDraft = false
    Date saveAsDraftDate
    Boolean isApproved = false
    Date approvedDate
    String visaRecommandationNo
    Boolean isCancelRequest = false
    Date cancelRequestDate // application date
    String cancelReason
    Boolean isCanceled = false
    Date cancelDate // approved date

    //newly Added
    String vrIssueNo

    Date processedDate
    User processedBy
    
    Date createdDate
    User createdBy
    Date modifiedDate
    User modifiedBy

    static hasMany = [vrRequiredDoc: VrRequiredDoc]

    static constraints = {
        id(size: 0..19)
        code nullable: true, unique: ["enterprise","visaCategory"]

        enterprise nullable: false
        nameOfForeigner nullable: false
        nameOfForFamMember nullable: true
        foreignerRefNo  nullable: true
        designation  nullable: true
        nationality nullable: true
        relation nullable: true
        dateOfBirth nullable: true
        passportNo nullable: false
        passportIssueDate nullable: false
        passportExpireDate  nullable: false
        visaCategory nullable: false
        purpose nullable: true
        foreignerSummary nullable: true

        remarks nullable: true
        currentStatus nullable: true
        previousStatus nullable: true
        currentServeGroup nullable: true
        currentServeMember nullable: true
        isActive nullable: true

        submittedBy nullable: true;
        submitDate  nullable: true;

        isSaveAsDraft nullable: true
        saveAsDraftDate nullable: true
        isApproved nullable: true
        approvedDate nullable: true
        visaRecommandationNo nullable: true
        isCancelRequest nullable: true
        cancelRequestDate nullable: true
        cancelReason nullable: true
        isCanceled nullable: true
        cancelDate nullable: true

        vrIssueNo nullable: true //newly Added

        processedDate nullable: true
        processedBy nullable: true

        createdDate nullable: false
        createdBy nullable: false
        modifiedDate nullable: true
        modifiedBy nullable: true
    }


    def beforeInsert() {
        def currentDate = new SimpleDateFormat("MMyy").format(new Date())
        //{IM}{mmyy}{4 digit sequence}
        code = utilityService.getCode("VrApplicationInfo", "VR" + currentDate , 4, false)
    }
}
