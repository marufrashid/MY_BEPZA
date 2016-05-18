package com.bepza.auth

class Menu {
    String title
    String toolTip
    String description
    String urlPath
    String menuClass
    String menuType = "MAIN_MENU"
    Menu parentMenu
    Boolean isExternal
    Boolean isOpenNewTab
    Boolean isActive
    Integer sortOrder
    Date created
    String createdBy
    Date modified
    String modifiedBy

    static mapping = {
        table 'auth_menu'
        id column: 'ID'//, params: [sequence: 'menu_seq'] // only for oracle db
        version false
        parentMenu column: 'parent_id'
        sort title: "asc" // or "desc"
    }

    static constraints = {
        title blank: false, nullable: false
        toolTip nullable: true
        description nullable: true, size: 1..250
        urlPath blank: false, nullable: false
        menuClass nullable: true, size: 1..100
        menuType nullable: true, size: 1..100
        parentMenu nullable: true
        isExternal nullable: true
        isOpenNewTab nullable: true
        isActive nullable: false
        sortOrder nullable: true
        created nullable: false
        createdBy nullable: false
        modified nullable: true
        modifiedBy nullable: true
    }

    String toString(){
        return title
    }
}
