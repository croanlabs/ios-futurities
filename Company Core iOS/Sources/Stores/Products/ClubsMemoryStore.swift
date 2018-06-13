//
//  ClubsMemoryStore.swift
//  Company Core iOS
//
//  Created by Ger O'Sullivan on 2018-05-19.
//  Copyright © 2018 Consensus Clubs. All rights reserved.
//

import Foundation

public struct ClubsMemoryStore: ClubsStore {
    
    public init() {
        
    }
}

private extension ClubsMemoryStore {
    
    // Used for testing; In real application, you'd create a ClubsRealmStore, ClubsCoreDataStore, or etc.
    static let clubs = [
        Club(id: 1, name: "Lorem ipsum dolor sit amet", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac tincidunt lorem, sed euismod tellus. Integer blandit massa ut fermentum varius.", priceCents: 4350, updatedAt: Date(), createdAt: Date()),
        Club(id: 2, name: "Suspendisse id erat vitae", content: "Nunc velit purus, lacinia vitae aliquam eget, vulputate non purus. Vivamus ut elit nec nibh fermentum molestie in sed risus. Integer non facilisis ipsum.", priceCents: 7599, updatedAt: Date(), createdAt: Date()),
        Club(id: 3, name: "Aenean aliquet sollicitudin", content: "Sed ex mauris, malesuada eget lacus non, pulvinar volutpat dolor. Integer a pretium nisl, nec porttitor nunc. Sed vel ligula quis lacus dignissim dignissim.", priceCents: 2750, updatedAt: Date(), createdAt: Date()),
        Club(id: 4, name: "Phasellus sagittis enim", content: "Cras at ante eget massa vulputate lacinia. Nunc aliquam odio odio, eu finibus massa dictum in. Donec enim eros, condimentum quis massa commodo, finibus scelerisque sapien.", priceCents: 12999, updatedAt: Date(), createdAt: Date()),
        Club(id: 5, name: "Cras hendrerit ac", content: "Curabitur dapibus neque sed eleifend volutpat. Pellentesque blandit neque sit amet elementum blandit. Sed gravida ante vel ligula lobortis tristique.", priceCents: 8275, updatedAt: Date(), createdAt: Date()),
        Club(id: 6, name: "Interdum et malesuada", content: "Maecenas quis blandit nibh, at luctus enim. Mauris tincidunt quis leo non accumsan. In efficitur, elit eget sagittis volutpat, neque massa posuere ligula, sagittis malesuada nisi libero ut arcu.", priceCents: 1499, updatedAt: Date(), createdAt: Date()),
        Club(id: 7, name: "Fusce euismod sed", content: "Curabitur nec purus cursus justo auctor eleifend. Nam id ultrices lorem, a interdum ex. Nullam mi mauris, pretium ac ex eu, lobortis venenatis mi. Phasellus sodales tempor finibus.", priceCents: 5500, updatedAt: Date(), createdAt: Date()),
        Club(id: 8, name: "Vestibulum tempor lectus", content: "Nullam id ipsum vel turpis posuere laoreet sed eget ante. Nunc tempus nisl sed aliquet varius. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla quam lectus, sodales id consequat ut, efficitur quis lacus.", priceCents: 6450, updatedAt: Date(), createdAt: Date()),
        Club(id: 9, name: "Vestibulum congue pulvinar", content: "Praesent consequat ipsum purus. Nulla mattis lectus ac metus finibus elementum nec ac dui. Pellentesque quis nulla iaculis, dapibus erat et, lobortis nisi. Fusce convallis quis ex ut iaculis.", priceCents: 8899, updatedAt: Date(), createdAt: Date()),
        Club(id: 10, name: "Etiam luctus nisl", content: "Fusce non tellus sit amet est faucibus accumsan. Vestibulum quam ante, semper ac nisi ut, ullamcorper molestie turpis. Quisque vulputate turpis vitae dui elementum eleifend.", priceCents: 2350, updatedAt: Date(), createdAt: Date()),
    ]
}

public extension ClubsMemoryStore {
    
    func fetch(completion: @escaping (Result<[ClubType], DataError>) -> Void) {
        completion(.success(ClubsMemoryStore.clubs))
    }
    
    func fetch(id: Int, completion: @escaping (Result<ClubType, DataError>) -> Void) {
        guard let product = ClubsMemoryStore.clubs.first(where: { $0.id == id }) else {
            return completion(.failure(.nonExistent))
        }
        
        completion(.success(product))
    }
}

public extension ClubsMemoryStore {
    
    func search(with request: ClubsModels.SearchRequest, completion: @escaping (Result<[ClubType], DataError>) -> Void) {
        let query = request.query.lowercased()
        let clubs = ClubsMemoryStore.clubs.filter {
            $0.name.lowercased().contains(query) || $0.content.lowercased().contains(query)
        }
        
        completion(.success(clubs))
    }
}
