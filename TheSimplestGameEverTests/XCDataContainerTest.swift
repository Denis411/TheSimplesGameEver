//
//  XCDataContainerTest.swift
//  TheSimplestGameEverTests
//
//  Created by Dennis Loskutov on 16.04.2022.
//

import XCTest
@testable import TheSimplestGameEver

class XCDataContainerTest: XCTestCase {
    var dataContainer = DataContainer(playersNumber: 0, computersNumber: 0)
    
    override func setUpWithError() throws {
        dataContainer.nullifySelf()
    }

    override func tearDownWithError() throws {
        
    }

    func test_get_and_set_player_num_of_tries() {
        dataContainer.setPlayerNumOfTries(num: 100)
        let playerTries = dataContainer.getPlayerNumOfTries()
        XCTAssertTrue(playerTries == 100)
    }
    
    func test_get_and_set_computer_num_of_tries() {
        dataContainer.setCmputerNumOfTries(num: 99)
        let computerTries = dataContainer.getComputerNumOfTries()
        XCTAssertTrue(computerTries == 99)
    }
    
    func test_get_and_set_players_number() {
        dataContainer.setPlayersNumber(num: 5)
        let playersNumber = dataContainer.getPlayersNumber()
        XCTAssertTrue(playersNumber == 5)
    }
    
    func test_get_and_set_computers_number() {
        dataContainer.setComputersNumber(num: 4)
        let playersNumber = dataContainer.getComputersNumber()
        XCTAssertTrue(playersNumber == 4)
    }
}
