package com.bepza.vr

import com.bepza.auth.User

class VrRequiredDocDtl {

    static mapping = {
        table 'VR_REQUIRED_DOC_DTL'
        cache true
        version false
        id column: 'ID'
    }

    Long id
    String docTypeName
    String docTypeDescription
    String docFor
    Boolean isActive
    Integer fileSizeByte = 1024 * 1024 // 1MB = 1048576 bytes
    String allowedExtensions = "pdf" // comma separated for multiple values and without (.)dot
    Integer sortOrder
    Boolean isMandatory = false
    String remarks

    Date createdDate
    User createdBy
    Date modifiedDate
    User modifiedBy

    static constraints = {
        id(size: 0..19)
        docTypeName nullable: false
        docTypeDescription nullable: true
        docFor nullable: true
        isActive nullable: false
        fileSizeByte nullable: false
        allowedExtensions nullable: false
        sortOrder nullable: true
        isMandatory nullable: true
        remarks nullable: true

        createdDate nullable: false
        createdBy nullable: false
        modifiedDate nullable: true
        modifiedBy nullable: true
    }


    @Override
    String toString() {
        // return docTypeDescription
        return docTypeName
    }
}
