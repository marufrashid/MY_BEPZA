package com.bepza.auth

class Role implements Serializable {

	private static final long serialVersionUID = 1

	String authority
	String description
	Date created
	String createdBy
	Date modified
	String modifiedBy

	Role(String authority) {
//        this()
		this.authority = authority
	}

	@Override
	int hashCode() {
		authority?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof Role && other.authority == authority)
	}

	@Override
	String toString() {
		authority
	}

	static constraints = {
		authority blank: false, unique: true
		description nullable: true, size: 1..250
		created nullable: false
		createdBy nullable: false
		modified nullable: true
		modifiedBy nullable: true
	}

	static mapping = {
		table 'auth_role'
		cache true
		version false
	}
}
