package com.bepza.common


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AllDesignationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AllDesignation.list(params), model: [allDesignationInstanceCount: AllDesignation.count()]
    }

    def show(AllDesignation allDesignationInstance) {
        respond allDesignationInstance
    }

    def create() {
        respond new AllDesignation(params)
    }

    @Transactional
    def save(AllDesignation allDesignationInstance) {
        if (allDesignationInstance == null) {
            notFound()
            return
        }

        if (allDesignationInstance.hasErrors()) {
            respond allDesignationInstance.errors, view: 'create'
            return
        }

        allDesignationInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'allDesignation.label', default: 'AllDesignation'), allDesignationInstance.id])
                redirect allDesignationInstance
            }
            '*' { respond allDesignationInstance, [status: CREATED] }
        }
    }

    def edit(AllDesignation allDesignationInstance) {
        respond allDesignationInstance
    }

    @Transactional
    def update(AllDesignation allDesignationInstance) {
        if (allDesignationInstance == null) {
            notFound()
            return
        }

        if (allDesignationInstance.hasErrors()) {
            respond allDesignationInstance.errors, view: 'edit'
            return
        }

        allDesignationInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AllDesignation.label', default: 'AllDesignation'), allDesignationInstance.id])
                redirect allDesignationInstance
            }
            '*' { respond allDesignationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AllDesignation allDesignationInstance) {

        if (allDesignationInstance == null) {
            notFound()
            return
        }

        allDesignationInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AllDesignation.label', default: 'AllDesignation'), allDesignationInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'allDesignation.label', default: 'AllDesignation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
