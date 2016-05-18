package com.bepza.vr

import com.bepza.auth.User


class VrRequiredDoc {

    static mapping = {
        table 'VR_REQUIRED_DOC'
        cache true
        version false
        id column: 'ID'
    }

    Long id

    VrApplicationInfo vrApplicationInfo
    VrRequiredDocDtl docType

    String userGivenDocName
    String docName
    String docUrl
    Long docSize
    String remarks

    Date createdDate
    User createdBy
    Date modifiedDate
    User modifiedBy

    static constraints = {
        id(size: 0..19)
        vrApplicationInfo nullable: false
        userGivenDocName nullable: false
        docType nullable: false
        docName nullable: false

        docUrl nullable: true
        docSize nullable: true
        remarks nullable: true

        createdDate nullable: false
        createdBy nullable: true
        modifiedDate nullable: true
        modifiedBy nullable: true
    }

    @Override
    String toString() {
        return docName
    }

}
