package com.bepza.auth

/*import com.bepza.common.AllDesignation
import com.bepza.cp.CpEntrprsMst
import com.bepza.cp.CpZone*/
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static defaultAction = "list"
    def springSecurityService
    def utilityService

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 1000)
        def userInstanceList = User.createCriteria().list(params) {
            if (params.username) {
                eq("username", params.username.trim())
            }
            if (params.fullName) {
                ilike("fullName", "%${params.fullName}%")
            }
            if (params.roleId) {
                def role = Role.get(params.roleId)
                def userRole = UserRole.findAllWhere(role: role) //, [max: 1000]
                def userIdList = userRole.user*.id
                if (userIdList)
                    inList("id", userIdList)
            }
            /*if (params.zoneId) {
                eq("zone", CpZone.get(params.zoneId))
            }
            if (params.enterpriseId) {
                eq("enterprise", CpEntrprsMst.get(params.enterpriseId))
            }
            if (params.designationId) {
                eq("designation", AllDesignation.get(params.designationId))
            }*/
        }
        def userInstanceCount = userInstanceList.totalCount
        /*def zoneList = utilityService.getZoneList()
        def enterpriseList = utilityService.getEnterpriseByZoneId(params.long("zoneId"))
        def designationList = utilityService.getAllActiveDesignationList()*/
        [userInstanceList: userInstanceList, userInstanceTotal: userInstanceCount]
        /*[userInstanceList: userInstanceList, userInstanceTotal: userInstanceCount, zoneList: zoneList, enterpriseList: enterpriseList, designationList: designationList]*/

    }

    def show(User userInstance) {
        if (!userInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }
        List<Role> userRole = new ArrayList<Role>()
        UserRole.findAllByUser(userInstance).each {
            userRole.add(it.role)
        }
        [userInstance: userInstance, userRole: userRole]
    }

    @Transactional
    def add() {
        def userInstance = new User()
        List<Role> userRole = new ArrayList<Role>()
        if (request.method == 'POST') {
            def currentUserUsername = springSecurityService.currentUser ? springSecurityService.currentUser.username : 'SYSTEM'
            def currentDate = new Date()

            // selected roles
            if (params.role.class.isArray()) {
                params.role.each {
                    def role = Role.get(it)
                    userRole.add(role)
                }
            } else {
                def role = Role.get(params.role)
                userRole.add(role)
            }


            User.withTransaction { status ->
                try {
                    bindData(userInstance, params, [exclude: ['role', 'signature', 'signatureOld', 'docSizeOld']])
                   // userInstance.setEnterprise(CpEntrprsMst.get(params["enterprise.id"]) ?: null)
                    userInstance.setAccountExpired(false)
                    userInstance.setAccountLocked(false)
                    userInstance.setPasswordExpired(false)
                    userInstance.setCreated(currentDate)
                    userInstance.setCreatedBy(currentUserUsername)

                    // signature
                    def uploadedFile = params?.signature
                    def uploadedFileOld = params?.docNameOld
                    def fileName
                    def fileSize
                    def basePath = grailsApplication.parentContext.getResource("files").getFile().toString()
                    if (!uploadedFile.empty) {
                        fileName = uploadedFile.fileItem.fileName
                        fileSize = uploadedFile.size
                        if (fileSize > (50L * 1024L)) {
                            flash.error = 'Maximum file size of 50kb exceeds for signature!'
                            return
                        }
                        def ext = fileName.substring(fileName.lastIndexOf(".") + 1)
                        def prefix = System.currentTimeMillis().toString()
                        fileName = "sign_" + prefix + "_" + userInstance?.username?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                        fileName = fileName.toLowerCase()
                        //upload file
                        def uploadDir = new File(basePath + File.separator + "tmp" + File.separator)
                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs()
                            uploadDir.setWritable(true)
                        }
                        uploadedFile.transferTo(new File(uploadDir, fileName))
                    } else if (uploadedFileOld != "") {
                        fileName = uploadedFileOld
                    }
                    userInstance.setSignature(fileName)
                    // signature end

                    if (userInstance.save(flush: true, failOnError: true)) {
                        userRole.each { role ->
                            UserRole.create(userInstance, role, true)
                        }
                        // signature
                        if (userInstance?.signature) {
                            def destinationFile = new File(basePath + File.separator + "employee" + File.separator + "signature" + File.separator + userInstance?.signature)
                            def sourceFile = new File(basePath + File.separator + "tmp" + File.separator + userInstance?.signature)
                            utilityService.copyFile(sourceFile, destinationFile)
                        }
                        // signature end
                        flash.success = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                        redirect(action: "show", id: userInstance.id)
                    }
                } catch (Exception exp) {
                    status.setRollbackOnly()
                    flash.error = exp.message
                }

            }
        }
        /*def zoneList = utilityService.getZoneList()
        def enterpriseList = utilityService.getEnterpriseByZoneId(userInstance?.zone?.id)
        def designationList = utilityService.getAllActiveDesignationList()*/
        [userInstance: userInstance,userRole: userRole]
        /*[userInstance: userInstance, zoneList: zoneList, userRole: userRole, enterpriseList: enterpriseList, designationList: designationList]*/
    }

    @Transactional
    def edit(User userInstance) {
        if (!userInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }

        List<Role> userRole = new ArrayList<Role>()

        if (request.method == 'POST') {
            def oldSignature = userInstance?.signature
            def currentUserUsername = springSecurityService.currentUser ? springSecurityService.currentUser.username : 'SYSTEM'
            def currentDate = new Date()
            if (params.role.class.isArray()) {
                params.role.each {
                    def role = Role.get(it)
                    userRole.add(role)
                }
            } else {
                def role = Role.get(params.role)
                userRole.add(role)
            }

            User.withTransaction { status ->
                try {
                    bindData(userInstance, params, [exclude: ['role', 'signature', 'signatureOld', 'docSizeOld', 'passwordNew']])
                    if (params.passwordNew) {
                        userInstance.setPassword(params.passwordNew)
                    }
                    userInstance.setModified(currentDate)
                    userInstance.setModifiedBy(currentUserUsername)

                    // signature
                    def uploadedFile = params?.signature
                    def uploadedFileOld = params?.docNameOld
                    def fileName
                    def fileSize
                    def basePath = grailsApplication.parentContext.getResource("files").getFile().toString()
                    def isNewFile = false
                    if (!uploadedFile.empty) {
                        fileName = uploadedFile.fileItem.fileName
                        fileSize = uploadedFile.size
                        if (fileSize > (50L * 1024L)) {
                            flash.error = 'Maximum file size of 50kb exceeds for signature!'
                            return
                        }
                        def ext = fileName.substring(fileName.lastIndexOf(".") + 1)
                        def prefix = System.currentTimeMillis().toString()
                        fileName = "sign_" + prefix + "_" + userInstance?.username?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                        fileName = fileName.toLowerCase()
                        //upload file
                        def uploadDir = new File(basePath + File.separator + "tmp" + File.separator)
                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs()
                            uploadDir.setWritable(true)
                        }
                        uploadedFile.transferTo(new File(uploadDir, fileName))
                        isNewFile = true
                    } else if (uploadedFileOld != "") {
                        fileName = uploadedFileOld
                    }
                    userInstance.setSignature(fileName)
                    // signature end

                    if (userInstance.save(flush: true, failOnError: true)) {
                        UserRole.removeAll(userInstance)
                        userRole.each { role ->
                            UserRole.create(userInstance, role, true)
                        }
                        // signature
                        if (userInstance?.signature && isNewFile) {
                            def destinationFile = new File(basePath + File.separator + "employee" + File.separator + "signature" + File.separator + userInstance?.signature)
                            def sourceFile = new File(basePath + File.separator + "tmp" + File.separator + userInstance?.signature)
                            utilityService.copyFile(sourceFile, destinationFile)
                            if (isNewFile) {
                                def oldSignatureFile = new File(basePath + File.separator + "employee" + File.separator + "signature" + File.separator + oldSignature)
                                if (oldSignatureFile.exists()) {
                                    oldSignatureFile.delete()
                                }
                            }
                        }
                        // signature end
                        flash.success = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                        redirect(action: "show", id: userInstance.id)
                    }
                } catch (Exception exp) {
                    status.setRollbackOnly()
                    flash.error = exp.message
                }
            }
        } else {
            UserRole.findAllByUser(userInstance).each {
                userRole.add(it.role)
            }
        }
        /*def zoneList = utilityService.getZoneList()
        def enterpriseList = utilityService.getEnterpriseByZoneId(userInstance?.zone?.id)
        def designationList = utilityService.getAllActiveDesignationList()*/
        [userInstance: userInstance, userRole: userRole]
        /*[userInstance: userInstance, userRole: userRole, zoneList: zoneList, enterpriseList: enterpriseList, designationList: designationList]*/
    }

    /*@Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }

        try {
            def basePath = grailsApplication.parentContext.getResource("files").getFile().toString()
            def signatureFile = new File(basePath + File.separator + "employee" + File.separator + "signature" + File.separator + userInstance?.signature)
            UserRole.removeAll(userInstance)
            userInstance.delete(flush: true)
            if (signatureFile.exists()) {
                signatureFile.delete()
            }
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
            redirect(action: "show", id: userInstance.id)
        }
    }*/


    def changePassword() {
        // User userInstance

        def userName = springSecurityService.currentUser.username
        if (request.method == 'POST') {

            Date curDate = new Date()

            def userInstance = User.findByUsername(userName)
            /*  String passwords = userInstance.password
              String pass = springSecurityService.encodePassword(params.oldPassword,null)*/

            if (!params.newPassword.equals(params.confirmPassword)) {
                flash.error = "New Password and Confirm Password not matched!"
                render view: 'changePassword', model: [userName: userName]
                return
//            } else if (passwords.hashCode()!= pass.hashCode()) {
                /*} else if (!userInstance.password.equals(springSecurityService.encodePassword(params.oldPassword,null))) {
                    flash.error = "Wrong Current Password!"
                    render view: 'changePassword', model: [userName: userName]
                    return*/
                /* } else if (!userInstance.password.equals(springSecurityService.encodePassword(params.oldPassword))) {
                     flash.error = "Wrong Current Password!"
                     render view: 'changePassword', model: [userInstance: userInstance]
                     return */
            } else {
                userInstance.setPassword(params.newPassword)
                userInstance.setModified(curDate)
                userInstance.setModifiedBy(userName)
                if (userInstance.save(flush: true)) {
                    flash.success = "Your password has been changed successfully!"
                    redirect(controller: "user", action: "changePassword")
                    return
                } else {
                    flash.error = "Password could not updated! Please try again later."
                }
                redirect(controller: "user", action: "changePassword")
                return
            }
        }
        [userName: userName]
    }

}
