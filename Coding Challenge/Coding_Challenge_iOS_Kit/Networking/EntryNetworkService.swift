//
//  EntryNetworkService.swift
//  Coding Challenge
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchEntries(completion: @escaping (Result<[Entry], Error>) -> Void)
    func fetchEntry(withID id: UUID, completion: @escaping (Result<Entry, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func fetchEntries(completion: @escaping (Result<[Entry], Error>) -> Void) {
        // Perform network call to fetch entries
        // Return the result via the completion handler
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let entries: [Entry] = [
                Entry(id: UUID(), title: "The Key To Success In iPhone Photography", content: "What 2019s the secret to taking truly incredible iPhone photos? Learning how to use your iPhone camera is very important, but there 2019s something even more fundamental to iPhone photography that will help you take the photos of your dreams! Watch this video to learn some unique photography techniques and to discover your own key to success in iPhone photography!", priority: .high),
                Entry(id: UUID(), title: "How To Choose The Correct iPhone Camera Lens", content: "If your iPhone has more than one lens, how do you choose which lens to use? And which lens is best for different photography genres? It turns out that you'll get dramatically different results depending on which lens you use. Watch this video from our breakthrough iPhone Photo Academy course and discover how to choose the correct iPhone camera lens.", priority: .medium),
                Entry(id: UUID(), title: "5 Unique Ways To Release The iPhone's Shutter", content: "Most people only use one way to release the shutter button of your iPhone. But it's not always the best way to achieve great photo results. Watch this video and discover 5 unique ways to release the shutter button of your iPhone. Each way will be very useful for a different photography scenario so you can always take the best photos possible.", priority: .low),
                Entry(id: UUID(), title: "3 Secret iPhone Camera Features For Perfect Focus", content: "Do your photos sometimes look blurry? You're definitely not alone! Watch this video and discover a hidden iPhone camera feature for taking tack sharp photos. Using this simple feature will ensure that you never take a blurry iPhone photo again!", priority: .medium)
            ]
            completion(.success(entries))
        }
    }
    
    func fetchEntry(withID id: UUID, completion: @escaping (Result<Entry, Error>) -> Void) {
        // Perform network call to fetch entry with specified ID
        // Return the result via the completion handler
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let entry = Entry(id: id, title: "Entry", content: "Content", priority: .low)
            completion(.success(entry))
        }
    }
}
