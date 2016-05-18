package com.bepza.common /**
 * The AllLookup entity.
 *
 * @author
 *
 *
 */
class AllLookup {
    static mapping = {
        table 'ALL_LOOKUP'
        id column: 'ID'//, params: [sequence: 'all_look_seq'] // only for oracle db
        version false
        parent column: 'PARENT_ID'
    }
    Long id
    String keyword
    Integer sortBy
    String title
    Boolean isActive = true
    // Relation
    AllLookup parent

    static constraints = {
        id(size: 0..19)
        keyword(nullable: false, size: 0..30, unique: ['parent'])
        sortBy(nullable: true, size: 0..4)
        title(nullable: false, size: 1..100)
        isActive(nullable: true)
        parent( nullable: true)
    }

    String toString() {
        return "${title}"
    }
}
