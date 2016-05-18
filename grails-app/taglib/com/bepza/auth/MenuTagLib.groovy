package com.bepza.auth

class MenuTagLib {
    static namespace = "menu"
    MenuService menuService
    def loadMenu = { attr ->
        out << menuService.getMenu(attr.type)
    }
}
