## Delete item form array

1. Write a function that will delete items (one at a time) from a dynamic array without leaving gaps in the array. You should assume that the items to be deleted are chosen at random, and try to do this in a gas efficient manner. For example imagine your array has 12 items and you need to delete the items at indexes 8, 2 and 7. The final array will then have items {0,1,3,4,5,6,9,10,11}

#Example calls:

```bash
forge create src/DeleteItemArray.sol:DeleteItemArray --private-key YOUR-PRIVATE-KEY --constructor-args [0,1,2,3,4,5]
```

```bash
cast send CONTRACT-ADDRESS "removeItemAtIndexWithOrder(uint index)" 1 --private-key YOUR-PRIVATE-KEY
```

```bash
cast send CONTRACT-ADDRESS "consoleLogMyArray()" --private-key YOUR-PRIVATE-KEY
```

```bash
cast send CONTRACT-ADDRESS "removeItemAtIndexWithoutOrder(uint index)" 2 --private-key YOUR-PRIVATE-KEY
```

```bash
cast send CONTRACT-ADDRESS "consoleLogMyArray()" --private-key YOUR-PRIVATE-KEY
```


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
