package com.bepza.auth

/*import com.bepza.common.AllDepartment
import com.bepza.common.AllDesignation*/
import com.bepza.common.AllLookup
import com.bepza.common.CpEntrprsMst

/*import com.bepza.cp.CpEntrprsMst
import com.bepza.cp.CpZone*/

class User implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService

    String fullName
    String username
    String password
    String cellNo
    String email
    Boolean enabled = true
    Boolean accountExpired = false
    Boolean accountLocked = false
    Boolean passwordExpired = false
    Date created
    String createdBy
    Date modified
    String modifiedBy
    //CpZone zone
    CpEntrprsMst enterprise
    AllLookup userType // keyword = AUTH_USER_TYPES
    //AllDesignation designation
    //AllDepartment department
    String signature
    //Employee employee

    User(String username, String password) {
//        this()
        this.username = username
        this.password = password
    }

    @Override
    int hashCode() {
        username?.hashCode() ?: 0
    }

    @Override
    boolean equals(other) {
        is(other) || (other instanceof User && other.username == username)
    }

    @Override
    String toString() {
        username
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this)*.role
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    static transients = ['springSecurityService']

    static constraints = {
        fullName blank: false, nullable: false
        username blank: false, unique: true
        password blank: false
        cellNo nullable: true
        email nullable: true, email: true
        created nullable: false
        createdBy nullable: false
        modified nullable: true
        modifiedBy nullable: true
        //zone nullable: true
        enterprise nullable: true
        userType nullable: true
        //designation nullable: true
        //department nullable: true
        signature nullable: true
        signature blank: true, nullable: true, validator: { val, obj ->
            if (val) {
                def ext = val.substring(val.lastIndexOf(".") + 1)
                if (ext.toLowerCase() != 'jpg') {
                    return 'user.signature.validator.invalidFileType'
                }
            } else {
                return true
            }
        }
        //employee nullable: true
    }

    static mapping = {
        table 'auth_user'
        version false
        password column: '`password`'
    }
}
