//
//  ArtWork.swift
//  SwiftTest
//
//  Created by Preetham Dsouza on 25/06/2014.
//  Copyright (c) 2014 company. All rights reserved.
//

import Foundation

class ArtWork: NSObject
{
 
    var trackName: String?
    var artistName: String?
    var artworkUrl: String?
    var collectionPrice:String?
    var previewUrl:String?
    var primaryGenreName:String?
    var shortDescription:String?
    var trackViewUrl:String?
    
    init(trackName:String?,artistName:String?,artworkUrl:String?,collectionPrice:String?,previewUrl:String?,primaryGenreName:String?,shortDescription:String?,trackViewUrl:String?)
    {
            
        self.trackName = trackName
        self.artistName = artistName
        self.artworkUrl = artworkUrl
        self.collectionPrice = collectionPrice
        self.previewUrl = previewUrl
        self.primaryGenreName = primaryGenreName
        self.shortDescription = shortDescription
        self.trackViewUrl = trackViewUrl
        
    }
        
    
    
}
