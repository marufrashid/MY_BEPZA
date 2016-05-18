package com.bepza.common


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CpEntrprsMstController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CpEntrprsMst.list(params), model: [cpEntrprsMstInstanceCount: CpEntrprsMst.count()]
    }

    def show(CpEntrprsMst cpEntrprsMstInstance) {
        respond cpEntrprsMstInstance
    }

    def create() {
        respond new CpEntrprsMst(params)
    }

    @Transactional
    def save(CpEntrprsMst cpEntrprsMstInstance) {
        if (cpEntrprsMstInstance == null) {
            notFound()
            return
        }

        if (cpEntrprsMstInstance.hasErrors()) {
            respond cpEntrprsMstInstance.errors, view: 'create'
            return
        }

        cpEntrprsMstInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cpEntrprsMst.label', default: 'CpEntrprsMst'), cpEntrprsMstInstance.id])
                redirect cpEntrprsMstInstance
            }
            '*' { respond cpEntrprsMstInstance, [status: CREATED] }
        }
    }

    def edit(CpEntrprsMst cpEntrprsMstInstance) {
        respond cpEntrprsMstInstance
    }

    @Transactional
    def update(CpEntrprsMst cpEntrprsMstInstance) {
        if (cpEntrprsMstInstance == null) {
            notFound()
            return
        }

        if (cpEntrprsMstInstance.hasErrors()) {
            respond cpEntrprsMstInstance.errors, view: 'edit'
            return
        }

        cpEntrprsMstInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CpEntrprsMst.label', default: 'CpEntrprsMst'), cpEntrprsMstInstance.id])
                redirect cpEntrprsMstInstance
            }
            '*' { respond cpEntrprsMstInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CpEntrprsMst cpEntrprsMstInstance) {

        if (cpEntrprsMstInstance == null) {
            notFound()
            return
        }

        cpEntrprsMstInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CpEntrprsMst.label', default: 'CpEntrprsMst'), cpEntrprsMstInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cpEntrprsMst.label', default: 'CpEntrprsMst'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
