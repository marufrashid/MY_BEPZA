package com.bepza.common

import com.bepza.vr.VrApplicationInfo
import grails.transaction.Transactional

@Transactional
class AllLookupService {

    def getLookupById(Long id) {
        return AllLookup.get(id)
    }

    def getLookupByParentAndKeyword(String parentKeyword, String lookupKeyword) {
        return AllLookup.findByParentAndKeyword(AllLookup.findByKeyword(parentKeyword), lookupKeyword)
    }

    def getLookupByParentAndKeywordList(String parentKeyword, List<String> lookupKeyword) {
        return AllLookup.findAllByParentAndKeywordInList(AllLookup.findByKeyword(parentKeyword), lookupKeyword, [sort: "sortBy", order: "asc"])
    }

    def getLookupByParentAndKeywordList(String parentKeyword, List<String> lookupKeyword, String sortBy, String order) {
        return AllLookup.findAllByParentAndKeywordInList(AllLookup.findByKeyword(parentKeyword), lookupKeyword, [sort: sortBy, order: order])
    }

    def getLookupListByParent(String parentKeyword) {
        def parentInstance = AllLookup.findByKeyword(parentKeyword)
        def lookUpList
        if (parentInstance)
            lookUpList = AllLookup.findAllByParentAndIsActive(AllLookup.findByKeyword(parentKeyword), true, [sort: "sortBy", order: "asc"])
        return lookUpList
    }
    def getAllNameOfForeignerList() {

        def allNameOfForeignerList = VrApplicationInfo.list()

        return allNameOfForeignerList
    }
    def getAllActiveVisaIssuedForeignerRefNoList() {

        def allActiveVisaIssuedForeignerRefNoList = VrApplicationInfo.findAllByCurrentStatusAndIsActive(AllLookup.findByKeyword('ISSUED'),true,[sort: "processedDate", order: "asc"])

        return allActiveVisaIssuedForeignerRefNoList
    }

    def getLookupListSizeByParent(String parentKeyword) {
        def parentInstance = AllLookup.findByKeyword(parentKeyword)
        int lookUpListSize=0
        if (parentInstance)
            lookUpListSize = AllLookup.findAllByParentAndIsActive(AllLookup.findByKeyword(parentKeyword), true, [sort: "sortBy", order: "asc"]).size()
        return lookUpListSize
    }

    def getLookupListByParent(String parentKeyword, String sortBy, String order) {
        return AllLookup.findAllByParentAndIsActive(AllLookup.findByKeyword(parentKeyword), true, [sort: sortBy, order: order])
    }

    def getLookupValueByKeyword(String keyword){
        return AllLookup.findByKeywordAndIsActive(keyword,true)
    }
}
