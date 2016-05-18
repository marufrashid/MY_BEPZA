package com.bepza.common


import grails.test.mixin.*
import spock.lang.*

@TestFor(AllDesignationController)
@Mock(AllDesignation)
class AllDesignationControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.allDesignationInstanceList
        model.allDesignationInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.allDesignationInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def allDesignation = new AllDesignation()
        allDesignation.validate()
        controller.save(allDesignation)

        then: "The create view is rendered again with the correct model"
        model.allDesignationInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        allDesignation = new AllDesignation(params)

        controller.save(allDesignation)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/allDesignation/show/1'
        controller.flash.message != null
        AllDesignation.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def allDesignation = new AllDesignation(params)
        controller.show(allDesignation)

        then: "A model is populated containing the domain instance"
        model.allDesignationInstance == allDesignation
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def allDesignation = new AllDesignation(params)
        controller.edit(allDesignation)

        then: "A model is populated containing the domain instance"
        model.allDesignationInstance == allDesignation
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/allDesignation/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def allDesignation = new AllDesignation()
        allDesignation.validate()
        controller.update(allDesignation)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.allDesignationInstance == allDesignation

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        allDesignation = new AllDesignation(params).save(flush: true)
        controller.update(allDesignation)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/allDesignation/show/$allDesignation.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/allDesignation/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def allDesignation = new AllDesignation(params).save(flush: true)

        then: "It exists"
        AllDesignation.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(allDesignation)

        then: "The instance is deleted"
        AllDesignation.count() == 0
        response.redirectedUrl == '/allDesignation/index'
        flash.message != null
    }
}
