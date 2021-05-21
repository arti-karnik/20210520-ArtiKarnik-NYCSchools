
struct NYSchool: Codable{
    var schoolName: String;
    var address: String;
    var phone: String;
    var city: String;
    var state: String;
    var zip: String;
    var startTime: String;
    var endTime: String;
    
    private enum CodingKeys: String, CodingKey{
        case schoolName = "school_name"
        case address = "primary_address_line_1"
        case phone = "phone_number"
        case city = "city"
        case state = "state_code"
        case zip = "zip"
        case startTime = "start_time"
        case endTime = "end_time"
    }
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        schoolName = try container.decode(String.self, forKey: .schoolName)
        address = (try container.decodeIfPresent(String.self, forKey: .address)) ?? "Unknown Address"
        phone = (try container.decodeIfPresent(String.self, forKey: .phone)) ?? "NA"
        city = (try container.decodeIfPresent(String.self, forKey: .city)) ?? "NA"
        state = (try container.decodeIfPresent(String.self, forKey: .state)) ?? "NA"
        zip = (try container.decodeIfPresent(String.self, forKey: .zip)) ?? "NA"
        startTime = (try container.decodeIfPresent(String.self, forKey: .startTime)) ?? "NA"
        endTime = (try container.decodeIfPresent(String.self, forKey: .endTime)) ?? "NA"
    }
}
