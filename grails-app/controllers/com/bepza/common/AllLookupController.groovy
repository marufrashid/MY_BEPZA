package com.bepza.common

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class AllLookupController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST"]
    static defaultAction = "list"
    def groovyPageRenderer


    def list(Integer max) {
     params.max = Math.min(max ?: 10, 10000)
        def result = AllLookup.createCriteria().list(params) {
            if (params.keyWord) {
                ilike("keyword", "%${params.keyWord}%")
            }
            if (params.title) {
                ilike("title", "%${params.title}%")
            }
            if (params.parentId?.isNumber()) {
                eq("parent", AllLookup.get(params.parentId))
            }
        }
        def totalCount = result.totalCount
      [allLookupInstanceList: result, allLookupInstanceTotal: totalCount]
       // respond AllLookup.list(params), model: [allLookupInstanceTotal: AllLookup.count()]
    }

    def add() {
        if (request.method == 'POST') {
            def allLookupInstance = new AllLookup(params)
            if (!allLookupInstance.save(flush: true)) {
                render(view: "add", model: [allLookupInstance: allLookupInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'allLookup.label', default: 'AllLookup'), allLookupInstance.id])
            redirect(action: "show", id: allLookupInstance.id)
        }
        [allLookupInstance: new AllLookup(params)]
    }

    def show(Long id) {
        def allLookupInstance = AllLookup.get(id)
        if (!allLookupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'allLookup.label', default: 'AllLookup'), id])
            redirect(action: "list")
            return
        }

        [allLookupInstance: allLookupInstance]
    }

    def edit(Long id) {
        def allLookupInstance = AllLookup.get(id)
        if (!allLookupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'allLookup.label', default: 'AllLookup'), id])
            redirect(action: "list")
            return
        }

        [allLookupInstance: allLookupInstance]
    }

    def update(Long id, Long version) {
        def allLookupInstance = AllLookup.get(id)
        if (!allLookupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'allLookup.label', default: 'AllLookup'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (allLookupInstance.version > version) {
                allLookupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'allLookup.label', default: 'AllLookup')] as Object[],
                        "Another user has updated this AllLookup while you were editing")
                render(view: "edit", model: [allLookupInstance: allLookupInstance])
                return
            }
        }

        allLookupInstance.properties = params

        if (!allLookupInstance.save(flush: true)) {
            render(view: "edit", model: [allLookupInstance: allLookupInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'allLookup.label', default: 'AllLookup'), allLookupInstance.id])
        redirect(action: "show", id: allLookupInstance.id)
    }

    def delete(AllLookup allLookupInstance) {

        if (allLookupInstance == null) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }
        try {
            allLookupInstance.delete flush: true
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'allLookup.label', default: 'AllLookup'), allLookupInstance.id])
            redirect(action: "list")
        }catch (DataIntegrityViolationException e){
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'allLookup.label', default: 'AllLookup'), allLookupInstance.id])
            redirect(action: "show", id: allLookupInstance.id)
        }
    }

    def ajaxLookupList() {
        def parentId = params.parentId
        def lookupList
        def responseMsg = [:]
        if (parentId) {
            def parent = AllLookup.get(parentId)
            lookupList = AllLookup.findAllByParent(parent, [sort: 'sortBy', order: 'asc'])
        }
        def content = groovyPageRenderer.render(template: "/allLookup/parentChild", model: [allLookupInstanceList: lookupList])
        responseMsg.put("content", content)
        render responseMsg as JSON
    }

}
