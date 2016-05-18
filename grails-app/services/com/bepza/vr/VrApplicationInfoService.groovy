package com.bepza.vr

import com.bepza.auth.User
import com.bepza.common.CpEntrprsMst
import grails.transaction.Transactional
import groovy.sql.Sql
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef
import util.CommonUtility
import util.DateRelated

@Transactional
class VrApplicationInfoService {

    def allLookupService
    def approvalService
    def springSecurityService
    def utilityService
    def jasperService
    def dataSource

    def getPendingListForProcess(Map<String, Object> mapParams) {

        def pendingAppList

        def currentUser = springSecurityService?.currentUser

        def c = VrApplicationInfo.createCriteria()
        pendingAppList = c.list(mapParams) {
            if (mapParams.code != null && mapParams.code != "") {
                eq("code", mapParams.code)
            }
            if (mapParams.entrprsName) {
                def enterprise=CpEntrprsMst.findByEntrprsNameIlike(mapParams.entrprsName.toString().trim())
                if(enterprise){
                    eq("enterprise", enterprise)
                }
            }
            if (mapParams.fromDate && mapParams.toDate) {
                ge("submitDate", DateRelated.getDateObject(mapParams.fromDate))
                lt("submitDate", DateRelated.getDateObject(mapParams.toDate) + 1)
            } else if (mapParams.fromDate) {
                ge("submitDate", DateRelated.getDateObject(mapParams.fromDate))
            } else if (mapParams.toDate) {
                lt("submitDate", DateRelated.getDateObject(mapParams.toDate) + 1)
            }
            order("processedDate", "asc")
        }

        return pendingAppList

    }

    def getPendingListForProcessBK(Map<String, Object> mapParams) {
        def approvalGroupInstanceList = approvalService.getApprovalGroupListByUser(springSecurityService?.currentUser)
        def pendingAppList

        def currentUser = springSecurityService?.currentUser

        def c = VrApplicationInfo.createCriteria()
        pendingAppList = c.list(mapParams) {
            if (mapParams.code != null && mapParams.code != "") {
                eq("code", mapParams.code)
            }
            if (mapParams.entrprsName) {
                def enterprise=CpEntrprsMst.findByEntrprsNameIlike(mapParams.entrprsName.toString().trim())
                if(enterprise){
                    eq("enterprise", enterprise)
                }
            }
            if (mapParams.fromDate && mapParams.toDate) {
                ge("submitDate", DateRelated.getDateObject(mapParams.fromDate))
                lt("submitDate", DateRelated.getDateObject(mapParams.toDate) + 1)
            } else if (mapParams.fromDate) {
                ge("submitDate", DateRelated.getDateObject(mapParams.fromDate))
            } else if (mapParams.toDate) {
                lt("submitDate", DateRelated.getDateObject(mapParams.toDate) + 1)
            }
            and {
                or {
                    and {
                        inList("currentServeGroup", approvalGroupInstanceList)
                        eq("currentServeMember", currentUser)
                    }
                    and {
                        inList("currentServeGroup", approvalGroupInstanceList)
                        isNull("currentServeMember")
                    }
                }
            }
            order("processedDate", "asc")
        }

        return pendingAppList

    }

    def getForeignerDtlByCode(String code){
        String foreignerDtlByCode="";
        def vrApplicationInfo
        if(code!=""){
             vrApplicationInfo=VrApplicationInfo.findByCode(code.toString().trim());
        }
        if(vrApplicationInfo){
            foreignerDtlByCode=vrApplicationInfo.nameOfForeigner+"@MARUF@"+vrApplicationInfo.code;
        }

        return foreignerDtlByCode
    }



}
