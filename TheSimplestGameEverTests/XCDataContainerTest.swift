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
        DataContainer.shared.nullifySelf()
    }

    override func tearDownWithError() throws {
        
    }

    func test_get_and_set_player_num_of_tries() {
        DataContainer.shared.setPlayerNumOfTries(num: 100)
        let playerTries = DataContainer.shared.getPlayerNumOfTries()
        XCTAssertTrue(playerTries == 100)
    }
    
    func test_get_and_set_computer_num_of_tries() {
        DataContainer.shared.setCmputerNumOfTries(num: 99)
        let computerTries = DataContainer.shared.getComputerNumOfTries()
        XCTAssertTrue(computerTries == 99)
    }
    
    func test_get_and_set_players_number() {
        DataContainer.shared.setPlayersNumber(num: 5)
        let playersNumber = DataContainer.shared.getPlayersNumber()
        XCTAssertTrue(playersNumber == 5)
    }
    
    func test_get_and_set_computers_number() {
        DataContainer.shared.setComputersNumber(num: 4)
        let playersNumber = DataContainer.shared.getComputersNumber()
        XCTAssertTrue(playersNumber == 4)
    }
}
