
struct NYSchool: Codable{
    var dbn: String;
    var schoolName: String;
    var address: String;
    var phone: String;
    var city: String;
    var state: String;
    var zip: String;
    var startTime: String;
    var endTime: String;
    var website: String;
    var description: String;
    var SATtakers: String;
    var SATcriticalReadingAvgScore: String;
    var SATmathAvgScore: String;
    var SATwritingAvgScore: String;
    
    private enum CodingKeys: String, CodingKey{
        case dbn = "dbn"
        case schoolName = "school_name"
        case address = "primary_address_line_1"
        case phone = "phone_number"
        case city = "city"
        case state = "state_code"
        case description = "overview_paragraph"
        case zip = "zip"
        case startTime = "start_time"
        case endTime = "end_time"
        case website = "website"
        case SATtakers = "num_of_sat_test_takers"
        case SATcriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case SATmathAvgScore = "sat_math_avg_score"
        case SATwritingAvgScore = "sat_writing_avg_score"
    }
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dbn = try container.decode(String.self, forKey: .dbn)
        schoolName = try container.decode(String.self, forKey: .schoolName)
        address = (try container.decodeIfPresent(String.self, forKey: .address)) ?? "Unknown Address"
        description = (try container.decodeIfPresent(String.self, forKey: .description)) ?? "Unknown"
        phone = (try container.decodeIfPresent(String.self, forKey: .phone)) ?? "NA"
        city = (try container.decodeIfPresent(String.self, forKey: .city)) ?? "NA"
        state = (try container.decodeIfPresent(String.self, forKey: .state)) ?? "NA"
        website = (try container.decodeIfPresent(String.self, forKey: .website)) ?? "NA"
        zip = (try container.decodeIfPresent(String.self, forKey: .zip)) ?? "NA"
        startTime = (try container.decodeIfPresent(String.self, forKey: .startTime)) ?? "NA"
        endTime = (try container.decodeIfPresent(String.self, forKey: .endTime)) ?? "NA"
        SATtakers = (try container.decodeIfPresent(String.self, forKey: .SATtakers)) ?? "NA"
        SATcriticalReadingAvgScore = (try container.decodeIfPresent(String.self, forKey: .SATcriticalReadingAvgScore)) ?? "NA"
        SATmathAvgScore = (try container.decodeIfPresent(String.self, forKey: .SATmathAvgScore)) ?? "NA"
        SATwritingAvgScore = (try container.decodeIfPresent(String.self, forKey: .SATwritingAvgScore)) ?? "NA"
    }
}


