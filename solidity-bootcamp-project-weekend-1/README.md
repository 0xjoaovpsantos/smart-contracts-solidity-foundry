## Foundry

# Relatory

- Contract deploy informations:
  - Deployer: 0xcAB40A0022B848D7a2D2F40D05C76da8F90260F8
  - Deployed to: 0x06d57703e0b740F3A7CAD55035cc9cdD3Fb5440B
  - Transaction hash: 0xd1d08a6eb0583aa6ed05547d991948d23d0a398a4f966c910f2b5f523edee1b5
  - Ethrescan: https://sepolia.etherscan.io/tx/0xd1d08a6eb0583aa6ed05547d991948d23d0a398a4f966c910f2b5f523edee1b5

- Script used to deploy the contract

```
forge create src/HelloWorld.sol:HelloWorld --private-key VARIABLE-PRIVATE-KEY --rpc-url VARIABLE-API-RPC-URL
```

- Call "helloWorld()" function: 
```
$ cast send 0x700b6A60ce7EaaEA56F065753d8dcB9653dbAD35 "helloWorld()" --private-key VARIABLE-PRIVATE-KEY

blockHash               0x5cbd9d9f50c392f275b1493e1043f94f7623f4a88c20f494a8d82834e9e8f80f
blockNumber             2
contractAddress
cumulativeGasUsed       24263
effectiveGasPrice       3878041359
gasUsed                 24263
logs                    []
logsBloom               0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
root
status                  1
transactionHash         0xd0ec4aebf44b70c4b5d843822c1802a0f0db92245f8388f744a78b4b4adf0959
transactionIndex        0
type                    2

```

- Call "setText(string)" function:
```
cast send 0x700b6A60ce7EaaEA56F065753d8dcB9653dbAD35 "setText(string)" "joao" --private-key VARIABLE-API-RPC-URL

blockHash               0x5d76efa8aa694e88a08b5c0da271d2ed97c5654f2dda75c644f639f9bdd52ae1
blockNumber             3
contractAddress
cumulativeGasUsed       29423
effectiveGasPrice       3768463722
gasUsed                 29423
logs                    []
logsBloom               0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
root
status                  1
transactionHash         0xa16ff7b9d53b268f0eeb5bf2d35dde1ef3cd355a95e8580b1fb4ca0548bad83c
transactionIndex        0
type                    2

```

- Call "transferOwnership(address)" function:
```
cast send 0x700b6A60ce7EaaEA56F065753d8dcB9653dbAD35 "transferOwnership(address)" 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --private-key VARIABLE-PRIVATE-KEY

blockHash               0x12af9a1c7a81dd82eec93a9457ccaceb2323ed870918894af80e43b02ff34d87
blockNumber             4
contractAddress
cumulativeGasUsed       26952
effectiveGasPrice       3672594178
gasUsed                 26952
logs                    []
logsBloom               0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
root
status                  1
transactionHash         0x073947b5d9334c7a82fde261adb7b5b6a2224c2667bc314524a601c7a049dca0
transactionIndex        0
type                    2

```

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
