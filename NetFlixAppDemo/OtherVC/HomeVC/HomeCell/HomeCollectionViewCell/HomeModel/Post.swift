//
//  Post.swift
//  NetFlixAppDemo
//
//  Created by Tùng Thiện on 07/01/2023.
//

import Foundation
import SwiftyJSON
struct Results {

    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    init(_ json: JSON) {
        adult = json["adult"].boolValue
        backdropPath = json["backdrop_path"].stringValue
        genreIds = json["genre_ids"].arrayValue.map { $0.intValue }
        id = json["id"].intValue
        originalLanguage = json["original_language"].stringValue
        originalTitle = json["original_title"].stringValue
        overview = json["overview"].stringValue
        popularity = json["popularity"].doubleValue
        posterPath = json["poster_path"].stringValue
        releaseDate = json["release_date"].stringValue
        title = json["title"].stringValue
        video = json["video"].boolValue
        voteAverage = json["vote_average"].doubleValue
        voteCount = json["vote_count"].intValue
    }

}
