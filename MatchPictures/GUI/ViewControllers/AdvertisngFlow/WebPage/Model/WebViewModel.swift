//
//  WebViewModel.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation

final class WebViewModel {

    private let moduleInput: ModuleInput

    // MARK: - Init/Deinit

    init(moduleInput: ModuleInput) {
        self.moduleInput = moduleInput
    }

}

// MARK: - WebViewModelProtocol

extension WebViewModel: WebViewModelProtocol {

    var webPageRequest: URLRequest? {
        guard let url = moduleInput.urlPath.url else { return nil }
        return URLRequest(url: url)
    }

}
