import com.bepza.auth.*
import javax.servlet.http.HttpServletRequest


/*
class BootStrap {

    def init = { servletContext ->
    }
    def destroy = {
    }
}
*/
class BootStrap {

    def springSecurityService
    def init = { servletContext ->
        HttpServletRequest.metaClass.isXhr = { ->
            'XMLHttpRequest' == delegate.getHeader('X-Requested-With')
        }

        def currentDate = new Date()
        def roleAdmin = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN', description: 'Administrator (auto created)', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
        def user = User.findByUsername('admin') ?: new User(fullName: 'Administrator', username: 'admin', password: '123456', enabled: true, created: currentDate, createdBy: 'SYSTEM').save(flush: true)
        if (!user.authorities.contains(roleAdmin)) {
            UserRole.create(user, roleAdmin, true)
            // add some initial request map
            for (String url in [
                    '/**/favicon.ico', '/resources/**',
                    '/assets/**', '/**/js/**', '/**/css/**', '/**/images/**',
                    '/login', '/login.*', '/login/*',
                    '/logout', '/logout.*', '/logout/*', '/font-awesome-4.5.0/**']) {
                new Requestmap(url: url, configAttribute: 'permitAll', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            }
            new Requestmap(url: '/', configAttribute: 'IS_AUTHENTICATED_FULLY', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/index', configAttribute: 'IS_AUTHENTICATED_FULLY', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/list.gsp', configAttribute: 'IS_AUTHENTICATED_FULLY', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/requestmap', configAttribute: 'ROLE_ADMIN', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/requestmap/*', configAttribute: 'ROLE_ADMIN', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/requestmap/*/*', configAttribute: 'ROLE_ADMIN', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/role', configAttribute: 'ROLE_ADMIN', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/role/*', configAttribute: 'ROLE_ADMIN', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/role/*/*', configAttribute: 'ROLE_ADMIN', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/user', configAttribute: 'ROLE_ADMIN', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/user/*', configAttribute: 'ROLE_ADMIN', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
            new Requestmap(url: '/user/*/*', configAttribute: 'ROLE_ADMIN', created: currentDate, createdBy: 'SYSTEM').save(flush: true)
        }
        springSecurityService.clearCachedRequestmaps()
    }
    def destroy = {
    }
}