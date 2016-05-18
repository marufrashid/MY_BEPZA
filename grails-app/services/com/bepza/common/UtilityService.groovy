package com.bepza.common

import com.bepza.common.AllCodeDef
import com.bepza.common.AllDesignation
import com.bepza.common.CpEntrprsMst
import grails.transaction.Transactional
import groovy.sql.Sql
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.math.RoundingMode
import java.nio.channels.FileChannel

@Transactional
class UtilityService {
    def allLookupService
    def dataSource

    def getCode(String domainName, String prefix, Long cdLength, boolean flush = true) {
        def allCodeDef = AllCodeDef.findByPrefixAndPojoClass(prefix, domainName)
        Long nxtVal = 1
        if (allCodeDef) {
            nxtVal = allCodeDef.getNxtVal()
        } else {
            allCodeDef = new AllCodeDef()
            allCodeDef.setPrefix(prefix)
            allCodeDef.setCdLength(cdLength)
            allCodeDef.setPojoClass(domainName)
            allCodeDef.setCode(domainName)
        }
        def lastCodeVal = prefix + String.format("%0${cdLength}d", nxtVal)
        allCodeDef.setNxtVal(++nxtVal)
        allCodeDef.save(flush: flush)
        return (lastCodeVal)
    }

    def getCode(domainName) {
        def allCodeDef = AllCodeDef.findByPojoClass(domainName)
        def prefix = "S-"
        def cdLength = 8
        def nxtVal = 1
        if (allCodeDef != null) {
            prefix = (allCodeDef.getPrefix() == null) ? "" : allCodeDef.getPrefix()
            cdLength = (allCodeDef.getCdLength() == null) ? 0 : allCodeDef.getCdLength()
            nxtVal = (allCodeDef.getNxtVal() == null) ? 1 : allCodeDef.getNxtVal()
        } else {
            allCodeDef = new AllCodeDef()
            allCodeDef.setPrefix("S-")
            allCodeDef.setCdLength(cdLength)
            allCodeDef.setPojoClass(domainName)
            allCodeDef.setCode(domainName)
        }
        def lastCodeVal = nxtVal + ""


        if (cdLength != 0) {
            cdLength = cdLength - prefix.length()
            while ((String.valueOf(lastCodeVal)).length() < cdLength) {
                lastCodeVal = "0" + lastCodeVal
            }
        }

        allCodeDef.setNxtVal(++nxtVal)
        allCodeDef.save(flush: true)
        return (prefix + lastCodeVal)
    }


    def copyFile(File sourceFile, File destFile) throws IOException {
        def copyDir = new File(destFile.getParent())
        if (!copyDir.exists()) {
            copyDir.mkdirs()
            copyDir.setWritable(true)
        }

        if (!destFile.exists()) {
            destFile.createNewFile();
        }

        FileChannel source = null;
        FileChannel destination = null;

        try {
            source = new FileInputStream(sourceFile).getChannel();
            destination = new FileOutputStream(destFile).getChannel();
            destination.transferFrom(source, 0, source.size());
        }
        finally {
            if (source != null) {
                source.close();
            }
            if (destination != null) {
                destination.close();
            }
        }
    }

    /*Get All Active Designation List*/

    def getAllActiveDesignationList() {

        def desgLst
        def c = AllDesignation.createCriteria()

        desgLst = c.list {
            like("isActive", true)
            order("sortOrder", "asc")
            order("designationName", "asc")
        }

        return desgLst
    } // end of getAllActiveDesignationList()


    /*Get All Active Business Type List*/

    def getBusinessTypeList() {
        String lookupKeyword = "BUSINESS_TYPE"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getBusinessTypeList()

    /*Get All Active Organization Type List*/

    def getOrgTypeList() {
        String lookupKeyword = "ORG_TYPE"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getOrgTypeList()

    /*Get All Active Enterprise List*/

    def getAllActiveEnterpriseList() {

        def enterpriseLst
        def c = CpEntrprsMst.createCriteria()

        enterpriseLst = c.list {
            eq("isActive", true)
            //eq("isApproved", true)
//            eq("isApproved", true)   //should be uncomment later
            order("sortOrder", "asc")
            order("entrprsName", "asc")
        }

        return enterpriseLst
    }//end of getAllActiveEnterpriseList()


    /*Get All Active  Nationality List*/

    def getAllActiveNationalityList() {

        String lookupKeyword = "NATIONALITY"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveNationalityList()

    /*Get All Active  skill category List*/

    def getAllActiveSkillCategoryList() {

        String lookupKeyword = "SKILL_CATEGORY"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveSkillCategoryList()
    def getAllActiveWorkPermitTypeList() {

        String lookupKeyword = "WORK_PERMIT_TYPE"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveWorkPermitTypeList()

    /*Get All Active  Visa Category List*/

    def getAllActiveVisaCategoryList() {

        String lookupKeyword = "VISA_CATEGORY"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }

    /*Get All Active  Visa Category List*/

    def getAllNameOfForeignerList() {

        return allLookupService.getAllNameOfForeignerList()
    }
    /*Get All Active  Visa Issued Foreigner RefNo List*/

    def getAllActiveVisaIssuedForeignerRefNoList() {

        return allLookupService.getAllActiveVisaIssuedForeignerRefNoList()
    }

    /*Get All Active  Acknowledge Doc Type List*/

    def getAllActiveAcknowledgeDocTypeList() {
        String lookupKeyword = "ACKNOWLEDGE_DOC_TYPE"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveAcknowledgeDocTypeList()

    /*Get All Active  Unit of Measurement List*/

    def getAllActiveUOMList() {

        String lookupKeyword = "UNIT_OF_MEASUREMENT"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveUOMList()

    /*Get All Active  Service Type List*/

    def getAllActiveServiceTypeList() {

        String lookupKeyword = "SERVICE_TYPE"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveServiceTypeList()

    /*Get All Active  Utility Type List*/

    def getAllActiveUtilityTypeList() {

        String lookupKeyword = "UTILITY_TYPE"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveUtilityTypeList()

    /*Get All Active  Gender List*/

    def getAllActiveGenderList() {

        String lookupKeyword = "GENDER"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveGenderList()

    /*Get All Active  Blood Group List*/

    def getAllActiveBloodGroupList() {

        String lookupKeyword = "BLOOD_GROUP"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveBloodGroupList()

    /*Get All Active  User Type List*/

    def getAllActiveUserTypeList() {

        String lookupKeyword = "AUTH_USER_TYPE"
        return allLookupService.getLookupListByParent(lookupKeyword)
    }//end of getAllActiveUserTypeList()



//    ======================================================================
    /*
    * TODO:ADD
    * Particulars of the Sponsors / Directors :
    *       Status in the Proposed Company
    * Manpower Requirements:
    *       Root Category
    *       Sub Category
    */
//    ======================================================================

    /**
     * Generate File name for any type of document
     *
     * @param prefix
     * @param suffix
     * @author
     */
    String generateFileName(String prefix, String suffix) {
        String fileName = prefix + UUID.randomUUID() + suffix
        return fileName
    }

    /*All country list*/

    /*def getAllActiveCountryList() {
        def countryLst
        def c = Country.createCriteria()

        countryLst = c.list {
            like("isActive", true)
            order("sortOrder", "asc")
            order("countryName", "asc")
        }
        return countryLst
    }*/

    //path where all dynamic contents reside
    def getGlobalFilePath() {
        def globalFilePath = AllProperty.findByPropKey("DOCUMENT_PATH_USER")?.propValue != null ? AllProperty.findByPropKey("DOCUMENT_PATH_USER")?.propValue : "" + File.separator
        return globalFilePath
    }

    private String getFileExtension(fileName) {
        return fileName.substring(fileName.lastIndexOf('.'), fileName.length());
    }

    def getEnterpriseOutstandingDue(def zoneId, def enterpriseId) {
        //def str = "SELECT sum(DUES_AMOUNT) DUES_AMOUNT FROM BCM_ALL_BILL_V WHERE ZONE_ID=1 and ENTERPRISE_ID=" + enterpriseId
        def str = "SELECT sum(DUES_AMOUNT) DUES_AMOUNT FROM BCM_ALL_BILL_V WHERE ZONE_ID=" + zoneId + " and ENTERPRISE_ID=" + enterpriseId
        Sql sql = new Sql(dataSource)
        def outstandingDues = sql.firstRow(str).DUES_AMOUNT
        sql.close()
        return (Float) outstandingDues
    }

    /*def getEnterpriseDueThreshold(CpEntrprsMst enterprise) {
        def currentDate = new Date().clearTime()
        if (enterprise?.invalidateThreshold && enterprise?.invalidateThresholdCutoffDate == null) {
            return null
        } else if (enterprise?.invalidateThreshold && (enterprise?.invalidateThresholdCutoffDate && currentDate.compareTo(enterprise?.invalidateThresholdCutoffDate?.clearTime()) != 1)) {
            return null
        } else {
            return enterprise?.dueBillThresholdValue ?: null
        }
    }*/

    /*def isAllowedEnterpriseToApply(CpEntrprsMst enterprise) {
        if (enterprise.isAppHold) {
            return false
        }
        def dueTheshold = getEnterpriseDueThreshold(enterprise)
        if (dueTheshold) {
            def outstandingDue = getEnterpriseOutstandingDue(enterprise?.zoneId?.id, enterprise?.id)
            if (outstandingDue && outstandingDue > dueTheshold) {
                return false
            }
        }
        return true
    }*/


    /*Save the image and return file name that needs to save in db
    * relativeFolder = wp/imageUrl
    * */
    String generateImageFileNameWithCreation(CommonsMultipartFile cmf, String relativeFolder, String prefix = "p", String suffix = "s") { // relativeFolder = wp/imageUrl


        String fileName = ""
        String subFolder = File.separator + relativeFolder
        String absoluteSubFolderPath = getGlobalFilePath() + subFolder   // only folder not file
        String absoluteFullPath

        //check folder exists. if not create
        File userDir = new File(absoluteSubFolderPath)
        if (!userDir.exists()) {
            userDir.mkdirs()
            userDir.setWritable(true)
        }

//        fileName = subFolder + File.separator + utilityService.generateFileName(prefix, suffix)
        fileName = generateFileName(prefix, suffix) + ".jpg"
        absoluteFullPath = absoluteSubFolderPath + File.separator + fileName  // full path with file

        File f = new File(absoluteFullPath)
        cmf.transferTo(f)

        return fileName
    }

    String generateDocFileNameWithCreation(CommonsMultipartFile cmf, String relativeFolder, String prefix = "p", String suffix = "s") { // relativeFolder = wp/imageUrl


        String fileName = ""
        String subFolder = File.separator + relativeFolder
        String absoluteSubFolderPath = getGlobalFilePath() + subFolder   // only folder not file
        String absoluteFullPath

        //check folder exists. if not create
        File userDir = new File(absoluteSubFolderPath)
        if (!userDir.exists()) {
            userDir.mkdirs()
            userDir.setWritable(true)
        }

//        fileName = subFolder + File.separator + utilityService.generateFileName(prefix, suffix)
        String ext = getFileExtension(cmf.getOriginalFilename())
        fileName = generateFileName(prefix, suffix) + "." + ext
        absoluteFullPath = absoluteSubFolderPath + File.separator + fileName  // full path with file

        File f = new File(absoluteFullPath)
        cmf.transferTo(f)

        return fileName
    }

    Map validateImage(CommonsMultipartFile cmf){
        Map result = new HashMap()

        if (cmf.contentType.equals("image/x-icon")
                || cmf.contentType.equals("image/png")
                || cmf.contentType.equals("image/jpeg")
                || cmf.contentType.equals("image/gif"))   //  image/x-icon,  image/png,   image/jpeg, image/gif){
        {
            if (cmf.size > 5000000) {
                result.put("IS_SUCCESSFUL", false)
                result.put("MSG", "Image size greater than 5 MB")
                return result
            }

            result.put("IS_SUCCESSFUL", true)
            return result

        } else {
            result.put("IS_SUCCESSFUL", false)
            result.put("MSG", "Not a valid image type")
            return result
        }
    }
}
