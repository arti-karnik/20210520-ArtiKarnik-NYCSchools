
struct NYSAT: Codable{
    var schoolName: String;
    var dbn: String;
    var SATtakers: String;
    var SATcriticalReadingAvgScore: String;
    var SATmathAvgScore: String;
    var SATwritingAvgScore: String;
    
    private enum CodingKeys: String, CodingKey{
        case dbn = "dbn"
        case schoolName = "school_name"
        case SATtakers = "num_of_sat_test_takers"
        case SATcriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case SATmathAvgScore = "sat_math_avg_score"
        case SATwritingAvgScore = "sat_writing_avg_score"
    }
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dbn = try container.decode(String.self, forKey: .dbn)
        schoolName = try container.decode(String.self, forKey: .schoolName)
        SATtakers = (try container.decodeIfPresent(String.self, forKey: .SATtakers)) ?? "NA"
        SATcriticalReadingAvgScore = (try container.decodeIfPresent(String.self, forKey: .SATcriticalReadingAvgScore)) ?? "NA"
        SATmathAvgScore = (try container.decodeIfPresent(String.self, forKey: .SATmathAvgScore)) ?? "NA"
        SATwritingAvgScore = (try container.decodeIfPresent(String.self, forKey: .SATwritingAvgScore)) ?? "NA"
    }
}



