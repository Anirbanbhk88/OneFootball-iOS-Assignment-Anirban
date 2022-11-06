import Foundation

// Mocks an actual networking class to simplify the example.
class MockMatchLoader {
    func loadMatches(completionBlock: (([Match]) -> Void)) {
        let match1 = Match(id: "1",
                           teamHomeName: "1. FC Union Berlin",
                           teamAwayName: "Hertha BSC",
                           teamHomeLogoURL: URL(string: "https://images.onefootball.com/icons/teams/164/168.png")!,
                           teamAwayLogoURL: URL(string: "https://images.onefootball.com/icons/teams/164/174.png")!,
                           state: .finished(score: "1 : 0"))

        let match2 = Match(id: "2",
                           teamHomeName: "Liverpool",
                           teamAwayName: "Manchester United",
                           teamHomeLogoURL: URL(string: "https://images.onefootball.com/icons/teams/164/18.png")!,
                           teamAwayLogoURL: URL(string: "https://images.onefootball.com/icons/teams/164/21.png")!,
                           state: .notStarted(kickoffDate: "Tomorrow", kickoffTime: "19:00"))

        completionBlock([match1, match2])
    }
}
