//
//  TweetHandler.swift
//  CoreDataExample
//
//  Created by Corban Swain on 4/10/17.
//  Copyright © 2017 CorbanSwain. All rights reserved.
//

import Foundation
import CoreData

class TweetHandler {
    // static let tweet: NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Tweet", into: context)
    func createTweet() {
        let context = AppDelegate.viewContext
        let tweet = Tweet(context: context)
        tweet.text = "140 chars of joy"
        tweet.created = NSDate()
        let joe  = TwitterUser(context: tweet.managedObjectContext!)
        tweet.tweeter = joe
        tweet.tweeter?.name = "Joe Schmo"
    
        
        if let joesTweets = joe.tweets as? Set<Tweet> {
            if joesTweets.contains(tweet) { print("yes!") }
        }
        
        // to delete:
        tweet.managedObjectContext?.delete(tweet)
    }
    
    func createFetchRequest() {
        let request: NSFetchRequest<Tweet> = Tweet.fetchRequest() //type not infered!
        let sortDescriptor = NSSortDescriptor(key: "screenName", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
        
        let searchString = "foo"
        let yesterday = NSDate(timeIntervalSinceNow: -24*60*60)
        _ = NSPredicate(format: "text contains[c] %@", searchString)
        let joe: TwitterUser = TwitterUser(context: AppDelegate.viewContext) // a twitter user we inserted of quired from the database
        // all the tweets tweeded by joe and created after yesterday
        _ = NSPredicate(format: "tweeter = %@ && created > %@", joe, yesterday)
        
        // all tweets that were tweeted by CS193p
        _ = NSPredicate(format: "tweeter.screenName = %@", "CS193p")
        
        // all twitter users whose tweets contain foo
        _ = NSPredicate(format: "tweets.text contains %@", searchString)
        
        // nore than 5 tweets
        _ = NSPredicate(format: "tweets.@count > %@", 5)
        
        let request2 = NSFetchRequest<NSFetchRequestResult>
        request.predicate = NSPredicate(format: "any tweets.created > %@", yesterday)
        request.sortDescriptors = [sortDescriptor]
        
        let tweeters = perform(fetchRequest: request as! NSFetchRequest<NSFetchRequestResult>)
    }
    
    func perform(fetchRequest request: NSFetchRequest<NSFetchRequestResult>) -> [NSManagedObject] {
        let context = AppDelegate.viewContext
        do {
            let result = try context.fetch(request)
            return result as! [NSManagedObject]
        } catch {
            return []
        }
    }
    
}
