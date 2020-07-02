//
//  Presenter.swift
//  Fetcher
//
//  Created by Ali Hassan on 29/06/2020.
//  Copyright © 2020 Ali Hassan. All rights reserved.
//

import Foundation

class Presenter {
    
    weak var view: IViewController?
    var musicItems: [MusicItem] = []
    private var musicWebService: IMusicWebService?
    

    init(musicWebService: IMusicWebService = MusicWebService()) {
        self.musicWebService = musicWebService
    }
    
    func searchDidChange(_ search: String) {
        musicWebService?.getMediaForSearchTerm(search, success: { musicItems in
            self.musicItems = musicItems
            DispatchQueue.main.async {
                self.view?.reloadTableView()
            }
        }, failure: {
            
        })
    }
    
}
