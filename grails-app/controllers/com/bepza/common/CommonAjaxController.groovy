package com.bepza.common

import com.bepza.auth.User

class CommonAjaxController {

    def utilityService
    def dateFormat
    def dataSource
    def springSecurityService

    def beforeInterceptor = {
        if (!request.xhr) {
            render view: "error"
        }
        dateFormat = grailsApplication.config.grails.date.format
    }


    def allLookUpParentList() {
//        if (request.xhr) {
        def selectedParentID = AllLookup.get(params.parentId)
        def lookupList = AllLookup.findAllByIsActiveAndParent('true', selectedParentID);
        def sb = new StringBuilder()
        def tHead = ""
        def tBody = ""
        def tfooter = ""
        tHead = "<table class= 'table table-hover'>" +
//                    "<thead style='background-color: #1295bf'>" +
                "<thead style='background-color: #d6e9c6'>" +
                "<tr>" +
                "<th>Key Word</th>" +
                "<th>Title</th>" +
                "<th>Is Active</th>" +
                "<th>Sort Order</th>" +
                "</tr>" +
                "<thead>" +
                "<tbody>"

        for (int i = 0; i < lookupList.size(); i++) {
            tBody +=
                    "<tr>" +
                            "<td>" +
                            lookupList[i].keyword +
                            "</td>" +
                            "<td>" +
                            lookupList[i].title +
                            "</td>" +
                            "<td>" +
                            lookupList[i].isActive +
                            "</td>" +
                            "<td>" +
                            lookupList[i].sortBy +
                            "</td>" +
                            "</tr>"
        }

        tfooter = " </tbody>" +
                "</table>"

        sb.append(tHead + tBody + tfooter)
        render sb.toString()
    }
//    }

    //ApprovalGmToEg & ApprovalGroupMember (form)
    def getApprovalGroupList() {
        def approvableDocId = ApprovalProcess.get(params.appDocId)
        def sb = new StringBuilder()
        sb.append("<option value = ''>--Select One--</>")
        def approvalGroupLIst = ApprovalGroup.findAllByApprovalProcess(approvableDocId)
        approvalGroupLIst.each {
            sb.append('<option value="' + it.id + '">' + it.groupName + '</option>')
        }
        sb.append(approvalGroupLIst)
        render sb.toString();
    }

    def getGroupMemberList() {
        def approvableGroupId = ApprovalGroup.get(params.appGroupId)

        def sb = new StringBuilder()
        sb.append("<option value=''>Select One</option>")
        def approvalMemberLIst = ApprovalGroupMember.findAllByApprovalGroup(approvableGroupId)
        approvalMemberLIst.each {
            sb.append("<option value ='" + it.id + "'>" + it.groupMember?.fullName + "</option>")
        }
        sb.append(approvalMemberLIst)
        render sb.toString();
    }

    def loadApprovalMembers() {

        def approvalGroupInstance = params?.groupId ? ApprovalGroup.get(params?.groupId) : null
        def username = (params.userName + "").trim()
        def zoneInstance = params.zoneId ? CpZone.get(params.zoneId) : null
        def enterpriseInstance = params.enterpriseId ? CpEntrprsMst.get(params.enterpriseId) : null

        def groupMemberList = User.createCriteria() list {
            if (username) {
                eq("username", username)
            }
            if (zoneInstance) {
                eq("zone", zoneInstance)
            }
            if (enterpriseInstance) {
                eq("enterprise", enterpriseInstance)
            }
            order("id", "asc")
            order("fullName", "asc")
        }


        def existingMemberList = approvalGroupInstance?.approvalGroupMember ? approvalGroupInstance?.approvalGroupMember*.groupMember : []
        Iterator<User> member = groupMemberList.iterator()
        while (member.hasNext()) {
            def user = member.next()
            if (existingMemberList.contains(user)) {
                member.remove()
            }
        }
        def sb = new StringBuilder()
        def tHead = ""
        def tBody = ""
        def tFooter = ""
        for (int i = 0; i < groupMemberList.size(); i++) {
            tBody +=
                    "<tr>" +
                            "<td>" +
                            "<input type='checkBox' name=\"ApprovalGroupMemberId\" class=\"checkbox1\" id=\"checkbox1\" value =\"${groupMemberList[i].id}\">" +
                            "</td>" +
                            "<td>" +
                            groupMemberList[i].fullName + '(' + groupMemberList[i].username + ')' +
                            "</td>" +
                            "<td>" +
                            (groupMemberList[i].zone ?: '') +
                            "</td>" +
                            "<td>" +
                            (groupMemberList[i].enterprise ?: '') +
                            "</td>" +
                            "</tr>"
        }
        //tFooter = " </tbody>"
        sb.append(tHead + tBody + tFooter)
        render sb.toString()
    }

    // for DelegateInfo(form)
    def getFromUser() {
        def fromUser
        try {
            def sb = new StringBuilder()
            def fromDeskId = ApprovalGroup.get(params.formDeskId)
            fromUser = ApprovalGroupMember.findAllByApprovalGroup(fromDeskId)
            sb.append("<option value = ''>--Select One--</option>")
            for (int i = 0; i < fromUser.size(); i++) {
                sb.append('<option value="' + fromUser[i].id + '">' + fromUser[i].groupMember + '</option>')
            }
            render sb.toString()

        } catch (Exception e) {
            println(e)
        }
    }

    def getToUser() {
        def toUser
        try {
            def sb = new StringBuilder()
            def toDeskId = ApprovalGroup.get(params.toDeskId)
            toUser = ApprovalGroupMember.findAllByApprovalGroup(toDeskId)
            sb.append("<option value = ''>--Select One--</option>")
            for (int i = 0; i < toUser.size(); i++) {
                sb.append('<option value="' + toUser[i].id + '">' + toUser[i].groupMember + '</option>')
            }
            render sb.toString()

        } catch (Exception e) {
            println(e)
        }
    }

    // for NmCreateGroupMst (nm packeg)
    def loadNmGroupMembers() {
        def username = (params.userName + "").trim()
        def zoneInstance = params.zoneId ? CpZone.get(params.zoneId) : null

        def groupMemberList = User.createCriteria() list {
            if (username) {
                eq("username", username)
            }
            if (zoneInstance) {
                eq("zone", zoneInstance)
            }
            order("id", "asc")
            order("fullName", "asc")
        }

        def sb = new StringBuilder()
        def tHead = ""
        def tBody = ""
        def tFooter = ""
        for (int i = 0; i < groupMemberList.size(); i++) {
            tBody +=
                    "<tr>" +
                            "<td>" +
                            "<input type='checkBox' name=\"NmCreateGroupDtl[${i}].userId\" class=\"checkbox1 makeMeDraggable\" id=\"checkbox1\" value =\"${groupMemberList[i].id}\">" +
                            "</td>" +
                            "<td>" +
                            groupMemberList[i].fullName + '(' + groupMemberList[i].username + ')' +
                            "</td>" +
                            "<td>" +
                            (groupMemberList[i].email ?: '') +
                            "</td>" +
                            "<td>" +
                            (groupMemberList[i].cellNo ?: '') +
                            "</td>" +
                            "<td>" +

                            "<input type='hidden' name=\"NmCreateGroupDtl[${i}].id\" class=\"checkbox1 makeMeDraggable\" id=\"checkbox1\" value =\"${groupMemberList[i].id}\">"
            /* (groupMemberList[i].zone?.name ?: '') +
             "</td>" +
             "<td>" +
             (groupMemberList[i].enterprise?.entrprsName ?: '') +
             +*/
            "</td>"
            "</tr>"
        }
        //tFooter = " </tbody>"
        sb.append(tHead + tBody + tFooter)
        render sb.toString()
    }

    // for Employees Finger Print Recognition

    def getEmpInfo() {
        def bepzaPermitNo = params.permitNo
        def sb = new StringBuilder()

        def empInfo = EnterpriseEmployee.findAllByBepzaCode(bepzaPermitNo)
        for (int i = 0; i < empInfo.size(); i++) {
//                sb.append(empInfo.factoryIdNo + "@" + empInfo.fullName + "@" + empInfo.allDesignation + "@" + empInfo.picName)
            sb.append(empInfo[i].factoryIdNo + "@" + empInfo[i].fullName + "@" + empInfo[i].allDesignation + "@" + empInfo[i].picName)
        }

        render sb.toString()
    }
    /*----------end--------------*/

}
