package com.bepza.vr;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

public class VrApplicationInfo
  extends java.lang.Object  implements
    groovy.lang.GroovyObject {
;
public  groovy.lang.MetaClass getMetaClass() { return (groovy.lang.MetaClass)null;}
public  void setMetaClass(groovy.lang.MetaClass mc) { }
public  java.lang.Object invokeMethod(java.lang.String method, java.lang.Object arguments) { return null;}
public  java.lang.Object getProperty(java.lang.String property) { return null;}
public  void setProperty(java.lang.String property, java.lang.Object value) { }
public  java.lang.Object getUtilityService() { return null;}
public  void setUtilityService(java.lang.Object value) { }
public static  java.lang.Object getMapping() { return null;}
public static  void setMapping(java.lang.Object value) { }
public  java.lang.Long getId() { return (java.lang.Long)null;}
public  void setId(java.lang.Long value) { }
public  com.bepza.common.CpEntrprsMst getEnterprise() { return (com.bepza.common.CpEntrprsMst)null;}
public  void setEnterprise(com.bepza.common.CpEntrprsMst value) { }
public  java.lang.String getCode() { return (java.lang.String)null;}
public  void setCode(java.lang.String value) { }
public  java.lang.String getNameOfForeigner() { return (java.lang.String)null;}
public  void setNameOfForeigner(java.lang.String value) { }
public  java.lang.String getNameOfForFamMember() { return (java.lang.String)null;}
public  void setNameOfForFamMember(java.lang.String value) { }
public  java.lang.String getForeignerRefNo() { return (java.lang.String)null;}
public  void setForeignerRefNo(java.lang.String value) { }
public  com.bepza.common.AllDesignation getDesignation() { return (com.bepza.common.AllDesignation)null;}
public  void setDesignation(com.bepza.common.AllDesignation value) { }
public  com.bepza.common.AllLookup getNationality() { return (com.bepza.common.AllLookup)null;}
public  void setNationality(com.bepza.common.AllLookup value) { }
public  java.lang.String getRelation() { return (java.lang.String)null;}
public  void setRelation(java.lang.String value) { }
public  java.util.Date getDateOfBirth() { return (java.util.Date)null;}
public  void setDateOfBirth(java.util.Date value) { }
public  java.lang.String getPassportNo() { return (java.lang.String)null;}
public  void setPassportNo(java.lang.String value) { }
public  java.util.Date getPassportIssueDate() { return (java.util.Date)null;}
public  void setPassportIssueDate(java.util.Date value) { }
public  java.util.Date getPassportExpireDate() { return (java.util.Date)null;}
public  void setPassportExpireDate(java.util.Date value) { }
public  com.bepza.common.AllLookup getVisaCategory() { return (com.bepza.common.AllLookup)null;}
public  void setVisaCategory(com.bepza.common.AllLookup value) { }
public  java.lang.String getPurpose() { return (java.lang.String)null;}
public  void setPurpose(java.lang.String value) { }
public  java.lang.String getForeignerSummary() { return (java.lang.String)null;}
public  void setForeignerSummary(java.lang.String value) { }
public  java.lang.String getRemarks() { return (java.lang.String)null;}
public  void setRemarks(java.lang.String value) { }
public  com.bepza.common.AllLookup getCurrentStatus() { return (com.bepza.common.AllLookup)null;}
public  void setCurrentStatus(com.bepza.common.AllLookup value) { }
public  com.bepza.common.AllLookup getPreviousStatus() { return (com.bepza.common.AllLookup)null;}
public  void setPreviousStatus(com.bepza.common.AllLookup value) { }
public  com.bepza.approval.ApprovalGroup getCurrentServeGroup() { return (com.bepza.approval.ApprovalGroup)null;}
public  void setCurrentServeGroup(com.bepza.approval.ApprovalGroup value) { }
public  com.bepza.auth.User getCurrentServeMember() { return (com.bepza.auth.User)null;}
public  void setCurrentServeMember(com.bepza.auth.User value) { }
public  java.lang.Boolean getIsActive() { return (java.lang.Boolean)null;}
public  void setIsActive(java.lang.Boolean value) { }
public  java.util.Date getSubmitDate() { return (java.util.Date)null;}
public  void setSubmitDate(java.util.Date value) { }
public  com.bepza.auth.User getSubmittedBy() { return (com.bepza.auth.User)null;}
public  void setSubmittedBy(com.bepza.auth.User value) { }
public  java.lang.Boolean getIsSaveAsDraft() { return (java.lang.Boolean)null;}
public  void setIsSaveAsDraft(java.lang.Boolean value) { }
public  java.util.Date getSaveAsDraftDate() { return (java.util.Date)null;}
public  void setSaveAsDraftDate(java.util.Date value) { }
public  java.lang.Boolean getIsApproved() { return (java.lang.Boolean)null;}
public  void setIsApproved(java.lang.Boolean value) { }
public  java.util.Date getApprovedDate() { return (java.util.Date)null;}
public  void setApprovedDate(java.util.Date value) { }
public  java.lang.String getVisaRecommandationNo() { return (java.lang.String)null;}
public  void setVisaRecommandationNo(java.lang.String value) { }
public  java.lang.Boolean getIsCancelRequest() { return (java.lang.Boolean)null;}
public  void setIsCancelRequest(java.lang.Boolean value) { }
public  java.util.Date getCancelRequestDate() { return (java.util.Date)null;}
public  void setCancelRequestDate(java.util.Date value) { }
public  java.lang.String getCancelReason() { return (java.lang.String)null;}
public  void setCancelReason(java.lang.String value) { }
public  java.lang.Boolean getIsCanceled() { return (java.lang.Boolean)null;}
public  void setIsCanceled(java.lang.Boolean value) { }
public  java.util.Date getCancelDate() { return (java.util.Date)null;}
public  void setCancelDate(java.util.Date value) { }
public  java.lang.String getVrIssueNo() { return (java.lang.String)null;}
public  void setVrIssueNo(java.lang.String value) { }
public  java.util.Date getProcessedDate() { return (java.util.Date)null;}
public  void setProcessedDate(java.util.Date value) { }
public  com.bepza.auth.User getProcessedBy() { return (com.bepza.auth.User)null;}
public  void setProcessedBy(com.bepza.auth.User value) { }
public  java.util.Date getCreatedDate() { return (java.util.Date)null;}
public  void setCreatedDate(java.util.Date value) { }
public  com.bepza.auth.User getCreatedBy() { return (com.bepza.auth.User)null;}
public  void setCreatedBy(com.bepza.auth.User value) { }
public  java.util.Date getModifiedDate() { return (java.util.Date)null;}
public  void setModifiedDate(java.util.Date value) { }
public  com.bepza.auth.User getModifiedBy() { return (com.bepza.auth.User)null;}
public  void setModifiedBy(com.bepza.auth.User value) { }
public static  java.lang.Object getHasMany() { return null;}
public static  void setHasMany(java.lang.Object value) { }
public static  java.lang.Object getConstraints() { return null;}
public static  void setConstraints(java.lang.Object value) { }
public  java.lang.Object beforeInsert() { return null;}
}
