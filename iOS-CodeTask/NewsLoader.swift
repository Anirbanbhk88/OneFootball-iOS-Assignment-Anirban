import Foundation

// Mocks an actual networking class to simplify the example.
class MockNewsLoader {
    func loadNewsFeed(completionBlock: (([NewsFeedItem]) -> Void)) {
        let news1 = NewsFeedItem(id: "1",
                                 imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578576539230-news_1.jpg")!,
                                 previewText: "Life after Messi: How will Barça survive without the best in history?")

        let news2 = NewsFeedItem(id: "2",
                                 imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578577777699-news_2.jpg")!,
                                 previewText: "Bayern Munich sporting director gives update on Leroy Sané interest")

        let news3 = NewsFeedItem(id: "3",
                                 imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578577853762-news_3.jpg")!,
                                 previewText: "Sir Alex Ferguson 'devastated' by Man United's dismal derby defeat")

        let news4 = NewsFeedItem(id: "4",
                                 imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578578395590-news_4.jpg")!,
                                 previewText: "Espanyol smash club record to sign Raul de Tomas for €20m from Benfica")

        let news5 = NewsFeedItem(id: "5",
                                 imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578578491849-news_5.jpg")!,
                                 previewText: "How Gareth Bale could follow in the footsteps of David Beckham")

        let news6 = NewsFeedItem(id: "6",
                                 imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578582096173-news_6.jpg")!,
                                 previewText: "Chelsea offered Atletico Madrid star to bolster attacking options")

        let news7 = NewsFeedItem(id: "7",
                                 imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578582147720-news_7.jpg")!,
                                 previewText: "West Ham agree 'deal in principle' to sign Gedson Fernandes")

        let news8 = NewsFeedItem(id: "8",
                                 imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578582193731-news_8.jpg")!,
                                 previewText: "Wanda Nara: Icardi Will Decide Future at Paris Saint-Germain")

        let news9 = NewsFeedItem(id: "9",
                                 imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578582298909-news_9.jpg")!,
                                 previewText: "Gianluca Di Marzio: “Ashley Young Only Wants Inter & Declines Man Utd Contract Offer”")

        let news10 = NewsFeedItem(id: "10",
                                  imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578582309775-news_10.jpg")!,
                                  previewText: "Photos: Agent of €25m Inter winger at AC Milan headquarters to discuss deal")

        let news11 = NewsFeedItem(id: "11",
                                  imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578582592578-news_11.jpg")!,
                                  previewText: "Man City looking to raid Real Madrid for two players – £93 million price mentioned")

        let news12 = NewsFeedItem(id: "12",
                                  imageURL: URL(string: "https://filebucket.onefootball.com/2020/1/1578582647019-news_12.jpg")!,
                                  previewText: "Arteta 'not expecting big things' for Arsenal in transfer window")

        completionBlock([news1, news2, news3, news4, news5, news6, news7, news8, news9, news10, news11, news12])
    }
}
