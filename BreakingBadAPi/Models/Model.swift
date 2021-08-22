//
//  Model.swift
//  BreakingBadAPi
//
//  Created by Сергей Кудинов on 19.08.2021.
//

struct WelcomeElement: Codable {
    let charID: Int?
    let name: String?
    let occupation: [String]?
    let img: String?
//    let status: Status?
    let nickname: String?
    let appearance: [Int]?
    let portrayed: String?
    let betterCallSaulAppearance: [Int]?

//    enum CodingKeys: String, CodingKey {
//        case charID = "char_id"
//        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
//        case betterCallSaulAppearance = "better_call_saul_appearance"
//    }
    
//    static func getArray(from arrayOfItems: Any) -> [WelcomeElement]? {
//        guard let arrayOfHeroes = arrayOfItems as? [[String : Any]] else { return nil }
//        return arrayOfHeroes.compactMap { WelcomeElement(dict: $0)}
//    }
}

//enum Birthday: String, Codable {
//    case the07081993 = "07-08-1993"
//    case the08111970 = "08-11-1970"
//    case the09071958 = "09-07-1958"
//    case the09241984 = "09-24-1984"
//    case unknown = "Unknown"
//}

//enum Category: String, Codable {
//    case betterCallSaul = "Better Call Saul"
//    case breakingBad = "Breaking Bad"
//    case breakingBadBetterCallSaul = "Breaking Bad, Better Call Saul"
//}
//
//enum Status: String, Codable {
//    case alive = "Alive"
//    case deceased = "Deceased"
//    case presumedDead = "Presumed dead"
//    case unknown = "Unknown"
//}

