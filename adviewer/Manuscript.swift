//
//  Experimental.swift
//  AsciidocEdit
//
//  Created by James Carlson on 8/19/14.
//  Copyright (c) 2014 James Carlson. All rights reserved.
//

import Foundation


// Class Manuscript provides utilities for discovering the 
// assets (image, video, audio) of an archive.
class Manuscript {
    

    var root: String
    var filePath: String
    var url: String?
    var title: String?
    var notebook_name: String?
    var notebook_id: String?
    var domain: String?
    var archiveURL: String?
    var manuscript: String?
    var includeList: [String]?
    var imageList: [String]?
    var videoList: [String]?
    var audioList: [String]?
    var dictionary: [String: String]?
    
    init(docPath: String) {
        
        self.filePath = docPath
        self.root = File.directoryOf(self.filePath)
        
    }
    
    func macro_path() -> String {
        
       return root + "/macros.tex"
    
    }
    
    
    func foobar (url: String) -> String {
        
       
        let notebook = File.baseName(url)
        let name = notebook.componentsSeparatedByString(".")[0]
        println("Notebook: \(name)")
        return name
        
    }


    
    func parseURL (url: String) {
        
        println("\n\n\n")
        
        println("1: URL = \(url)")
        
        let path = pathFromURL(url)
        let path_part = path.pathComponents
        domain = path_part[0]
        println("Domain: \(domain)")
        
        let data = File.segment(url, 2)
        let part = data.componentsSeparatedByString("/")
        notebook_id = part[0]
        
        let archiveList = ["http:/", domain!, "courses", notebook_id!, "edit?archive=yes&remote=true"]
        
        archiveURL = archiveList.join("/")  // ARCHVE URL IS OK
        
        println("Notebook ID: \(notebook_id)")
        
        println("archiveURL: \(archiveURL)")

        println("\n\n\n")
    }
    
    
    func load() {
        
        println("in Manuscript, filePath =  \(self.filePath)")
        manuscript = File.read(self.filePath)
        
        let dir = directoryPath(self.filePath)
        println("Directory path: \(dir)")
        
        getIncludeList()
        getImageList()
        getVideoList()
        getAudioList()
        // setupDictionary()
        
    }
    
    func getIncludeList() {
        
        func clean(var x: String) -> String {
            
            x = x.stringByReplacingOccurrencesOfString("include::", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            x = x.stringByReplacingOccurrencesOfString("[", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            return x
        
        }
        
        let includeRx = "include::.*\\["
        var array = includeRx.match(manuscript!)
        includeList = array.map(clean)
        println("\nIncludes (\(includeList!.count)): \(includeList!)")
        
    }
    
    func getImageList() {
        
        imageList = getAssetList("image")
        println("\nImages  (\(imageList!.count)): \(imageList!)")
    
    }
    
    func getVideoList() {
        
        videoList = getAssetList("video")
        println("\nVideos  (\(videoList!.count)): \(videoList!)")
    }
    
    func getAudioList() {
        
        audioList = getAssetList("audio")
        println("\nAudio Files  (\(audioList!.count)): \(audioList!)")
    }
    
    
    func gitURL() -> String {
        
        return ""
    }
    
    func xclean(var x: String, assetType: String) -> String {
        
        x = x.stringByReplacingOccurrencesOfString("\(assetType)::", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        x = x.stringByReplacingOccurrencesOfString("[", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return x
        
    }
    
    typealias str2strFun = (x: String) -> String
    

    
    func getAssetList(assetType: String) -> [String] {
        
        let clean = { (x: String) -> String in self.xclean(x, assetType: assetType)}
        
        let dir = directoryPath(self.filePath)
        
        var assetList = [String]()
        
        for file in includeList! {
            
            let path = dir + "/" + file
            let contents = File.read(path)
            
            let assetRx = "\(assetType)::.*\\["
            var array = assetRx.match(contents) as [String]
            array = array.map(clean)
            assetList = assetList + array
            
            
        }
        
        return assetList
    }
    
   
    
}
