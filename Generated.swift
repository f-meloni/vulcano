class Generated: Codable {
    var objectOrArray: String
    var empty: Boolean
    var parseTimeNanoseconds: Int
    var object: [Object]
    var validate: Boolean
    var size: Float
    
    enum CodingKeys: String, CodingKey { 
         case objectOrArray = "object_or_array"
         case empty
         case parseTimeNanoseconds = "parse_time_nanoseconds"
         case object
         case validate
         case size
    }
}
