import CoreData

@objc(PembeliData)
class PembeliData: NSManagedObject{
    @NSManaged var username: String!
    @NSManaged var password: String!
}
