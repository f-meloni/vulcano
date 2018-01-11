class Object: Codable {
    var isTrue: Boolean
    
    enum CodingKeys: String, CodingKey { 
         case isTrue = "is_true"
    }
}
