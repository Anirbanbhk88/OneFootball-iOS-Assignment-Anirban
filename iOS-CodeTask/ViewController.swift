import UIKit
import CloudKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var tableView: UITableView?

    var data = [Any]()
//From the Architecture of the code it can be understood that the viewcontroller loads a UITableView and then dynamically populates the cell with Match type data and then followed by
// NewsFeedItem type data in the next cells. Another option can be to show the match details in table header and then have the news feed in the cells under that header
// for that particular match.
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame:self.view.frame)
        tableView!.delegate = self
        tableView!.dataSource = self
        self.tableView!.register(UINib(nibName: "MatchCardTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchCardCell")
        self.tableView!.register(UINib(nibName: "NewsItemTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsItemCell")
        view?.addSubview(tableView!)
        loadData()

    }

    @objc dynamic func loadData() { 
        MockMatchLoader().loadMatches { (matches) in 
            var newData = [Any]()

            for match in matches {
                newData.append(match)
            }

            MockNewsLoader().loadNewsFeed { (newsFeedItems) in
                for newsFeedItem in newsFeedItems {
                    newData.append(newsFeedItem)
                }

                data = newData // variable data  is not declared
                self.tableView?.reloadData()
            }
        }
    }
    //The function above is missing the parameter 'completionBlock' to the loadMatches and loadnewsFeed function. the modified implementation is given below
    
    // @objc dynamic func loadData() { 
    //     MockMatchLoader().loadMatches(completionBlock: { (matches) in 
    //         var newData = [Any]()

    //         for match in matches {
    //             newData.append(match)
    //         }

    //         MockNewsLoader().loadNewsFeed(completionBlock:{ (newsFeedItems) in
    //             for newsFeedItem in newsFeedItems {
    //                 newData.append(newsFeedItem)
    //             }

    //             data = newData
    //             self.tableView?.reloadData()
    //         }) 
    //     }) 
    // }


    func downloadImage(url: URL, completion: @escaping ((UIImage) -> (Void))) {
        let downloadTask = URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            let img = UIImage(data: data!)
            completion(img!)
        }
        downloadTask.resume()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // If we choose to displa the match details in the header then we need to have multiple headers here
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = data[indexPath.row]
        // It is preffered to take the datatypes 'Match' and 'NewsLoader' as Classes instead of Struct. Because class instances are Address type. 
        //So when the object is used multiple areas in the code their value is not copied each time but a reference is passed. 
        //So we end up changing properties of the same object in the memory

        if rowData is Match {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCardCell") as! MatchCardTableViewCell
            let match = rowData as! Match

            downloadImage(url: match.teamHomeLogoURL) { (image) -> Void in
                cell.teamHomeImageView.image = image
            }
            downloadImage(url: match.teamAwayLogoURL) { (image) -> Void in
                cell.teamAwayImageView.image = image
            }
            // In downloadImage function call above the completion parameter should be passed to the function call.
            // The modified implementation is given below

            // downloadImage(url: match.teamHomeLogoURL, completion:{ (image) -> Void in
            //     cell.teamHomeImageView.image = image
            // }) 
            // downloadImage(url: match.teamAwayLogoURL, completion:{ (image) -> Void in
            //     cell.teamAwayImageView.image = image
            // }) 

            cell.teamHomeNameLabel.text = match.teamHomeName
            cell.teamAwayNameLabel.text = match.teamAwayName

            switch match.state {
            case .finished(let score):
                cell.kickoffDateLabel.isHidden = true
                cell.kickoffTimeLabel.isHidden = true
                cell.scoreLabel.isHidden = false
                cell.scoreLabel.text = score
            case .notStarted(let kickoffDate, let kickoffTime):
                cell.kickoffDateLabel.isHidden = false
                cell.kickoffDateLabel.text = kickoffDate
                cell.kickoffTimeLabel.isHidden = false
                cell.kickoffTimeLabel.text = kickoffTime
                cell.scoreLabel.isHidden = true
            }

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsItemCell") as! NewsItemTableViewCell

            downloadImage(url: (rowData as! NewsFeedItem).imageURL) { (image) -> Void in
                cell.newsImageView.image = image
            }

            cell.previewLabel.text = (rowData as! NewsFeedItem).previewText

            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath : IndexPath) -> CGFloat {
        let rowData = data[indexPath.row]

        if rowData is Match {
            return 88
        } else if rowData is NewsFeedItem {
            return 104
        } else {
            fatalError()
        }
    }



}

