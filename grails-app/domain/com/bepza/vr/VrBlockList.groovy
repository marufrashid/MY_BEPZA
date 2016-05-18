package com.bepza.vr


import com.bepza.auth.User
import com.bepza.common.AllLookup
import com.bepza.common.CpEntrprsMst

import java.text.SimpleDateFormat

class VrBlockList {

    def utilityService

    static mapping = {
        table 'VR_BLOCK_LIST'
        cache true
        version false
        id column: 'ID'
    }

    Long id
    CpEntrprsMst enterprise
    String code //format = {IM}{mmyy}{4 digit sequence}

    String nameOfForeigner
    String passportNo
    AllLookup nationality
    String placeOfIssue
    Date dateOfIssue
    Date dateOfBirth
    Boolean isActive = true

    Date createdDate
    User createdBy
    Date modifiedDate
    User modifiedBy


    static constraints = {
        id(size: 0..19)
        code nullable: true, unique: ["enterprise"]
        enterprise nullable: true

        nameOfForeigner nullable: false
        passportNo nullable: false
        nationality nullable: true
        placeOfIssue nullable: true
        dateOfIssue nullable: true
        dateOfBirth nullable: true
        isActive nullable: false

        createdDate nullable: false
        createdBy nullable: false
        modifiedDate nullable: true
        modifiedBy nullable: true
    }


    def beforeInsert() {
        def currentDate = new SimpleDateFormat("MMyy").format(new Date())
        //{IM}{mmyy}{4 digit sequence}
        code = utilityService.getCode("VrBlockList", "VRB" + currentDate , 4, false)
    }
}
