import Foundation

struct Match {
    enum State {
        // We use strings instead of proper data types and don't include any in-progress states to simplify the example.
        case notStarted(kickoffDate: String, kickoffTime: String)
        case finished(score: String)
    }

    let id: String

    let teamHomeName: String
    let teamAwayName: String

    let teamHomeLogoURL: URL
    let teamAwayLogoURL: URL

    let state: State
}
