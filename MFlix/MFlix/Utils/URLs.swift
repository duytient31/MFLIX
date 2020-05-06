//
//  URLs.swift
//  MFlix
//
//  Created by Viet Anh on 5/5/20.
//  Copyright © 2020 VietAnh. All rights reserved.
//

import Foundation

enum URLs {
    
    enum Image {
        static let original = "https://image.tmdb.org/t/p/original"
        static let w500 = "https://image.tmdb.org/t/p/w500"
    }
    
    enum API {
        private static var apiBaseURL = "https://api.themoviedb.org/3"
        static let movie = apiBaseURL + "/movie"
    }
}
