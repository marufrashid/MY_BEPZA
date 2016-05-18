package com.bepza.auth

import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Transactional(readOnly = true)
class RequestmapController {

    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static defaultAction = "list"
    def springSecurityService

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 10000)
        def result = Requestmap.createCriteria().list(params) {
            if (params.urlPath) {
                ilike("url", "%${params.urlPath}%")
            }
            if (params.configAttribute) {
                ilike("configAttribute", "%${params.configAttribute}%")
            }
        }
        def totalCount = result.totalCount
        [requestmapInstanceList: result, requestmapInstanceTotal: totalCount]
    }

    def show(Requestmap requestmapInstance) {
        respond requestmapInstance
    }

    @Transactional
    def add() {
        if (request.method == 'POST') {
            def currentUserUsername = springSecurityService.currentUser ? springSecurityService.currentUser.username : 'SYSTEM'
            def currentDate = new Date()
            def requestmapInstance = new Requestmap()
            bindData(requestmapInstance, params, [exclude: ['configAttribute']])
            def configAttribute = params.configAttribute.getClass().isArray() ? params.configAttribute.join(",") : params.configAttribute
            requestmapInstance.setConfigAttribute(configAttribute)
            requestmapInstance.setCreated(currentDate)
            requestmapInstance.setCreatedBy(currentUserUsername)
            if (!requestmapInstance.save(flush: true)) {
                render(view: "add", model: [requestmapInstance: requestmapInstance])
                return
            }
            springSecurityService.clearCachedRequestmaps()
            //This is important: to refresh the requestmap. Without it the rules remain unchanged.
            flash.success = message(code: 'default.created.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), requestmapInstance.id])
            redirect(action: "show", id: requestmapInstance.id)
        }
        respond new Requestmap(params)
    }

    @Transactional
    def edit(Requestmap requestmapInstance) {
        if (request.method == 'PUT') {
            def currentUserUsername = springSecurityService.currentUser ? springSecurityService.currentUser.username : 'SYSTEM'
            def currentDate = new Date()
            bindData(requestmapInstance, params, [exclude: ['configAttribute']])
            def configAttribute = params.configAttribute.getClass().isArray() ? params.configAttribute.join(",") : params.configAttribute
            requestmapInstance.setConfigAttribute(configAttribute)
            requestmapInstance.setModified(currentDate)
            requestmapInstance.setModifiedBy(currentUserUsername)
            if (!requestmapInstance.save(flush: true)) {
                render(view: "edit", model: [requestmapInstance: requestmapInstance])
                return
            }
            springSecurityService.clearCachedRequestmaps()
            //This is important: to refresh the requestmap. Without it the rules remain unchanged.
            flash.success = message(code: 'default.updated.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), requestmapInstance.id])
            redirect(action: "show", id: requestmapInstance.id)
        }
        respond requestmapInstance
    }

    @Transactional
    def delete(Requestmap requestmapInstance) {

        if (!requestmapInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }

        try {
            requestmapInstance.delete(flush: true)
            springSecurityService.clearCachedRequestmaps()
            //This is important: to refresh the requestmap. Without it the rules remain unchanged.
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), requestmapInstance.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'requestmap.label', default: 'Requestmap'), requestmapInstance.id])
            redirect(action: "show", id: requestmapInstance.id)
        }
    }

}
