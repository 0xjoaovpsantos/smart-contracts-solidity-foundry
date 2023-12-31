// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import "./Ownable.sol";

contract GasContract is Ownable {
    uint256 public totalSupply = 0; // cannot be updated
    mapping(address => uint256) public balances;
    address public contractOwner;
    mapping(address => uint256) public whitelist;
    address[5] public administrators;

    mapping(address => uint256) public whiteListStruct;

    //keccak-256(AddedToWhitelist(address,uint256))
    bytes32 private constant ADDED_TO_WHITELIST_EVENT_SIGNATURE =
        0x62c1e066774519db9fe35767c15fc33df2f016675b7cc0c330ed185f286a2d52;

    event AddedToWhitelist(address userAddress, uint256 tier);

    modifier onlyAdminOrOwner() {
        address senderOfTx = msg.sender;
        if (checkForAdmin(senderOfTx)) {
            require(checkForAdmin(senderOfTx), "Gas Contract Only Admin Check-  Caller not admin");
            _;
        } else if (senderOfTx == contractOwner) {
            _;
        } else {
            revert(
                "Error in Gas contract - onlyAdminOrOwner modifier : revert happened because the originator of the transaction was not the admin, and furthermore he wasn't the owner of the contract, so he cannot run this function"
            );
        }
    }

    modifier checkIfWhiteListed(address sender) {
        address senderOfTx = msg.sender;
        require(
            senderOfTx == sender,
            "Gas Contract CheckIfWhiteListed modifier : revert happened because the originator of the transaction was not the sender"
        );
        uint256 usersTier = whitelist[senderOfTx];
        require(
            usersTier > 0,
            "Gas Contract CheckIfWhiteListed modifier : revert happened because the user is not whitelisted"
        );
        require(
            usersTier < 4,
            "Gas Contract CheckIfWhiteListed modifier : revert happened because the user's tier is incorrect, it cannot be over 4 as the only tier we have are: 1, 2, 3; therfore 4 is an invalid tier for the whitlist of this contract. make sure whitlist tiers were set correctly"
        );
        _;
    }

    event supplyChanged(address indexed, uint256 indexed);
    event Transfer(address recipient, uint256 amount);
    event WhiteListTransfer(address indexed);

    constructor(address[] memory _admins, uint256 _totalSupply) {
        balances[msg.sender] = _totalSupply;

        assembly {
            sstore(totalSupply.slot, _totalSupply)
            sstore(contractOwner.slot, caller())

            for { let index := 0 } lt(index, 5) { index := add(index, 1) } {
                let value := mload(add(_admins, mul(0x20, add(index, 1))))
                sstore(add(administrators.slot, index), value)
            }
        }
    }

    function checkForAdmin(address _user) public view returns (bool admin_) {
        assembly {
            admin_ := false
            for { let ii := 0 } lt(ii, administrators.slot) { ii := add(ii, 1) } {
                let slot := sload(administrators.slot)
                let value := shr(mul(administrators.offset, ii), slot)
                if eq(value, _user) { admin_ := true }
            }
        }
    }

    function balanceOf(address _user) public view returns (uint256 balance_) {
        uint256 balance = balances[_user];
        return balance;
    }

    function transfer(address _recipient, uint256 _amount, string calldata _name) public {
        require(balances[msg.sender] >= _amount, "Gas Contract - Transfer function - Sender has insufficient Balance");
        require(
            bytes(_name).length < 9,
            "Gas Contract - Transfer function -  The recipient name is too long, there is a max length of 8 characters"
        );

        assembly {
            let freeMemoryPointer := mload(0x40)
            mstore(freeMemoryPointer, caller())
            mstore(add(freeMemoryPointer, 0x20), balances.slot)
            let senderSlot := keccak256(freeMemoryPointer, 0x40)
            sstore(senderSlot, sub(sload(senderSlot), _amount))

            mstore(freeMemoryPointer, _recipient)
            mstore(add(freeMemoryPointer, 0x20), balances.slot)
            let recipientSlot := keccak256(freeMemoryPointer, 0x40)
            sstore(recipientSlot, add(sload(recipientSlot), _amount))
        }
    }

    function addToWhitelist(address _userAddrs, uint256 _tier) public onlyAdminOrOwner {
        require(_tier < 255, "Gas Contract - addToWhitelist function -  tier level should not be greater than 255");
        whitelist[_userAddrs] = _tier;
        if (_tier > 3) {
            whitelist[_userAddrs] = 3;
        } else {
            whitelist[_userAddrs] = _tier;
        }

        assembly {
            mstore(0x00, _userAddrs)
            mstore(0x20, _tier)
            log1(0x00, 64, ADDED_TO_WHITELIST_EVENT_SIGNATURE)
        }

        // emit AddedToWhitelist(_userAddrs, _tier);
    }

    function whiteTransfer(address _recipient, uint256 _amount) public checkIfWhiteListed(msg.sender) {
        whiteListStruct[msg.sender] = _amount;

        require(
            balances[msg.sender] >= _amount, "Gas Contract - whiteTransfers function - Sender has insufficient Balance"
        );
        require(_amount > 3, "Gas Contract - whiteTransfers function - amount to send have to be bigger than 3");
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
        balances[msg.sender] += whitelist[msg.sender];
        balances[_recipient] -= whitelist[msg.sender];

        emit WhiteListTransfer(_recipient);
    }

    function getPaymentStatus(address sender) public returns (bool, uint256) {
        return (true, whiteListStruct[sender]);
    }

    receive() external payable {
        payable(msg.sender).transfer(msg.value);
    }

    fallback() external payable {
        payable(msg.sender).transfer(msg.value);
    }
}
