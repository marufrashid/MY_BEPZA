package com.bepza.auth

import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Transactional(readOnly = true)
class MenuController {

    static defaultAction = "list"
    def springSecurityService
    def menuService

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 1000)
        def result = Menu.createCriteria().list(params) {
            if (params.parentMenuId?.isNumber()) {
                eq("parentMenu", Menu.get(params.parentMenuId))
            }
            if (params.title) {
                ilike("title", "%${params.title}%")
            }
            if (params.urlPath) {
                ilike("urlPath", "%${params.urlPath}%")
            }
        }
        def totalCount = result.totalCount
        [menuInstanceList: result, menuInstanceTotal: totalCount, menuInstanceListDD: menuService.getHierarchicalMenuList()]
    }

    def show(Menu menuInstance) {
        if (!menuInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }
        respond menuInstance
    }

    @Transactional
    def add() {
        if (request.method == 'POST') {
            def currentUserUsername = springSecurityService.currentUser ? springSecurityService.currentUser.username : 'SYSTEM'
            def currentDate = new Date()
            def menuInstance = new Menu(params)
            menuInstance.setCreated(currentDate)
            menuInstance.setCreatedBy(currentUserUsername)
            if (!menuInstance.save(flush: true)) {
                render(view: "add", model: [menuInstance: menuInstance])
                return
            }
            menuService.clearSession()
            flash.success = message(code: 'default.created.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])
            redirect(action: "show", id: menuInstance.id)
        }
        [menuInstance: new Menu(params), menuInstanceListDD: menuService.getHierarchicalMenuList()]
    }


    @Transactional
    def edit(Menu menuInstance) {
        if (!menuInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }
        if (request.method == 'PUT') {
            def currentUserUsername = springSecurityService.currentUser ? springSecurityService.currentUser.username : 'SYSTEM'
            def currentDate = new Date()
            menuInstance.setModified(currentDate)
            menuInstance.setModifiedBy(currentUserUsername)
            if (!menuInstance.save(flush: true)) {
                render(view: "edit", model: [menuInstance: menuInstance])
                return
            }
            menuService.clearSession()
            flash.success = message(code: 'default.created.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])
            redirect(action: "show", id: menuInstance.id)
        }
        [menuInstance: menuInstance, menuInstanceListDD: menuService.getHierarchicalMenuList()]
    }

    @Transactional
    def delete(Menu menuInstance) {

        if (!menuInstance) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'menu.label', default: 'Menu'), id])
            redirect(action: "list")
            return
        }

        try {
            menuInstance.delete(flush: true)
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'menu.label', default: 'Menu'), menuInstance.id])
            redirect(action: "show", id: menuInstance.id)
        }
    }
}
