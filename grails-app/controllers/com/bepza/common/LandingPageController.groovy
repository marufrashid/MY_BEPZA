package com.bepza.common

import com.bepza.auth.User
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Transactional(readOnly = true)
class LandingPageController {

    static defaultAction = "list"
    def springSecurityService

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LandingPage.list(params), model: [landingPageInstanceCount: LandingPage.count()]
    }

    def show(LandingPage landingPageInstance) {
        respond landingPageInstance
    }

    @Transactional
    def add() {
        if (request.method == 'POST') {
            def currentUser = (User) springSecurityService.currentUser
            def currentDate = new Date()
            def landingPageInstance = new LandingPage(params)
            landingPageInstance.setEntryDate(currentDate)
            landingPageInstance.setEntryByUserId(currentUser)
            if (!landingPageInstance.save(flush: true)) {
                flash.error = 'Something went wrong! Please check form error or try again later.'
                render(view: "add", model: [landingPageInstance: landingPageInstance])
                return
            }

            flash.success = message(code: 'default.created.message', args: [message(code: 'landingPage.label', default: 'Landing page setup'), landingPageInstance.id])
            redirect(action: "show", id: landingPageInstance.id)
        }
    }

    @Transactional
    def edit(LandingPage landingPageInstance) {
        if (!landingPageInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }
        if (request.method == 'PUT') {
            def currentUser = (User) springSecurityService.currentUser
            def currentDate = new Date()
            landingPageInstance.setModifiedDate(currentDate)
            landingPageInstance.setModifiedByUserId(currentUser)
            if (!landingPageInstance.save(flush: true)) {
                render(view: "edit", model: [landingPageInstance: landingPageInstance])
                return
            }

            flash.success = message(code: 'default.updated.message', args: [message(code: 'landingPage.label', default: 'Landing page setup'), landingPageInstance.id])
            redirect(action: "show", id: landingPageInstance.id)
        }
        respond landingPageInstance
    }

    @Transactional
    def delete(LandingPage landingPageInstance) {

        if (!landingPageInstance) {
            flash.error = 'Record not found!'
            redirect(action: "list")
            return
        }

        try {
            landingPageInstance.delete(flush: true)
            flash.success = message(code: 'default.deleted.message', args: [message(code: 'LandingPage.label', default: 'Landing page setup'), landingPageInstance.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'LandingPage.label', default: 'Landing page setup'), landingPageInstance.id])
            redirect(action: "show", id: landingPageInstance.id)
        }

    }
}
