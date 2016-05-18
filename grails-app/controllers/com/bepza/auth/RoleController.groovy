package com.bepza.auth

import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Transactional(readOnly = true)
class RoleController {

    static defaultAction = "list"
    def springSecurityService

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Role.list(params), model: [roleInstanceCount: Role.count()]
    }

    def show(Role roleInstance) {
        respond roleInstance
    }

    @Transactional
    def add() {
        if (request.method == 'POST') {
            def currentUserUsername = springSecurityService.currentUser ? springSecurityService.currentUser.username : 'SYSTEM'
            def currentDate = new Date()
            def roleInstance = new Role(params)
            roleInstance.setCreated(currentDate)
            roleInstance.setCreatedBy(currentUserUsername)
            if (!roleInstance.save(flush: true)) {
                render(view: "add", model: [roleInstance: roleInstance])
                return
            }

            flash.success = message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Role'), roleInstance.id])
            redirect(action: "show", id: roleInstance.id)
        }
        respond new Role(params)
    }

    @Transactional
    def edit(Role roleInstance) {
        if (!roleInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }
        if (request.method == 'PUT') {
            def currentUserUsername = springSecurityService.currentUser ? springSecurityService.currentUser.username : 'SYSTEM'
            def currentDate = new Date()
            roleInstance.setModified(currentDate)
            roleInstance.setModifiedBy(currentUserUsername)
            if (!roleInstance.save(flush: true)) {
                render(view: "edit", model: [roleInstance: roleInstance])
                return
            }

            flash.success = message(code: 'default.updated.message', args: [message(code: 'Role.label', default: 'Role'), roleInstance.id])
            redirect(action: "show", id: roleInstance.id)
        }
        respond roleInstance
    }


    @Transactional
    def delete(Role roleInstance) {

        if (!roleInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }

        try {
            roleInstance.delete(flush: true)
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'Role.label', default: 'User'), roleInstance.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'Role.label', default: 'User'), roleInstance.id])
            redirect(action: "show", id: roleInstance.id)
        }
    }
}
