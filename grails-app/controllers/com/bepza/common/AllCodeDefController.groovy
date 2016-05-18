package com.bepza.common


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AllCodeDefController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AllCodeDef.list(params), model: [allCodeDefInstanceCount: AllCodeDef.count()]
    }

    def show(AllCodeDef allCodeDefInstance) {
        respond allCodeDefInstance
    }

    def create() {
        respond new AllCodeDef(params)
    }

    @Transactional
    def save(AllCodeDef allCodeDefInstance) {
        if (allCodeDefInstance == null) {
            notFound()
            return
        }

        if (allCodeDefInstance.hasErrors()) {
            respond allCodeDefInstance.errors, view: 'create'
            return
        }

        allCodeDefInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'allCodeDef.label', default: 'AllCodeDef'), allCodeDefInstance.id])
                redirect allCodeDefInstance
            }
            '*' { respond allCodeDefInstance, [status: CREATED] }
        }
    }

    def edit(AllCodeDef allCodeDefInstance) {
        respond allCodeDefInstance
    }

    @Transactional
    def update(AllCodeDef allCodeDefInstance) {
        if (allCodeDefInstance == null) {
            notFound()
            return
        }

        if (allCodeDefInstance.hasErrors()) {
            respond allCodeDefInstance.errors, view: 'edit'
            return
        }

        allCodeDefInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AllCodeDef.label', default: 'AllCodeDef'), allCodeDefInstance.id])
                redirect allCodeDefInstance
            }
            '*' { respond allCodeDefInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AllCodeDef allCodeDefInstance) {

        if (allCodeDefInstance == null) {
            notFound()
            return
        }

        allCodeDefInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AllCodeDef.label', default: 'AllCodeDef'), allCodeDefInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'allCodeDef.label', default: 'AllCodeDef'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
