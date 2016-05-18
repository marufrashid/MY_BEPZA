package com.bepza.vr

import grails.transaction.Transactional
import org.springframework.http.HttpStatus

@Transactional(readOnly = true)
class VrBlockListController {

   /* static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]*/

    static defaultAction = "list"
    def springSecurityService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VrBlockList.list(params), model: [vrBlockListInstanceCount: VrBlockList.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VrBlockList.list(params), model: [vrBlockListInstanceCount: VrBlockList.count()]
    }

    def show(VrBlockList vrBlockListInstance) {
        respond vrBlockListInstance
    }

    def create() {
        respond new VrBlockList(params)
    }

    @Transactional
    def add() {
        VrBlockList vrBlockListInstance = new VrBlockList(params)
        if (request.method == "POST") {
            try {

                def currentUser = springSecurityService.currentUser
                def currentDate = new Date()
                vrBlockListInstance.setCreatedBy(currentUser)
                vrBlockListInstance.setCreatedDate(currentDate)


                vrBlockListInstance.save flush: true, failOnError: true, deepValidate: true
                flash.success = message(code: 'default.created.message', args: [message(code: 'vrBlockList.label', default: 'Block List'), vrBlockListInstance.id])
                redirect(action: "show", id: vrBlockListInstance.id)
            } catch (Exception exp) {
                println("Exception===============?" + exp)

                flash.error = "Something went wrong! Please check for the form errors and try again."
            }


        }
        [vrBlockListInstance:vrBlockListInstance]
    }

    @Transactional
    def save(VrBlockList vrBlockListInstance) {
        if (vrBlockListInstance == null) {
            notFound()
            return
        }

        if (vrBlockListInstance.hasErrors()) {
            respond vrBlockListInstance.errors, view: 'create'
            return
        }

        vrBlockListInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vrBlockList.label', default: 'VrBlockList'), vrBlockListInstance.id])
                redirect vrBlockListInstance
            }
            '*' { respond vrBlockListInstance, [status: HttpStatus.CREATED] }
        }
    }

    def edit(VrBlockList vrBlockListInstance) {
        respond vrBlockListInstance
    }

    @Transactional
    def update(VrBlockList vrBlockListInstance) {
        if (vrBlockListInstance == null) {
            notFound()
            return
        }

        if (vrBlockListInstance.hasErrors()) {
            respond vrBlockListInstance.errors, view: 'edit'
            return
        }

        vrBlockListInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VrBlockList.label', default: 'VrBlockList'), vrBlockListInstance.id])
                redirect vrBlockListInstance
            }
            '*' { respond vrBlockListInstance, [status: HttpStatus.OK] }
        }
    }

    @Transactional
    def delete(VrBlockList vrBlockListInstance) {

        if (vrBlockListInstance == null) {
            notFound()
            return
        }

        vrBlockListInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VrBlockList.label', default: 'VrBlockList'), vrBlockListInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: HttpStatus.NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vrBlockList.label', default: 'VrBlockList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: HttpStatus.NOT_FOUND }
        }
    }
}
