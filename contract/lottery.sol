//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;

contract Lottery{
    
    address payable[] public players; 
    address public manager; 
    // Mapping to store winners and the amount they've won
    mapping(address => uint) public winners;
    
    constructor(){
        manager = msg.sender; 
    }
    
    receive () payable external{
        require(msg.value == 0.1 ether);
        players.push(payable(msg.sender));
    }
    
    function getBalance() public view returns(uint){
        require(msg.sender == manager);
        return address(this).balance;
    }
    
    // helper function that returns a big random integer
    function random() internal view returns(uint){
       return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }
    
    
    function pickWinner() public{
        require(msg.sender == manager);
        require (players.length >= 3);
        
        uint r = random();
        address payable winner;
        
        uint index = r % players.length;
        winner = players[index]; 
        
        // transferring the entire contract's balance to the winner
        uint winAmount = getBalance();

        winner.transfer(winAmount);

        // Recording the winner and the amount in the mapping
        winners[winner] = winAmount;
        
        // resetting the lottery for the next round
        players = new address payable[](0);
    }

     // Function to query the amount won by a specific address
    function getAmountWon(address _winner) public view returns(uint) {
        return winners[_winner];
    }

}
