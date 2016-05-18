package com.bepza.vr

import com.bepza.auth.Role
import com.bepza.auth.User
import com.bepza.common.AllDesignation
import com.bepza.common.AllLookup
import com.bepza.common.CpEntrprsMst
import grails.converters.JSON
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef
import org.codehaus.groovy.grails.web.mapping.LinkGenerator
import org.springframework.http.HttpStatus
import org.springframework.transaction.TransactionStatus
import util.DateRelated
import util.EmailProcessor
import util.IMessageSender
import util.WSReturn

import java.sql.SQLException
import java.text.SimpleDateFormat

@Transactional(readOnly = true)
class VrApplicationInfoController {

    static defaultAction = "list"
    def springSecurityService
    def utilityService
    def vrRequiredDocDtlService
    def approvalService
    def vrApplicationInfoService
    def allLookupService
    def jasperService

    LinkGenerator grailsLinkGenerator
    def dateFormat

    def beforeInterceptor = {
        dateFormat = grailsApplication.config.grails.date.format
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 10000)
        SimpleDateFormat df = new SimpleDateFormat(dateFormat)
        def currentUser = (User) springSecurityService?.currentUser

        def sortField = params?.sort ?: 'processedDate'
        def orderDirection = params?.order ?: 'desc'
        def result = VrApplicationInfo.createCriteria().list(params) {

            if (params.code != null && params.code != "") {
                eq("code", params.code.toString().trim())
            }

            if (params.fromDate && params.toDate) {
                ge("submitDate", DateRelated.getDateObject(params.fromDate))
                lt("submitDate", DateRelated.getDateObject(params.toDate) + 1)
            } else if (params.fromDate) {
                ge("submitDate", DateRelated.getDateObject(params.fromDate))
            } else if (params.toDate) {
                lt("submitDate", DateRelated.getDateObject(params.toDate) + 1)
            }

            order(sortField, orderDirection)
        }
        def totalCount = result.totalCount

        [vrApplicationInfoInstanceList: result, vrApplicationInfoInstanceTotal: totalCount]
    }

    def listBK(Integer max) {
        params.max = Math.min(max ?: 10, 10000)
        SimpleDateFormat df = new SimpleDateFormat(dateFormat)
        def currentUser = (User) springSecurityService?.currentUser

        def currentServeGroupList = approvalService.getApprovalGroupListByUser(currentUser)

        Set<Role> currentServerMemberRoleList = currentUser.authorities
        String currentServerMemberRole
        if (currentServerMemberRoleList.size() > 0) {
            for (int i = 0; i < currentServerMemberRoleList.size(); i++) {
                if (currentServerMemberRoleList[i].authority == "ROLE_VR_MAKER") {
                    currentServerMemberRole = currentServerMemberRoleList[i].authority
                    break
                } else if (currentServerMemberRoleList[i].authority == "ROLE_VR_CHECKER") {
                    currentServerMemberRole = currentServerMemberRoleList[i].authority
                    break
                } else {
                    currentServerMemberRole = currentServerMemberRoleList[i].authority
                }
            }
        }

        println("currentServerMemberRole :" + currentServerMemberRole)
        println("currentServeGroupList :" + currentServeGroupList)

        def sortField = params?.sort ?: 'processedDate'
        def orderDirection = params?.order ?: 'desc'
        def result = VrApplicationInfo.createCriteria().list(params) {
            // This list will see according to company
            // Maker will see all Application of which was created by him
            // Checker will see all Application whom currentStatus is SUBMITTED and see all Application of which was come to him to check
            eq("enterprise", currentUser?.enterprise)
            //println("currentServerMemberRole :"+currentServerMemberRole)
            if (currentServerMemberRole.equals("ROLE_VR_MAKER")) {
                inList("currentServeGroup", currentServeGroupList)
                eq("currentServeMember", currentUser)
            } else {//ROLE_VR_CHECKER
                inList("currentServeGroup", currentServeGroupList)
            }

            if (params.code != null && params.code != "") {
                eq("code", params.code.toString().trim())
            }

            if (params.fromDate && params.toDate) {
                ge("submitDate", DateRelated.getDateObject(params.fromDate))
                lt("submitDate", DateRelated.getDateObject(params.toDate) + 1)
            } else if (params.fromDate) {
                ge("submitDate", DateRelated.getDateObject(params.fromDate))
            } else if (params.toDate) {
                lt("submitDate", DateRelated.getDateObject(params.toDate) + 1)
            }

            order(sortField, orderDirection)
        }
        def totalCount = result.totalCount

        [vrApplicationInfoInstanceList: result, vrApplicationInfoInstanceTotal: totalCount, currentServerMemberRole: currentServerMemberRole]
    }

    def searchProcessingList() {

        def currentUser = (User) springSecurityService?.currentUser
        def approvalGroupInstanceList = approvalService.getApprovalGroupListByUser(currentUser)
        if (approvalGroupInstanceList.size() == 0) {
            flash.error = 'Role not defined to perform that operation!'
            redirect(uri: "/")
            return
        }

        def result = vrApplicationInfoService.getPendingListForProcess(params)
        def enterpriseList = utilityService.getAllActiveEnterpriseList()

        def totalCount = result.totalCount
        render(view: "processingList", model: [vrApplicationInfoInstanceList: result, vrApplicationInfoInstanceTotal: totalCount])
        return
    }

    @Transactional
    def add() {
        VrApplicationInfo vrApplicationInfoInstance = new VrApplicationInfo()
        def currentUser = (User) springSecurityService?.currentUser
        def currentDate = new Date()
        Set<Role> currentServerMemberRoleList = currentUser.authorities
        String currentServerMemberRole
        if (currentServerMemberRoleList.size() > 0) {
            for (int i = 0; i < currentServerMemberRoleList.size(); i++) {
                if (currentServerMemberRoleList[i].authority == "ROLE_VR_MAKER") {
                    currentServerMemberRole = currentServerMemberRoleList[i].authority
                    break
                } else if (currentServerMemberRoleList[i].authority == "ROLE_VR_CHECKER") {
                    currentServerMemberRole = currentServerMemberRoleList[i].authority
                    break
                } else {
                    currentServerMemberRole = currentServerMemberRoleList[i].authority
                }
            }
        }


        if (request.method == 'POST') {
            VrApplicationInfo.withTransaction { TransactionStatus tStatus ->
                try {

                    /* bindData(importPermitInstance, params?.VrApplicationInfo, [exclude: ['undertakingDate', 'referenceDate']])*/

                    SimpleDateFormat df = new SimpleDateFormat(dateFormat);
                    def dateOfBirth = params["dateOfBirth"] ? df.parse(params["dateOfBirth"]) : null
                    def passportIssueDate = params["passportIssueDate"] ? df.parse(params["passportIssueDate"]) : null
                    def passportExpireDate = params["passportExpireDate"] ? df.parse(params["passportExpireDate"]) : null

                    String enterpriseId = params.enterprise
                    if (enterpriseId != "") {
                        def cpEntrprsMst = CpEntrprsMst.findById(Long.valueOf(enterpriseId))
                        vrApplicationInfoInstance.setEnterprise(cpEntrprsMst)
                    }

                    vrApplicationInfoInstance.setNameOfForeigner(params.nameOfForeigner)
                    vrApplicationInfoInstance.setForeignerRefNo(params.foreignerRefNo)
                    vrApplicationInfoInstance.setNameOfForFamMember(params.nameOfForFamMember)
                    vrApplicationInfoInstance.setForeignerSummary(params.foreignerSummary)
                    vrApplicationInfoInstance.setRelation(params.relation)

                    String designationId = params.designation?.id
                    if (designationId != "" || designationId != null) {
                        def allDesignation = AllDesignation.findById(Long.valueOf(designationId))
                        vrApplicationInfoInstance.setDesignation(allDesignation)
                    }
                    String nationality = params.nationality?.id
                    if (nationality != "" || nationality != null) {
                        def allLookup = AllLookup.findById(Long.valueOf(nationality))
                        vrApplicationInfoInstance.setNationality(allLookup)
                    }


                    vrApplicationInfoInstance.setDateOfBirth(dateOfBirth)
                    vrApplicationInfoInstance.setPassportNo(params.passportNo)
                    vrApplicationInfoInstance.setPassportIssueDate(passportIssueDate)
                    vrApplicationInfoInstance.setPassportExpireDate(passportExpireDate)

                    String visaCategoryKeyword = params.visaCategory
                    if (visaCategoryKeyword != "") {
                        def allLookup = AllLookup.findByKeyword(visaCategoryKeyword)
                        vrApplicationInfoInstance.setVisaCategory(allLookup)
                    }

                    vrApplicationInfoInstance.setPurpose(params.purpose)

                    if (params?.actionType == 'submit') {

                        /*Start For Process Flow*/

                        vrApplicationInfoInstance.setPreviousStatus(vrApplicationInfoInstance?.currentStatus)
                        def applicationStatus = allLookupService.getLookupValueByKeyword("SUBMITTED")
                        vrApplicationInfoInstance.setCurrentStatus(applicationStatus)
                        def approvalProcess = approvalService.getApprovalProcessByKeyword("VISA_RECOMMANDATION")
                        def currentServeGroup = approvalService.getApprovalGroupByApprovalProcessAndKeyword(approvalProcess, "ENTERPRISE_MANAGER_CHECKER")
                        vrApplicationInfoInstance.setCurrentServeGroup(currentServeGroup)
                        def currentServeMember = allLookupService.getLookupValueByKeyword("ROLE_VR_CHECKER")
                        vrApplicationInfoInstance.setCurrentServeMember(currentServeMember)

                        /*End For Process Flow*/

                        vrApplicationInfoInstance.setSubmittedBy(currentUser)
                        vrApplicationInfoInstance.setSubmitDate(currentDate)

                    } else if (params?.actionType == 'draft') {

                        /*Start For Process Flow*/
                        vrApplicationInfoInstance.setPreviousStatus(vrApplicationInfoInstance?.currentStatus)
                        def applicationStatus = allLookupService.getLookupValueByKeyword("DRAFT")
                        vrApplicationInfoInstance.setCurrentStatus(applicationStatus)

                        List currentServeGroup = approvalService.getApprovalGroupListByUser(currentUser)
                        if (currentServeGroup.size() > 0) {
                            vrApplicationInfoInstance.setCurrentServeGroup(currentServeGroup.get(0))
                        }
                        vrApplicationInfoInstance.setCurrentServeMember(currentUser)

                        /*End For Process Flow*/

                    } else if (currentServerMemberRole.equals("ROLE_VR_CHECKER") && params?.actionType == 'back') {

                        /*Start For Process Flow*/

                        vrApplicationInfoInstance.setPreviousStatus(vrApplicationInfoInstance?.currentStatus)
                        def applicationStatus = allLookupService.getLookupValueByKeyword("SENT_BACK")
                        vrApplicationInfoInstance.setCurrentStatus(applicationStatus)
                        List currentServeGroupList = approvalService.getApprovalGroupListByUser(currentUser)
                        if (currentServeGroupList.size() > 0) {
                            currentServeGroup = currentServeGroupList.get(0)
                        }
                        currentServeGroup = approvalService.getPreviousGroup(currentServeGroup, "VISA_RECOMMANDATION")
                        vrApplicationInfoInstance.setCurrentServeGroup(currentServeGroup)
                        vrApplicationInfoInstance.setCurrentServeMember(vrApplicationInfoInstance?.createdBy)
                        vrApplicationInfoInstance.setRemarks(params.remarks)

                        /*End For Process Flow*/
                    }

                    //vrApplicationInfoInstance.setRemarks(params.remarks)

                    vrApplicationInfoInstance.setCreatedBy(currentUser)
                    vrApplicationInfoInstance.setCreatedDate(currentDate)

                    vrApplicationInfoInstance.setProcessedBy(currentUser)
                    vrApplicationInfoInstance.setProcessedDate(currentDate)

                    //generate EpRequiredDoc
                    if (!params?.ipRequiredDocExclude) {
                        int i = 0
                        while (params["vrRequiredDocument[" + i + "].typeId"] != null) {
                            def vrRequiredDocParams = params["vrRequiredDocument[" + i + "]"]
                            if (vrRequiredDocParams?.requiredDocId) {
                                def docTypeInstance = VrRequiredDocDtl.get(vrRequiredDocParams?.requiredDocId)
                                //def vrRequiredDocInstance = new VrRequiredDoc()
                                def vrRequiredDocInstance = vrRequiredDocParams?.id ? VrRequiredDoc.get(vrRequiredDocParams?.id) : new VrRequiredDoc()
                                def userGivenDocName = vrRequiredDocParams?.userGivenDocName
                                def uploadedFile = vrRequiredDocParams?.docName
                                def uploadedFileOld = vrRequiredDocParams?.docNameOld
                                def uploadedFileSizeOld = vrRequiredDocParams?.long("docSizeOld")
                                def fileName
                                def fileSize = 0L
                                if (!uploadedFile.empty) {
                                    fileName = uploadedFile.fileItem.fileName
                                    fileSize = uploadedFile.size
                                    def ext = fileName.substring(fileName.lastIndexOf(".") + 1)
                                    def prefix = System.currentTimeMillis().toString()
                                    // fileName = "tmp_doc_" + prefix + "_" + docTypeInstance?.docTypeName?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                                    fileName = docTypeInstance?.docTypeName?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                                    fileName = fileName.toLowerCase()
                                    //upload file
                                    def basePath = grailsApplication.parentContext.getResource("files").getFile().toString()
                                    def uploadDir = new File(basePath + File.separator + "tmp" + File.separator)
                                    if (!uploadDir.exists()) {
                                        uploadDir.mkdirs()
                                        uploadDir.setWritable(true)
                                    }
                                    uploadedFile.transferTo(new File(uploadDir, fileName))
                                } else if (uploadedFileOld != "") {
                                    fileName = uploadedFileOld
                                    fileSize = uploadedFileSizeOld
                                }
                                def docUrl = "empty"
                                vrRequiredDocInstance.setVrApplicationInfo(vrApplicationInfoInstance)
                                vrRequiredDocInstance.setDocType(docTypeInstance)
                                vrRequiredDocInstance.setUserGivenDocName(userGivenDocName)
                                vrRequiredDocInstance.setDocName(fileName)
                                vrRequiredDocInstance.setDocUrl(docUrl)
                                vrRequiredDocInstance.setDocSize(fileSize)
                                vrRequiredDocInstance.setCreatedDate(currentDate)
                                vrRequiredDocInstance.setCreatedBy(currentUser)
                                vrApplicationInfoInstance.addToVrRequiredDoc(vrRequiredDocInstance)
                            }
                            i++
                        }
                    }

                    vrApplicationInfoInstance.validate()
                    if (vrApplicationInfoInstance.hasErrors()) {
                        flash.error = "Something went wrong! Please check for the form errors and try again."
                        def userEnterprise = currentUser?.enterprise ? (CpEntrprsMst) currentUser?.enterprise : null
                        def designationList = utilityService.getAllActiveDesignationList()
                        def nationalityList = utilityService.getAllActiveNationalityList()
                        def visaCategoryList = utilityService.getAllActiveVisaCategoryList()
                        //def nameOfForeignerList = utilityService.getAllNameOfForeignerList()
                        def visaIssuedForeignerRefNoList = utilityService.getAllActiveVisaIssuedForeignerRefNoList()
                        def vrRequiredDocList = VrRequiredDoc.findAllByVrApplicationInfo(vrApplicationInfoInstance)
                        def requiredDocTypes
                        def docFor
                        requiredDocTypes = vrRequiredDocDtlService.getRequiredDocList(docFor)
                        render view: "edit", model:
                                [vrApplicationInfoInstance   : vrApplicationInfoInstance,
                                 userEnterprise              : userEnterprise,
                                 designationList             : designationList,
                                 nationalityList             : nationalityList,
                                 visaCategoryList            : visaCategoryList,
                                 requiredDocTypes            : requiredDocTypes,
                                 visaIssuedForeignerRefNoList: visaIssuedForeignerRefNoList,
                                 vrRequiredDocList           : vrRequiredDocList,
                                 currentServerMemberRole     : currentServerMemberRole]
                        return
                    }

                    if (vrApplicationInfoInstance.save(flush: true, deepValidate: true, failOnError: true)) {
                        // transfer uploaded file
                        def currentYearMonth = new SimpleDateFormat("yyMM").format(new Date())
                        //def filePrefix = utilityService.getCode("vrRequiredDoc", vrApplicationInfoInstance?.importZone?.code + "_" + currentYearMonth + "_", 4)
                        vrApplicationInfoInstance?.vrRequiredDoc?.each {
                            def ext = it.docName.substring(it.docName.lastIndexOf(".") + 1)
                            //  def fileName = filePrefix + "_" + it.docType.docTypeName?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                            def fileName = it.docType.docTypeName?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                            fileName = fileName.toLowerCase()
                            def basePath = grailsApplication.parentContext.getResource("files").getFile().toString()
                            //def destinationFile = new File(basePath + File.separator + "ip" + File.separator + vrApplicationInfoInstance?.importZone?.code?.toLowerCase() + File.separator + fileName)
                            def destinationFile = new File(basePath + File.separator + "ip" + File.separator + fileName)
                            def sourceFile = new File(basePath + File.separator + "tmp" + File.separator + it.docName)
                            utilityService.copyFile(sourceFile, destinationFile)
                            //def docUrl = grailsLinkGenerator.link(uri: "/files/ip/" + vrApplicationInfoInstance?.importZone?.code?.toLowerCase() + "/", absolute: false)
                            def docUrl = grailsLinkGenerator.link(uri: "/files/ip/", absolute: false)
                            it.setDocUrl(docUrl + fileName)
                            it.setDocName(fileName)
                            it.save(flush: true, failOnError: true)
                        }
                    }

                    flash.success = message(code: 'default.created.message', args: [message(code: 'vrApplicationInfo.label', default: 'Visa Application'), vrApplicationInfoInstance.id])
                    redirect(action: "show", id: vrApplicationInfoInstance.id)

                } catch (Exception e) {
                    println("Exception===============?" + e)
                    tStatus.setRollbackOnly()
                    flash.error = "Something went wrong! Please check for the form errors and try again."
                    def userEnterprise = currentUser?.enterprise ? (CpEntrprsMst) currentUser?.enterprise : null
                    def designationList = utilityService.getAllActiveDesignationList()
                    def nationalityList = utilityService.getAllActiveNationalityList()
                    def visaCategoryList = utilityService.getAllActiveVisaCategoryList()
                    //def nameOfForeignerList = utilityService.getAllNameOfForeignerList()
                    def visaIssuedForeignerRefNoList = utilityService.getAllActiveVisaIssuedForeignerRefNoList()
                    def vrRequiredDocList = []
                    def requiredDocTypes
                    def docFor
                    requiredDocTypes = vrRequiredDocDtlService.getRequiredDocList(docFor)
                    render view: "edit", model:
                            [vrApplicationInfoInstance   : vrApplicationInfoInstance,
                             userEnterprise              : userEnterprise,
                             designationList             : designationList,
                             nationalityList             : nationalityList,
                             visaCategoryList            : visaCategoryList,
                             requiredDocTypes            : requiredDocTypes,
                             visaIssuedForeignerRefNoList: visaIssuedForeignerRefNoList,
                             vrRequiredDocList           : vrRequiredDocList,
                             currentServerMemberRole     : currentServerMemberRole]
                    return
                }

            }
        }


        def userEnterprise = currentUser?.enterprise ? (CpEntrprsMst) currentUser?.enterprise : null
        def designationList = utilityService.getAllActiveDesignationList()
        def nationalityList = utilityService.getAllActiveNationalityList()
        def visaCategoryList = utilityService.getAllActiveVisaCategoryList()
        //def nameOfForeignerList = utilityService.getAllNameOfForeignerList()
        def visaIssuedForeignerRefNoList = utilityService.getAllActiveVisaIssuedForeignerRefNoList()
        def vrRequiredDocList = []

        def requiredDocTypes
        def docFor
        requiredDocTypes = vrRequiredDocDtlService.getRequiredDocList(docFor)
        render view: "edit", model:
                [vrApplicationInfoInstance   : vrApplicationInfoInstance,
                 userEnterprise              : userEnterprise,
                 designationList             : designationList,
                 nationalityList             : nationalityList,
                 visaCategoryList            : visaCategoryList,
                 requiredDocTypes            : requiredDocTypes,
                 visaIssuedForeignerRefNoList: visaIssuedForeignerRefNoList,
                 vrRequiredDocList           : vrRequiredDocList,
                 currentServerMemberRole     : currentServerMemberRole]
    }

    def show(VrApplicationInfo vrApplicationInfoInstance) {
        //respond vrApplicationInfoInstance
        def vrRequiredDocList = VrRequiredDoc.findAllByVrApplicationInfo(vrApplicationInfoInstance)
        [vrApplicationInfoInstance: vrApplicationInfoInstance, vrRequiredDocList: vrRequiredDocList]
    }

    def edit(VrApplicationInfo vrApplicationInfoInstance) {

        def currentUser = (User) springSecurityService?.currentUser
        def currentDate = new Date()
        Set<Role> currentServerMemberRoleList = currentUser.authorities
        String currentServerMemberRole
        if (currentServerMemberRoleList.size() > 0) {
            for (int i = 0; i < currentServerMemberRoleList.size(); i++) {
                if (currentServerMemberRoleList[i].authority == "ROLE_VR_MAKER") {
                    currentServerMemberRole = currentServerMemberRoleList[i].authority
                    break
                } else if (currentServerMemberRoleList[i].authority == "ROLE_VR_CHECKER") {
                    currentServerMemberRole = currentServerMemberRoleList[i].authority
                    break
                } else {
                    currentServerMemberRole = currentServerMemberRoleList[i].authority
                }
            }
        }

        println("currentServerMemberRole :" + currentServerMemberRole)

        if (vrApplicationInfoInstance == null) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }

        def currentUserGroup
        def sentToGroup
        def sentToMember
        def remarks
        def message

        if (request.method == 'POST') {
            VrApplicationInfo.withTransaction { TransactionStatus tStatus ->
                try {

                    bindData(vrApplicationInfoInstance, [exclude: ['dateOfBirth', 'passportIssueDate', 'passportExpireDate', 'visaCategory']])

                    SimpleDateFormat df = new SimpleDateFormat(dateFormat);
                    def dateOfBirth = params["dateOfBirth"] ? df.parse(params["dateOfBirth"]) : null
                    def passportIssueDate = params["passportIssueDate"] ? df.parse(params["passportIssueDate"]) : null
                    def passportExpireDate = params["passportExpireDate"] ? df.parse(params["passportExpireDate"]) : null

                    String enterpriseId = params.enterprise
                    if (enterpriseId != "") {
                        def cpEntrprsMst = CpEntrprsMst.findById(Long.valueOf(enterpriseId))
                        vrApplicationInfoInstance.setEnterprise(cpEntrprsMst)
                    }

                    vrApplicationInfoInstance.setNameOfForeigner(params.nameOfForeigner)
                    vrApplicationInfoInstance.setForeignerRefNo(params.foreignerRefNo)
                    vrApplicationInfoInstance.setNameOfForFamMember(params.nameOfForFamMember)
                    vrApplicationInfoInstance.setForeignerSummary(params.foreignerSummary)
                    vrApplicationInfoInstance.setRelation(params.relation)

                    String designationId = params.designation.id
                    if (designationId != "") {
                        def allDesignation = AllDesignation.findById(Long.valueOf(designationId))
                        vrApplicationInfoInstance.setDesignation(allDesignation)
                    }
                    String nationality = params.nationality.id
                    if (nationality != "") {
                        def allLookup = AllLookup.findById(Long.valueOf(nationality))
                        vrApplicationInfoInstance.setNationality(allLookup)
                    }


                    vrApplicationInfoInstance.setDateOfBirth(dateOfBirth)
                    vrApplicationInfoInstance.setPassportNo(params.passportNo)
                    vrApplicationInfoInstance.setPassportIssueDate(passportIssueDate)
                    vrApplicationInfoInstance.setPassportExpireDate(passportExpireDate)

                    String visaCategoryKeyword = params.visaCategory
                    if (visaCategoryKeyword != "") {
                        def allLookup = AllLookup.findByKeyword(visaCategoryKeyword)
                        vrApplicationInfoInstance.setVisaCategory(allLookup)
                    }

                    vrApplicationInfoInstance.setPurpose(params.purpose)

                    List currentServeGroupList = approvalService.getApprovalGroupListByUser(currentUser)
                    if (currentServeGroupList.size() > 0) {
                        currentUserGroup = currentServeGroupList.get(0)
                    }

                    if (params?.actionType == 'submit') {

                        /*Start For Process Flow*/

                        vrApplicationInfoInstance.setPreviousStatus(vrApplicationInfoInstance?.currentStatus)
                        def applicationStatus = allLookupService.getLookupValueByKeyword("SUBMITTED")
                        vrApplicationInfoInstance.setCurrentStatus(applicationStatus)
                        def approvalProcess = approvalService.getApprovalProcessByKeyword("VISA_RECOMMANDATION")

                        if (currentServerMemberRole.equals("ROLE_VR_MAKER")) {
                            sentToGroup = approvalService.getApprovalGroupByApprovalProcessAndKeyword(approvalProcess, "ENTERPRISE_MANAGER_CHECKER")
                            sentToMember = allLookupService.getLookupValueByKeyword("ROLE_VR_CHECKER")
                        } else {
                            sentToGroup = approvalService.getApprovalGroupByApprovalProcessAndKeyword(approvalProcess, "ASSISTANT_MANAGER_CONCERN_ZONE")
                            sentToMember = allLookupService.getLookupValueByKeyword("ROLE_VR_AM")
                        }
                        vrApplicationInfoInstance.setCurrentServeGroup(sentToGroup)
                        vrApplicationInfoInstance.setCurrentServeMember(sentToMember)

                        /*End For Process Flow*/

                        if (vrApplicationInfoInstance?.currentStatus?.keyword == 'SENT_BACK') {
                            vrApplicationInfoInstance.setRemarks(params.remarks)
                        } else {
                            vrApplicationInfoInstance.setSubmittedBy(currentUser)
                            vrApplicationInfoInstance.setSubmitDate(currentDate)
                        }

                        message="Application Data Successfully Submitted"

                    } else if (params?.actionType == 'draft') {

                        /*Start For Process Flow*/
                        vrApplicationInfoInstance.setPreviousStatus(vrApplicationInfoInstance?.currentStatus)
                        def applicationStatus = allLookupService.getLookupValueByKeyword("DRAFT")
                        vrApplicationInfoInstance.setCurrentStatus(applicationStatus)

                        vrApplicationInfoInstance.setCurrentServeGroup(currentUserGroup)
                        vrApplicationInfoInstance.setCurrentServeMember(currentUser)

                        /*End For Process Flow*/
                        message="Application Data Successfully Saved As A Draft."

                    } else if (currentServerMemberRole.equals("ROLE_VR_CHECKER") && params?.actionType == 'back') {

                        /*Start For Process Flow*/

                        vrApplicationInfoInstance.setPreviousStatus(vrApplicationInfoInstance?.currentStatus)
                        def applicationStatus = allLookupService.getLookupValueByKeyword("SENT_BACK")
                        vrApplicationInfoInstance.setCurrentStatus(applicationStatus)
                        sentToGroup = approvalService.getPreviousGroup(currentUserGroup, "VISA_RECOMMANDATION")
                        vrApplicationInfoInstance.setCurrentServeGroup(sentToGroup)
                        sentToMember = vrApplicationInfoInstance?.createdBy
                        vrApplicationInfoInstance.setCurrentServeMember(sentToMember)
                        vrApplicationInfoInstance.setRemarks(params.remarks)
                        remarks = params.remarks
                        /*End For Process Flow*/

                        message="Application Data Sent Back Successfully."
                    }

                    vrApplicationInfoInstance.setModifiedBy(currentUser)
                    vrApplicationInfoInstance.setModifiedDate(currentDate)

                    vrApplicationInfoInstance.setProcessedBy(currentUser)
                    vrApplicationInfoInstance.setProcessedDate(currentDate)

                    //generate EpRequiredDoc
                    // if (!params?.ipRequiredDocExclude) {
                    if (0 == 0) {
                        int i = 0
                        while (params["vrRequiredDocument[" + i + "].typeId"] != null) {
                            def vrRequiredDocParams = params["vrRequiredDocument[" + i + "]"]
                            if (vrRequiredDocParams?.requiredDocId) {
                                def docTypeInstance = VrRequiredDocDtl.get(vrRequiredDocParams?.requiredDocId)
                                //def vrRequiredDocInstance = new VrRequiredDoc()
                                def vrRequiredDocInstance = vrRequiredDocParams?.id ? VrRequiredDoc.get(vrRequiredDocParams?.id) : new VrRequiredDoc()
                                def userGivenDocName = vrRequiredDocParams?.userGivenDocName
                                def uploadedFile = vrRequiredDocParams?.docName
                                def uploadedFileOld = vrRequiredDocParams?.docNameOld
                                def uploadedFileSizeOld = vrRequiredDocParams?.long("docSizeOld")
                                def fileName
                                def fileSize = 0L
                                if (!uploadedFile.empty) {
                                    fileName = uploadedFile.fileItem.fileName
                                    fileSize = uploadedFile.size
                                    def ext = fileName.substring(fileName.lastIndexOf(".") + 1)
                                    def prefix = System.currentTimeMillis().toString()
                                    // fileName = "tmp_doc_" + prefix + "_" + docTypeInstance?.docTypeName?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                                    fileName = docTypeInstance?.docTypeName?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                                    fileName = fileName.toLowerCase()
                                    //upload file
                                    def basePath = grailsApplication.parentContext.getResource("files").getFile().toString()
                                    def uploadDir = new File(basePath + File.separator + "tmp" + File.separator)
                                    if (!uploadDir.exists()) {
                                        uploadDir.mkdirs()
                                        uploadDir.setWritable(true)
                                    }
                                    uploadedFile.transferTo(new File(uploadDir, fileName))
                                } else if (uploadedFileOld != "") {
                                    fileName = uploadedFileOld
                                    fileSize = uploadedFileSizeOld
                                }
                                def docUrl = "empty"
                                vrRequiredDocInstance.setVrApplicationInfo(vrApplicationInfoInstance)
                                vrRequiredDocInstance.setDocType(docTypeInstance)
                                vrRequiredDocInstance.setUserGivenDocName(userGivenDocName)
                                vrRequiredDocInstance.setDocName(fileName)
                                vrRequiredDocInstance.setDocUrl(docUrl)
                                vrRequiredDocInstance.setDocSize(fileSize)
                                vrRequiredDocInstance.setCreatedDate(currentDate)
                                vrRequiredDocInstance.setCreatedBy(currentUser)
                                vrApplicationInfoInstance.addToVrRequiredDoc(vrRequiredDocInstance)
                            }
                            i++
                        }
                    }


                    if (vrApplicationInfoInstance.save(flush: true, deepValidate: true, failOnError: true)) {
                        // transfer uploaded file
                        def currentYearMonth = new SimpleDateFormat("yyMM").format(new Date())
                        //def filePrefix = utilityService.getCode("vrRequiredDoc", vrApplicationInfoInstance?.importZone?.code + "_" + currentYearMonth + "_", 4)
                        vrApplicationInfoInstance?.vrRequiredDoc?.each {
                            def ext = it.docName.substring(it.docName.lastIndexOf(".") + 1)
                            //  def fileName = filePrefix + "_" + it.docType.docTypeName?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                            def fileName = it.docType.docTypeName?.replaceAll("[^a-zA-Z0-9]", "_") + "." + ext
                            fileName = fileName.toLowerCase()
                            def basePath = grailsApplication.parentContext.getResource("files").getFile().toString()
                            //def destinationFile = new File(basePath + File.separator + "ip" + File.separator + vrApplicationInfoInstance?.importZone?.code?.toLowerCase() + File.separator + fileName)
                            def destinationFile = new File(basePath + File.separator + "ip" + File.separator + fileName)
                            def sourceFile = new File(basePath + File.separator + "tmp" + File.separator + it.docName)
                            utilityService.copyFile(sourceFile, destinationFile)
                            //def docUrl = grailsLinkGenerator.link(uri: "/files/ip/" + vrApplicationInfoInstance?.importZone?.code?.toLowerCase() + "/", absolute: false)
                            def docUrl = grailsLinkGenerator.link(uri: "/files/ip/", absolute: false)
                            it.setDocUrl(docUrl + fileName)
                            it.setDocName(fileName)
                            it.save(flush: true, failOnError: true)
                        }
                        if (params?.actionType == 'submit' && currentServerMemberRole.equals("ROLE_VR_CHECKER")) {
                            Map inputParams = [
                                    approvalGroup      : currentUserGroup,
                                    approvalGroupMember: currentUser,
                                    approvalStatus     : vrApplicationInfoInstance.currentStatus,
                                    actionDate         : currentDate,
                                    remarks            : remarks,
                                    sentToGroup        : sentToGroup,
                                    sentToMember       : sentToMember
                            ]
                            approvalService.addApprovalToHistory('com.bepza.vr.VrApplicationInfoApprovalHistory', vrApplicationInfoInstance, inputParams)
                        }
                    }

                    flash.success = message
                    //flash.success = message(code: 'default.created.message', args: [message(code: 'vrApplicationInfo.label', default: 'Visa Application'), vrApplicationInfoInstance.id])
                    redirect(action: "show", id: vrApplicationInfoInstance.id)

                } catch (Exception e) {
                    println("Exception===============?" + e)
                    tStatus.setRollbackOnly()
                    flash.error = "Something went wrong! Please check for the form errors and try again."
                    def userEnterprise = currentUser?.enterprise ? (CpEntrprsMst) currentUser?.enterprise : null
                    def designationList = utilityService.getAllActiveDesignationList()
                    def nationalityList = utilityService.getAllActiveNationalityList()
                    def visaCategoryList = utilityService.getAllActiveVisaCategoryList()
                    //def nameOfForeignerList = utilityService.getAllNameOfForeignerList()
                    def visaIssuedForeignerRefNoList = utilityService.getAllActiveVisaIssuedForeignerRefNoList()
                    def vrRequiredDocList = VrRequiredDoc.findAllByVrApplicationInfo(vrApplicationInfoInstance)
                    def requiredDocTypes
                    def docFor
                    requiredDocTypes = vrRequiredDocDtlService.getRequiredDocList(docFor)
                    render view: "edit", model:
                            [vrApplicationInfoInstance   : vrApplicationInfoInstance,
                             userEnterprise              : userEnterprise,
                             designationList             : designationList,
                             nationalityList             : nationalityList,
                             visaCategoryList            : visaCategoryList,
                             requiredDocTypes            : requiredDocTypes,
                             visaIssuedForeignerRefNoList: visaIssuedForeignerRefNoList,
                             vrRequiredDocList           : vrRequiredDocList,
                             currentServerMemberRole     : currentServerMemberRole]
                    return
                }

            }
        }
        def userEnterprise = currentUser?.enterprise ? (CpEntrprsMst) currentUser?.enterprise : null
        def designationList = utilityService.getAllActiveDesignationList()
        def nationalityList = utilityService.getAllActiveNationalityList()
        def visaCategoryList = utilityService.getAllActiveVisaCategoryList()
        //def nameOfForeignerList = utilityService.getAllNameOfForeignerList()
        def visaIssuedForeignerRefNoList = utilityService.getAllActiveVisaIssuedForeignerRefNoList()
        def vrRequiredDocList = VrRequiredDoc.findAllByVrApplicationInfo(vrApplicationInfoInstance)
        def requiredDocTypes
        def docFor
        requiredDocTypes = vrRequiredDocDtlService.getRequiredDocList(docFor)
        render view: "edit", model:
                [vrApplicationInfoInstance   : vrApplicationInfoInstance,
                 userEnterprise              : userEnterprise,
                 designationList             : designationList,
                 nationalityList             : nationalityList,
                 visaCategoryList            : visaCategoryList,
                 requiredDocTypes            : requiredDocTypes,
                 visaIssuedForeignerRefNoList: visaIssuedForeignerRefNoList,
                 vrRequiredDocList           : vrRequiredDocList,
                 currentServerMemberRole     : currentServerMemberRole]

    }

    def processingList(Integer max) {
        params.max = Math.min(max ?: 10, 10000)
        def currentUser = (User) springSecurityService?.currentUser

        def result = vrApplicationInfoService.getPendingListForProcess(params)
        def totalCount = result.totalCount

        def enterpriseList = utilityService.getAllActiveEnterpriseList()

        [vrApplicationInfoInstanceList: result, vrApplicationInfoInstanceTotal: totalCount, enterpriseList: enterpriseList]
    }

    def processingListBK(Integer max) {
        params.max = Math.min(max ?: 10, 10000)
        def currentUser = (User) springSecurityService?.currentUser
        def approvalGroupInstanceList = approvalService.getApprovalGroupListByUser(currentUser)
        if (approvalGroupInstanceList.size() == 0) {
            flash.error = 'Role not defined to perform that operation!'
            redirect(uri: "/")
            return
        }

        def result = vrApplicationInfoService.getPendingListForProcess(params)
        def totalCount = result.totalCount

        def enterpriseList = utilityService.getAllActiveEnterpriseList()

        [vrApplicationInfoInstanceList: result, vrApplicationInfoInstanceTotal: totalCount, enterpriseList: enterpriseList]
    }
    //VrApplicationInfo vrApplicationInfoInstance
    def openProcessingForm(VrApplicationInfo vrApplicationInfoInstance) {
        if (vrApplicationInfoInstance == null) {
            flash.error = 'Record not found!'
            redirect(action: "processingList")
            return
        }

        def currentUser = (User) springSecurityService?.currentUser
        def currentServeGroup = vrApplicationInfoInstance.currentServeGroup
        def currentServeMember = vrApplicationInfoInstance.currentServeMember
        def userEnterprise = currentUser?.enterprise ? (CpEntrprsMst) currentUser?.enterprise : null
        def vrRequiredDocList = VrRequiredDoc.findAllByVrApplicationInfo(vrApplicationInfoInstance)

        if (!approvalService.isPermitted(currentServeGroup, currentServeMember, currentUser)) {
            flash.error = 'You are not authorized to perform that operation!'
            redirect(action: "processingList")
            return
        }
        print("keyword :" + vrApplicationInfoInstance?.currentStatus?.keyword)
        print("member id " + vrApplicationInfoInstance?.currentServeMember?.id)
        print("Group id " + vrApplicationInfoInstance?.currentServeGroup?.id)
        List submitToGroupList = []

        def nextServeGroup = params?.submitToGroupId ? approvalService.getApprovalGroupById(params?.long("submitToGroupId")) : vrApplicationInfoInstance?.currentStatus?.keyword == 'DELEGATE' ? vrApplicationInfoInstance?.currentServeGroup : null
        def submitToMemberList = approvalService.getGroupMemberList(nextServeGroup)
        def applyStatusList = approvalService.getApprovalStatusListByGroup(currentServeGroup)
        def regretReasonList = allLookupService.getLookupListByParent("REGRET_REASON")
        def approvalHistoryList = approvalService.getApprovalHistoryList("com.bepza.vr.VrApplicationInfoApprovalHistory", vrApplicationInfoInstance)
        //  def approvalHistoryList = []

        render(view: "processingForm", model:
                [
                        vrApplicationInfoInstance: vrApplicationInfoInstance,
                        userEnterprise           : userEnterprise,
                        applyStatusList          : applyStatusList,
                        submitToGroupList        : submitToGroupList,
                        submitToMemberList       : submitToMemberList,
                        regretReasonList         : regretReasonList,
                        approvalHistoryList      : approvalHistoryList,
                        actionName               : actionName,
                        vrRequiredDocList        : vrRequiredDocList
                ])
    }

    def process(VrApplicationInfo vrApplicationInfoInstance) {
        if (vrApplicationInfoInstance == null) {
            flash.error = 'Record not found!'
            redirect(action: "processingList")
            return
        }
        def allotmentDtlId
        def currentUser = (User) springSecurityService?.currentUser
        def currentServeGroup = vrApplicationInfoInstance.currentServeGroup
        def currentServeMember = vrApplicationInfoInstance.currentServeMember
        if (!approvalService.isPermitted(currentServeGroup, currentServeMember, currentUser)) {
            flash.error = 'You are not authorized to perform that operation!'
            redirect(action: "openProcessingForm", id: vrApplicationInfoInstance?.id)
            return
        }
        if (request.method == 'POST') {
            VrApplicationInfo.withTransaction { TransactionStatus status ->
                try {
                    def currentDate = new Date()
                    def approvalStatus = allLookupService.getLookupByParentAndKeyword('APPROVAL_STATUS', params.statusKey)
                    if (!approvalStatus) {
                        flash.error = "Apply Status must be selected!"
                        redirect(action: "openProcessingForm", id: vrApplicationInfoInstance?.id)
                    }
                    def approvalSubmitToGroupInstance = params.long("submitToGroupId") ? approvalService.getApprovalGroupById(params.long("submitToGroupId")) : approvalService.getNextGroup(currentServeGroup)
                    def approvalSubmitToGroupMemberInstance = params.long("submitToMemberId") ? approvalService.getApprovalGroupMemberById(params.long("submitToMemberId")) : null
                    def remarks = params?.remarks
                    vrApplicationInfoInstance.setPreviousStatus(vrApplicationInfoInstance?.currentStatus)
                    vrApplicationInfoInstance.setCurrentStatus(approvalStatus)

                    def sendMail = false
                    def mailSubject = ''
                    def mailBody = ''

                    //Only Executive chairman forward the project proposal to Asst. Manager
                    if (approvalStatus?.keyword == 'CHECKED_VERIFIED') {
                        //Assistant Manager Concern Zone=>Manager/DGM Concern Zone=>

                        //Step1: get which process is going on
                        //Step2: get which Group will be Assigned for the process and Assigned that group
                        //Step3: Assigned a member of that group for the process

                        //Step1
                        def approvableDoc = approvalService.getApprovalProcessByKeyword("VISA_RECOMMANDATION")
                        //Step2
                        approvalSubmitToGroupInstance = approvalService.getApprovalGroupByApprovalProcessAndKeyword(approvableDoc, approvalSubmitToGroupInstance?.keyword)
                        vrApplicationInfoInstance.setCurrentServeGroup(approvalSubmitToGroupInstance)
                        //Step3
                        vrApplicationInfoInstance.setCurrentServeMember(approvalSubmitToGroupMemberInstance)

                    } else if (approvalStatus?.keyword == 'RECOMMENDATION') {//GM Concern Zone will do it

                        //Step1: get which process is going on
                        //Step2: get which Group will be Assigned for the process and Assigned that group
                        //Step3: Assigned a member of that group for the process

                        //Step1
                        def approvableDoc = approvalService.getApprovalProcessByKeyword("VISA_RECOMMANDATION")
                        //Step2
                        approvalSubmitToGroupInstance = approvalService.getApprovalGroupByApprovalProcessAndKeyword(approvableDoc, approvalSubmitToGroupInstance?.keyword)
                        vrApplicationInfoInstance.setCurrentServeGroup(approvalSubmitToGroupInstance)
                        //Step3
                        vrApplicationInfoInstance.setCurrentServeMember(approvalSubmitToGroupMemberInstance)

                    } else if (approvalStatus?.keyword == 'MARK_TO_PROCESS') {//Member-IP will do it..

                        //Step1: get which process is going on
                        //Step2: get which Group will be Assigned for the process and Assigned that group
                        //Step3: Assigned a member of that group for the process

                        //Step1
                        def approvableDoc = approvalService.getApprovalProcessByKeyword("VISA_RECOMMANDATION")
                        //Step2
                        approvalSubmitToGroupInstance = approvalService.getApprovalGroupByApprovalProcessAndKeyword(approvableDoc, approvalSubmitToGroupInstance?.keyword)
                        vrApplicationInfoInstance.setCurrentServeGroup(approvalSubmitToGroupInstance)
                        //Step3
                        vrApplicationInfoInstance.setCurrentServeMember(approvalSubmitToGroupMemberInstance)

                    } else if (approvalStatus?.keyword == 'ISSUED') {//GM-ES will do it...

                        //Step1: get which process is going on
                        //Step2: get which Group will be Assigned for the process and Assigned that group
                        //Step3: Assigned a member of that group for the process
                        int mailSent = issueAllotmentLetter(vrApplicationInfoInstance)
                        if (mailSent > 0) {
                            //Step1
                            def approvableDoc = approvalService.getApprovalProcessByKeyword("VISA_RECOMMANDATION")
                            //Step2
                            approvalSubmitToGroupInstance = approvalService.getApprovalGroupByApprovalProcessAndKeyword(approvableDoc, approvalSubmitToGroupInstance?.keyword)
                            vrApplicationInfoInstance.setCurrentServeGroup(approvalSubmitToGroupInstance)
                            //Step3
                            vrApplicationInfoInstance.setCurrentServeMember(approvalSubmitToGroupMemberInstance)
                        }


                    } else if (approvalStatus?.keyword == 'REGRET_PRV_BK') { // REGRET

                        //Step1: get which process is going on
                        //Step2: Here No group will be assigned so it go directly  "ENTERPRISE_OPERATOR_MAKER"
                        //Step3: No member of that group will be Assigned for the process so it will be null

                        def approvableDoc = approvalService.getApprovalProcessByKeyword("VISA_RECOMMANDATION")
                        //Step1
                        approvalSubmitToGroupInstance = approvalService.getApprovalGroupByApprovalProcessAndKeyword(approvableDoc, approvalSubmitToGroupInstance?.keyword)
                        //Step2
                        vrApplicationInfoInstance.setCurrentServeGroup(approvalSubmitToGroupInstance)
                        //Step3
                        vrApplicationInfoInstance.setCurrentServeMember(approvalSubmitToGroupMemberInstance)

                    } else if (approvalStatus?.keyword == 'REGRET') { // REGRET
                        def regretReason = params?.getList("regretReasonKey")
                        if (!regretReason) {
                            flash.error = "Please select a reason for regretting!"
                            return
                        }
                        remarks = ''
                        regretReason.each {
                            def reason = allLookupService.getLookupByParentAndKeyword('REGRET_REASON', it)
                            remarks = remarks + reason?.title + ",\r\n"
                        }
                        remarks = remarks.length() > 3 ? remarks.substring(0, remarks.length() - 3) : remarks
                        remarks = params?.otherReason ? remarks + ",\r\n" + params?.otherReason : remarks

                        //Step1
                        def approvableDoc = approvalService.getApprovalProcessByKeyword("VISA_RECOMMANDATION")
                        //Step2
                        approvalSubmitToGroupInstance = approvalService.getApprovalGroupByApprovalProcessAndKeyword(approvableDoc,"ENTERPRISE_OPERATOR_MAKER")
                        vrApplicationInfoInstance.setCurrentServeGroup(approvalSubmitToGroupInstance)
                        //Step3
                        vrApplicationInfoInstance.setCurrentServeMember(vrApplicationInfoInstance?.createdBy)
                        vrApplicationInfoInstance.setRemarks(remarks)

                        // mail notification
                        /*sendMail = true
                        mailSubject += 'LP application:' + vrApplicationInfoInstance?.code + ' has been regretted.'
                        mailBody += 'Dear ' + vrApplicationInfoInstance?.nameOfForeigner + ',\n' +
                                'Your submitted LP application:' + vrApplicationInfoInstance?.code + ' has been regretted.\n' +
                                'Here is the comment from regretting officer:\n' + remarks + '\n\n' +
                                '--\n' +
                                'Regards\n' +
                                'BEPZA\n' +
                                '\n' +
                                'N.B: This is an auto generated email. Please do not reply.'*/
                        // mail notification
                    } else {// CHECKED_VERIFIED

                        /*def cpEntrprsAllotmentDtl = CpEntrprsAllotmentDtl.findByVrApplicationInfoIdAndIsProcessing(vrApplicationInfoInstance, true)

                        if (cpEntrprsAllotmentDtl == null) {
                            cpEntrprsAllotmentDtl = new CpEntrprsAllotmentDtl()
                            cpEntrprsAllotmentDtl.allotmentCode = "first_time_code"
                            cpEntrprsAllotmentDtl.isProcessing = true
                            // this will be updated at the time of approval
                            cpEntrprsAllotmentDtl.vrApplicationInfoId = vrApplicationInfoInstance

                            if (cpEntrprsAllotmentDtl.save(flush: true, failOnError: true)) {
                                println("allotment detail save successful")
                            } else {
                                flash.error = "allotment detail save error"
                                redirect(action: "openProcessingForm", id: vrApplicationInfoInstance?.id)
                                return
                            }
                        } else {

                        }
*/

                        vrApplicationInfoInstance.setCurrentServeGroup(approvalSubmitToGroupInstance)
                        vrApplicationInfoInstance.setCurrentServeMember(approvalSubmitToGroupMemberInstance)

                        /*---------Start-----------*/

                        /*---------End------------*/
                    }

                    vrApplicationInfoInstance.setModifiedDate(currentDate)
                    vrApplicationInfoInstance.setModifiedBy(currentUser)

                    vrApplicationInfoInstance.setProcessedBy(currentUser)
                    vrApplicationInfoInstance.setProcessedDate(currentDate)

                    if (vrApplicationInfoInstance.save(flush: true, failOnError: true)) {
                        Map inputParams = [
                                approvalGroup      : currentServeGroup,
                                approvalGroupMember: currentUser,
                                approvalStatus     : vrApplicationInfoInstance.currentStatus,
                                actionDate         : currentDate,
                                remarks            : remarks,
                                sentToGroup        : approvalSubmitToGroupInstance,
                                sentToMember       : approvalSubmitToGroupMemberInstance
                        ]
                        approvalService.addApprovalToHistory('com.bepza.vr.VrApplicationInfoApprovalHistory', vrApplicationInfoInstance, inputParams)
                    }
                    String applicationID = vrApplicationInfoInstance?.code == "" ? vrApplicationInfoInstance?.code : vrApplicationInfoInstance?.code
                    flash.success = 'Application ID: "' + applicationID + '" was processed successfully with status "' + vrApplicationInfoInstance?.currentStatus + '"'

                    redirect(action: "processingList")
                    return

                } catch (SQLException exp) {
//                    status.setRollbackOnly()
                    flash.error = "Something went wrong! Please check for the form errors and try again. " + exp.message
                    redirect(action: "openProcessingForm", id: vrApplicationInfoInstance?.id)
                    return
                } catch (Exception exp) {
//                    status.setRollbackOnly()
                    flash.error = "Something went wrong! Please check for the form errors and try again. " + exp.message
                    redirect(action: "openProcessingForm", id: vrApplicationInfoInstance?.id)
                    return
                }
            }
        }
    }

    public int issueAllotmentLetter(VrApplicationInfo vrApplicationInfoInstance) {
        int mailSent = 1;
        /*CpEntrprsAllotmentDtl cpEntrprsAllotmentDtl = CpEntrprsAllotmentDtl.findByVrApplicationInfoIdAndIsProcessing(vrApplicationInfoInstance, true)
        cpEntrprsAllotmentDtl.allotmentCode = cpEntrprsMstService.generateAllotmentCode()
        cpEntrprsAllotmentDtl.allotmentDate = new Date()
        cpEntrprsAllotmentDtl.isProcessing = false
        cpEntrprsAllotmentDtl.allottedBy = springSecurityService?.currentUser

        if (cpEntrprsAllotmentDtl.save(flush: true, deepValidate: true, failOnError: true)) {

        }//end of if (vrApplicationInfoInstance.save(flush: true, deepValidate: true, failOnError: true))
        else {
            flash.error = "Allotment Detail save error"
            redirect(action: "openAllotmentLetterProcessingForm", vrApplicationInfoInstance?.id)
            return
        }*/

        Map reportParams = new LinkedHashMap()

        def reportDirectory = servletContext.getRealPath('/reports') + File.separator
        println("reprot dier: " + reportDirectory)

        reportParams.put("REPORT_DIR", reportDirectory)
        reportParams.put("SUBREPORT_DIR", reportDirectory)
        /*reportParams.put("P_CP_ENTRPRS_MST_ID", vrApplicationInfoInstance?.id)
        reportParams.put("P_CP_ALLOTMENT_CODE", cpEntrprsAllotmentDtl.allotmentCode)*/

        String pdfFileName = utilityService.generateFileName("Visa_Application-", "-Letter") + ".pdf"
        String mailFilesPath = reportDirectory + "vr" + File.separator + pdfFileName
        println("mailFilesPath: " + mailFilesPath)
        //String mailFilesPath = "D:"+File.separator+"BEPZA"+File.separator+"reports"+File.separator+"cp"+File.separator+"ms"

        def reportDef = new JasperReportDef(name: "TEST_REPORT_FOR_MAIL.jasper", folder: reportDirectory, parameters: reportParams, fileFormat: JasperExportFormat.PDF_FORMAT);
        response.setContentType("application/pdf");
        response.setHeader('Content-disposition', 'attachment; filename="' + pdfFileName);

        def reportByteArray = jasperService.generateReport(reportDef).toByteArray()
        OutputStream out = new FileOutputStream(mailFilesPath);
        out.write(reportByteArray);
        out.close();

        //

        // MAIL ALLOTMENT LETTER TO INVESTOR
        IMessageSender iMessageSender = new EmailProcessor()

        List<String> listAttach = new ArrayList<String>()
        listAttach.add(mailFilesPath)

        try {
            String msgSug = "This mail is for your allotment letter"
            String msgBody = "Your allotment code is " + vrApplicationInfoInstance.code + "\n" +
                    "Please find the attachment"

            iMessageSender.sendMessage(msgSug, msgBody, "maruf.rashid.du@gmail.com", "msaifubd@gmail.com", "", true, listAttach)

            mailSent = 1
        } catch (Exception ex) {
            mailSent = 0
            println("error: Sending mail to investor. Email Address: " + "maruf.rashid.du@gmail.com")
            println("error:  " + ex.message)
            flash.error = "Something went wrong! Please check for the form errors and try again. " + ex.message
        }
        //
        /*flash.success = 'Allotment Code: "' + vrApplicationInfoInstance.code + '" was processed successfully'
        redirect(action: "allotmentLetterList")
        return*/
        return mailSent;
    }

    def getForeignerDtl() {      //made by Maruf
        def data = "" + "@MARUF@" + ""
        def result = vrApplicationInfoService.getForeignerDtlByCode(params.foreignerRefNo)
        if (result != "") {
            data = result
        }
        render new WSReturn(100, data, null) as JSON
    }


    @Transactional
    def delete(VrApplicationInfo vrApplicationInfoInstance) {

        if (vrApplicationInfoInstance == null) {
            notFound()
            return
        }

        vrApplicationInfoInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VrApplicationInfo.label', default: 'VrApplicationInfo'), vrApplicationInfoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: HttpStatus.NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vrApplicationInfo.label', default: 'VrApplicationInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: HttpStatus.NOT_FOUND }
        }
    }
}
