//
//  NewsModel.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import Foundation

struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [News]
}

struct News: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
