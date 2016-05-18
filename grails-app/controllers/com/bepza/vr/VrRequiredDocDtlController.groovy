package com.bepza.vr

import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.http.HttpStatus

@Transactional(readOnly = true)
class VrRequiredDocDtlController {

    static defaultAction = "list"
    def springSecurityService

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def scpRequiredList = VrRequiredDocDtl.createCriteria().list(params) {
            if (params.docTypeName) {
                ilike("docTypeName", "%" + params.docTypeName + "%")
            }
            if (params.isMandatory == "Mandatory") {
                eq("isMandatory", true)
            }
            if (params.isMandatory == "Not Mandatory") {
                eq("isMandatory", false)
            }
        }
        def vrRequiredDocDtlInstanceCount = scpRequiredList.totalCount
        [scpRequiredDocInstanceList: scpRequiredList, vrRequiredDocDtlInstanceCount: vrRequiredDocDtlInstanceCount]
    }

    def show(VrRequiredDocDtl vrRequiredDocDtlInstance) {
        if (vrRequiredDocDtlInstance == null) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }
        [vrRequiredDocDtlInstance: vrRequiredDocDtlInstance]
    }

    @Transactional
    def add() {
        VrRequiredDocDtl vrRequiredDocDtlInstance = new VrRequiredDocDtl(params)
        if (request.method == "POST") {
            try {

                def currentUser = springSecurityService.currentUser
                def currentDate = new Date()
                vrRequiredDocDtlInstance.setCreatedBy(currentUser)
                vrRequiredDocDtlInstance.setCreatedDate(currentDate)


                vrRequiredDocDtlInstance.save flush: true, failOnError: true, deepValidate: true
                flash.success = message(code: 'default.created.message', args: [message(code: 'vrRequiredDocDtl.label', default: 'VrRequiredDocDtl'), vrRequiredDocDtlInstance.id])
                redirect(action: "show", id: vrRequiredDocDtlInstance.id)
            } catch (Exception exp) {
                println("Exception===============?" + exp)

                flash.error = "Something went wrong! Please check for the form errors and try again."
            }


        }
        [vrRequiredDocDtlInstance:vrRequiredDocDtlInstance]
    }

    @Transactional
    def edit(VrRequiredDocDtl vrRequiredDocDtlInstance) {
        if (!vrRequiredDocDtlInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }
        if (request.method == "POST") {
            try {
                def currentUser = springSecurityService.currentUser
                def currentDate = new Date()
                vrRequiredDocDtlInstance.setModifiedBy(currentUser)
                vrRequiredDocDtlInstance.setModifiedDate(currentDate)


                vrRequiredDocDtlInstance.save flush: true, failOnError: true, deepValidate: true
                flash.success =  message(code: 'default.created.message', args: [message(code: 'vrRequiredDocDtl.label', default: 'VrRequiredDocDtl'), vrRequiredDocDtlInstance.id])
                redirect(action: "show", id: vrRequiredDocDtlInstance.id)
            } catch (Exception exp) {
                println("Exception===============?" + exp)

                flash.error = "Something went wrong! Please check for the form errors and try again."
            }
        }

        [vrRequiredDocDtlInstance:vrRequiredDocDtlInstance]
    }

    @Transactional
    def delete(VrRequiredDocDtl vrRequiredDocDtlInstance) {
        if (vrRequiredDocDtlInstance == null) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }

        try {
            vrRequiredDocDtlInstance.delete flush: true
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'vrRequiredDocDtl.label', default: 'VrRequiredDocDtl'), vrRequiredDocDtlInstance.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            print("Exp========" + e)
            flash.error = message(code: 'default.deleted.message', args: [message(code: 'vrRequiredDocDtl.label', default: 'VrRequiredDocDtl'), vrRequiredDocDtlInstance.id])
            redirect(action: "show", id: vrRequiredDocDtlInstance.id)
        }
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vrRequiredDocDtl.label', default: 'VrRequiredDocDtl'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: HttpStatus.NOT_FOUND }
        }
    }
}
