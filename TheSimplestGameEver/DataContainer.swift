//
//  DataContainer.swift
//  TheSimplestGameEver
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import Foundation
import UIKit

class DataContainer: DataContainerProtocol {
    static var shared = DataContainer(playersNumber: -1, computersNumber: -1)
    
    var playerNumOfTries: Int8
    var playersNumber: Int8
    var computerNumOfTries: Int8
    var computersNumber: Int8
    
    init(playerNumOfTries: Int8, playersNumber: Int8, computerNumOfTries: Int8, computersNumber: Int8 ) {
        self.playerNumOfTries = playerNumOfTries
        self.playersNumber = playersNumber
        self.computerNumOfTries = computerNumOfTries
        self.computersNumber = computersNumber
    }
    
//  nullify tries
    convenience init(playersNumber: Int8, computersNumber: Int8) {
        self.init(playerNumOfTries: 0, playersNumber: playersNumber, computerNumOfTries: 0, computersNumber: computersNumber)
    }
}

protocol DataContainerProtocol {
    var playerNumOfTries: Int8 { set get }
    var playersNumber: Int8 { set get }
    var computerNumOfTries: Int8 { set get }
    var computersNumber: Int8 { set get }
}

extension DataContainerProtocol {
    //   MARK: - player
    mutating func setPlayerNumOfTries(num: Int8) {
        self.playerNumOfTries = num
    }
    
    mutating func setPlayersNumber(num: Int8) {
        self.playersNumber = num
    }
    
    mutating func getPlayerNumOfTries() -> Int8 {
        self.playerNumOfTries
    }
    
    mutating func getPlayersNumber() -> Int8 {
        self.playersNumber
    }
    
    //   MARK: - computer
    mutating func setCmputerNumOfTries(num: Int8) {
        self.computerNumOfTries = num
    }
    
    mutating func setComputersNumber(num: Int8) {
        self.computersNumber = num
    }
    
    mutating func getComputerNumOfTries() -> Int8 {
        self.computerNumOfTries
    }
    
    mutating func getComputersNumber() -> Int8 {
        self.computersNumber
    }
    
    mutating func nullifySelf() {
        self.playerNumOfTries = 0
        self.playersNumber = 0
        self.computerNumOfTries = 0
        self.computersNumber = 0 
    }
}
