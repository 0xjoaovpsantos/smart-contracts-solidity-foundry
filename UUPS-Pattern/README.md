## Universal Upgradeable Proxy Standard (UUPS) - ERC-1822

Reference: https://eips.ethereum.org/EIPS/eip-1822

- First, deploy your logic contract:

```
forge create src/MyContract.sol:MyContract --private-key YOUR-PRIVATE-KEY  
```

- Then deploy your proxy contract:

```
forge create src/Proxy.sol:Proxy --private-key YOUR-PRIVATE-KEY --constructor-args 0x2e147cba ADDRESS-LOGIC-CONTRACT

```

- Now you can manipulate thought proxy contract:

```
cast send 0xb19b36b1456E65E3A6D514D3F715f204BD59f431 "increment()" --private-key YOUR-PRIVATE-KEY  
```

- If you need update your logic contract:

```
cast send ADDRESS-PROXY-CONTRACT "updateCode(address)" NEW-ADDRESS-LOGIC-CONTRACT --private-key YOUR-PRIVATE-KEY
 
```
<hr/>

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
