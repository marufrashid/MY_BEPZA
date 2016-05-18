package com.bepza.vr


import grails.transaction.Transactional
import groovy.sql.Sql
import org.springframework.jdbc.datasource.TransactionAwareDataSourceProxy

/**
 * Created by kazi on 3/1/2016.
 */
@Transactional
class VrRequiredDocDtlService {

    TransactionAwareDataSourceProxy dataSource
    Sql db


    @Transactional(readOnly = true)
    public List getRequiredDocList(Long docForId) {

        List result = []
        db = new Sql(dataSource)
        try {
            String query = "SELECT A.ID,A.DOC_TYPE_NAME,A.DOC_TYPE_DESCRIPTION,\n" +
                    " A.ALLOWED_EXTENSIONS,A.FILE_SIZE_BYTE,A.IS_MANDATORY \n" +
                    " FROM VR_REQUIRED_DOC_DTL A\n" +
                    " WHERE A.IS_ACTIVE=1\n" +
                    " ORDER BY A.SORT_ORDER ASC"
            result = db.rows(query)

        } catch (Exception ex) {
            log.error(ex.getMessage())
        }
        db.close()
        return result
    }
}
