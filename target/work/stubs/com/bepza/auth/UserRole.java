package com.bepza.auth;

import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

@groovy.transform.ToString(cache=true, includePackage=false, includeNames=true) public class UserRole
  extends java.lang.Object  implements
    java.io.Serializable,    groovy.lang.GroovyObject {
;
public UserRole
(com.bepza.auth.User u, com.bepza.auth.Role r) {
super ();
}
public static  com.bepza.auth.UserRole create(com.bepza.auth.User user, com.bepza.auth.Role role) { return (com.bepza.auth.UserRole)null;}
public static  boolean remove(com.bepza.auth.User u, com.bepza.auth.Role r) { return false;}
public static  void removeAll(com.bepza.auth.User u) { }
public static  void removeAll(com.bepza.auth.Role r) { }
public  groovy.lang.MetaClass getMetaClass() { return (groovy.lang.MetaClass)null;}
public  void setMetaClass(groovy.lang.MetaClass mc) { }
public  java.lang.Object invokeMethod(java.lang.String method, java.lang.Object arguments) { return null;}
public  java.lang.Object getProperty(java.lang.String property) { return null;}
public  void setProperty(java.lang.String property, java.lang.Object value) { }
public  com.bepza.auth.User getUser() { return (com.bepza.auth.User)null;}
public  void setUser(com.bepza.auth.User value) { }
public  com.bepza.auth.Role getRole() { return (com.bepza.auth.Role)null;}
public  void setRole(com.bepza.auth.Role value) { }
public static  java.lang.Object getConstraints() { return null;}
public static  void setConstraints(java.lang.Object value) { }
public static  java.lang.Object getMapping() { return null;}
public static  void setMapping(java.lang.Object value) { }
@java.lang.Override() public  boolean equals(java.lang.Object other) { return false;}
@java.lang.Override() public  int hashCode() { return (int)0;}
public static  com.bepza.auth.UserRole get(long userId, long roleId) { return (com.bepza.auth.UserRole)null;}
public static  boolean exists(long userId, long roleId) { return false;}
public static  com.bepza.auth.UserRole create(com.bepza.auth.User user, com.bepza.auth.Role role, boolean flush) { return (com.bepza.auth.UserRole)null;}
public static  boolean remove(com.bepza.auth.User u, com.bepza.auth.Role r, boolean flush) { return false;}
public static  void removeAll(com.bepza.auth.User u, boolean flush) { }
public static  void removeAll(com.bepza.auth.Role r, boolean flush) { }
}
