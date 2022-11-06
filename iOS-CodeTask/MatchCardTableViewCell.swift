import UIKit

class MatchCardTableViewCell: UITableViewCell {
    @IBOutlet weak var teamHomeNameLabel: UILabel!
    @IBOutlet weak var teamAwayNameLabel: UILabel!

    @IBOutlet weak var teamHomeImageView: UIImageView!
    @IBOutlet weak var teamAwayImageView: UIImageView!

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var kickoffTimeLabel: UILabel!
    @IBOutlet weak var kickoffDateLabel: UILabel!
}
