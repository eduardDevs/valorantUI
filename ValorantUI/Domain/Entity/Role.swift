//
//  Role.swift
//  ValorantUI
//
//  Created by Eduard Gaya Calabuig on 2/4/25.
//

import Foundation

struct Role{
    var uuid: String
    var displayName: String
    var description: String
    var displayIcon: String
//    var assetPath: String
    
    init(dto: RoleDTO) {
        self.uuid = dto.uuid
        self.displayName = dto.displayName
        self.description = dto.description
        self.displayIcon = dto.displayIcon
    }
}
