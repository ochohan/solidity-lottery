# Lottery Smart Contract

The `Lottery` contract is a simple Ethereum-based lottery system where players can participate by sending a fixed amount of Ether. Once there are enough participants, the manager can pick a winner, who will receive the entire balance of the contract. The contract also keeps track of past winners and the amounts they've won.

## Features

- **Participation**: Players can join the lottery by sending 0.1 Ether.
- **Random Winner Selection**: The contract uses a pseudo-random number generation technique to select a winner.
- **Winner Tracking**: The contract maintains a record of all past winners and the amounts they've won.
- **Manager-Only Functions**: Certain functions, like picking a winner and checking the contract's balance, can only be executed by the manager.

## Deployment

The `Lottery` contract has been deployed on the Goerli testnet.

**Contract Address**: [0xf394121d86454f90fe203e36777d02b4bbf31d84](https://goerli.etherscan.io/address/0xf394121d86454f90fe203e36777d02b4bbf31d84)

**Transaction Link**: [https://goerli.etherscan.io/tx/0xf521d74b9089c233f83fd0daedbd93c5446d09174a3086da723ed393a9e4a457](https://goerli.etherscan.io/tx/0xf521d74b9089c233f83fd0daedbd93c5446d09174a3086da723ed393a9e4a457)

## Usage

### Participate in the Lottery

To participate in the lottery, send 0.1 Ether to the contract's address. Your address will be added to the list of players.

### Pick a Winner

Only the manager can pick a winner. Once there are at least three participants, the manager can call the `pickWinner` function to select a random winner. The winner will receive the entire balance of the contract.

### Check Amount Won

Anyone can query the amount won by a specific address using the `getAmountWon` function.

---

