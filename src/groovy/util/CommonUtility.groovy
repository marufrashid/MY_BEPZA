package util

import com.bepza.common.AllCodeDef

import java.text.ParseException
import java.text.SimpleDateFormat

/**
 * Created by msaifullah on 11/9/2015.
 */
class CommonUtility {
    def static getCode(domainName) {

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

    // -- start from text to date conversion method here -------------------
    def static getDateMonddyyyy(String date) {

        if (date == null) {
            return null;
        }
        SimpleDateFormat df = new SimpleDateFormat("d/M/yyyy");
        try {

            java.util.Date today = df.parse(date);
            //System.out.println("today..." + today.toString());

            return today;

        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
    // -- end from text to date conversion method here -------------------

    //specially for enterprise application code generation
    //prefix must be ZONE_CODE
    def static getCode(prefix, domainName) {

        def allCodeDef = AllCodeDef.findByPrefixAndPojoClass(prefix, domainName)
        def cdLength = 10
        def nxtVal = 1
        if (allCodeDef != null) {
//            prefix = (allCodeDef.getPrefix() == null) ? prefix : allCodeDef.getPrefix()
            cdLength = (allCodeDef.getCdLength() == null) ? 9 : allCodeDef.getCdLength()
            nxtVal = (allCodeDef.getNxtVal() == null) ? 1 : allCodeDef.getNxtVal()
        }
        else {
            allCodeDef = new AllCodeDef()
//            allCodeDef.setPrefix(prefix)
            allCodeDef.setCdLength(cdLength)
            allCodeDef.setPojoClass(domainName)
        }
        def lastCodeVal = nxtVal + ""
//        cdLength = cdLength - prefix.length()

        while ((String.valueOf(lastCodeVal)).length() < cdLength) {
            lastCodeVal = "0" + lastCodeVal
        }
        allCodeDef.setNxtVal(++nxtVal)
        allCodeDef.save(flush: true)
        return (lastCodeVal)
    }
}
