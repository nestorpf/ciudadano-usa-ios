//
//  UserProfile.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/24/25.
//

import Foundation

class UserProfile: Codable {
    static let shared = UserProfile.loadOrCreate()
    
    var state: String = ""
    var stateCapital: String = ""
    var governor: String = ""
    var senators: [String] = []
    var representative: String = ""
    var hasCompletedOnboarding: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case state, stateCapital, governor, senators, representative, hasCompletedOnboarding
    }
    
    required init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        state = try container.decode(String.self, forKey: .state)
        stateCapital = try container.decode(String.self, forKey: .stateCapital)
        governor = try container.decode(String.self, forKey: .governor)
        senators = try container.decode([String].self, forKey: .senators)
        representative = try container.decode(String.self, forKey: .representative)
        hasCompletedOnboarding = try container.decode(Bool.self, forKey: .hasCompletedOnboarding)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(state, forKey: .state)
        try container.encode(stateCapital, forKey: .stateCapital)
        try container.encode(governor, forKey: .governor)
        try container.encode(senators, forKey: .senators)
        try container.encode(representative, forKey: .representative)
        try container.encode(hasCompletedOnboarding, forKey: .hasCompletedOnboarding)
    }
    
    static func loadOrCreate() -> UserProfile {
        if let data = UserDefaults.standard.data(forKey: "userProfile"),
           let profile = try? JSONDecoder().decode(UserProfile.self, from: data) {
            return profile
        }
        return UserProfile()
    }
    
    func saveProfile() {
        if let data = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(data, forKey: "userProfile")
        }
    }
    
    func updateProfile(state: String, stateCapital: String, governor: String, senators: [String], representative: String) {
        self.state = state
        self.stateCapital = stateCapital
        self.governor = governor
        self.senators = senators
        self.representative = representative
        self.hasCompletedOnboarding = true
        saveProfile()
    }
}

// State data for onboarding
struct StateData {
    let name: String
    let capital: String
    let governor: String
    let senators: [String]
    
    static let states: [StateData] = [
        StateData(name: "Alabama", capital: "Montgomery", governor: "Kay Ivey", senators: ["Katie Britt", "Tommy Tuberville"]),
        StateData(name: "Alaska", capital: "Juneau", governor: "Mike Dunleavy", senators: ["Lisa Murkowski", "Dan Sullivan"]),
        StateData(name: "Arizona", capital: "Phoenix", governor: "Katie Hobbs", senators: ["Kyrsten Sinema", "Mark Kelly"]),
        StateData(name: "Arkansas", capital: "Little Rock", governor: "Sarah Huckabee Sanders", senators: ["John Boozman", "Tom Cotton"]),
        StateData(name: "California", capital: "Sacramento", governor: "Gavin Newsom", senators: ["Alex Padilla", "Laphonza Butler"]),
        StateData(name: "Colorado", capital: "Denver", governor: "Jared Polis", senators: ["Michael Bennet", "John Hickenlooper"]),
        StateData(name: "Connecticut", capital: "Hartford", governor: "Ned Lamont", senators: ["Richard Blumenthal", "Chris Murphy"]),
        StateData(name: "Delaware", capital: "Dover", governor: "John Carney", senators: ["Tom Carper", "Chris Coons"]),
        StateData(name: "Florida", capital: "Tallahassee", governor: "Ron DeSantis", senators: ["Marco Rubio", "Rick Scott"]),
        StateData(name: "Georgia", capital: "Atlanta", governor: "Brian Kemp", senators: ["Jon Ossoff", "Raphael Warnock"]),
        StateData(name: "Hawaii", capital: "Honolulu", governor: "Josh Green", senators: ["Brian Schatz", "Mazie Hirono"]),
        StateData(name: "Idaho", capital: "Boise", governor: "Brad Little", senators: ["Mike Crapo", "Jim Risch"]),
        StateData(name: "Illinois", capital: "Springfield", governor: "J.B. Pritzker", senators: ["Dick Durbin", "Tammy Duckworth"]),
        StateData(name: "Indiana", capital: "Indianapolis", governor: "Eric Holcomb", senators: ["Todd Young", "Mike Braun"]),
        StateData(name: "Iowa", capital: "Des Moines", governor: "Kim Reynolds", senators: ["Chuck Grassley", "Joni Ernst"]),
        StateData(name: "Kansas", capital: "Topeka", governor: "Laura Kelly", senators: ["Jerry Moran", "Roger Marshall"]),
        StateData(name: "Kentucky", capital: "Frankfort", governor: "Andy Beshear", senators: ["Mitch McConnell", "Rand Paul"]),
        StateData(name: "Louisiana", capital: "Baton Rouge", governor: "Jeff Landry", senators: ["Bill Cassidy", "John Kennedy"]),
        StateData(name: "Maine", capital: "Augusta", governor: "Janet Mills", senators: ["Susan Collins", "Angus King"]),
        StateData(name: "Maryland", capital: "Annapolis", governor: "Wes Moore", senators: ["Ben Cardin", "Chris Van Hollen"]),
        StateData(name: "Massachusetts", capital: "Boston", governor: "Maura Healey", senators: ["Elizabeth Warren", "Ed Markey"]),
        StateData(name: "Michigan", capital: "Lansing", governor: "Gretchen Whitmer", senators: ["Debbie Stabenow", "Gary Peters"]),
        StateData(name: "Minnesota", capital: "Saint Paul", governor: "Tim Walz", senators: ["Amy Klobuchar", "Tina Smith"]),
        StateData(name: "Mississippi", capital: "Jackson", governor: "Tate Reeves", senators: ["Roger Wicker", "Cindy Hyde-Smith"]),
        StateData(name: "Missouri", capital: "Jefferson City", governor: "Mike Parson", senators: ["Josh Hawley", "Eric Schmitt"]),
        StateData(name: "Montana", capital: "Helena", governor: "Greg Gianforte", senators: ["Jon Tester", "Steve Daines"]),
        StateData(name: "Nebraska", capital: "Lincoln", governor: "Jim Pillen", senators: ["Deb Fischer", "Pete Ricketts"]),
        StateData(name: "Nevada", capital: "Carson City", governor: "Joe Lombardo", senators: ["Catherine Cortez Masto", "Jacky Rosen"]),
        StateData(name: "New Hampshire", capital: "Concord", governor: "Chris Sununu", senators: ["Jeanne Shaheen", "Maggie Hassan"]),
        StateData(name: "New Jersey", capital: "Trenton", governor: "Phil Murphy", senators: ["Bob Menendez", "Cory Booker"]),
        StateData(name: "New Mexico", capital: "Santa Fe", governor: "Michelle Lujan Grisham", senators: ["Martin Heinrich", "Ben Ray Luján"]),
        StateData(name: "New York", capital: "Albany", governor: "Kathy Hochul", senators: ["Chuck Schumer", "Kirsten Gillibrand"]),
        StateData(name: "North Carolina", capital: "Raleigh", governor: "Roy Cooper", senators: ["Thom Tillis", "Ted Budd"]),
        StateData(name: "North Dakota", capital: "Bismarck", governor: "Doug Burgum", senators: ["John Hoeven", "Kevin Cramer"]),
        StateData(name: "Ohio", capital: "Columbus", governor: "Mike DeWine", senators: ["Sherrod Brown", "JD Vance"]),
        StateData(name: "Oklahoma", capital: "Oklahoma City", governor: "Kevin Stitt", senators: ["James Lankford", "Markwayne Mullin"]),
        StateData(name: "Oregon", capital: "Salem", governor: "Tina Kotek", senators: ["Ron Wyden", "Jeff Merkley"]),
        StateData(name: "Pennsylvania", capital: "Harrisburg", governor: "Josh Shapiro", senators: ["Bob Casey", "John Fetterman"]),
        StateData(name: "Rhode Island", capital: "Providence", governor: "Dan McKee", senators: ["Jack Reed", "Sheldon Whitehouse"]),
        StateData(name: "South Carolina", capital: "Columbia", governor: "Henry McMaster", senators: ["Lindsey Graham", "Tim Scott"]),
        StateData(name: "South Dakota", capital: "Pierre", governor: "Kristi Noem", senators: ["John Thune", "Mike Rounds"]),
        StateData(name: "Tennessee", capital: "Nashville", governor: "Bill Lee", senators: ["Marsha Blackburn", "Bill Hagerty"]),
        StateData(name: "Texas", capital: "Austin", governor: "Greg Abbott", senators: ["John Cornyn", "Ted Cruz"]),
        StateData(name: "Utah", capital: "Salt Lake City", governor: "Spencer Cox", senators: ["Mitt Romney", "Mike Lee"]),
        StateData(name: "Vermont", capital: "Montpelier", governor: "Phil Scott", senators: ["Bernie Sanders", "Peter Welch"]),
        StateData(name: "Virginia", capital: "Richmond", governor: "Glenn Youngkin", senators: ["Mark Warner", "Tim Kaine"]),
        StateData(name: "Washington", capital: "Olympia", governor: "Jay Inslee", senators: ["Patty Murray", "Maria Cantwell"]),
        StateData(name: "West Virginia", capital: "Charleston", governor: "Jim Justice", senators: ["Joe Manchin", "Shelley Moore Capito"]),
        StateData(name: "Wisconsin", capital: "Madison", governor: "Tony Evers", senators: ["Tammy Baldwin", "Ron Johnson"]),
        StateData(name: "Wyoming", capital: "Cheyenne", governor: "Mark Gordon", senators: ["John Barrasso", "Cynthia Lummis"])
    ]
    
    static func getStateData(for stateName: String) -> StateData? {
        return states.first { $0.name.lowercased() == stateName.lowercased() }
    }
} 