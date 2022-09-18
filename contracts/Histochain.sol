/// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.4;

contract Histochain {
    // Definir un dueño / Owner. Ready
    // Definir un tipo de permiso
    // Definir un tiempo de caducidad
    address private _owner;
    string _type;
    uint public pastBlockTime;

    constructor() payable {}

    function getOwner() external view returns(address) {
        return _owner;
    }

    function setTypePermission(string memory inputType) public {
        _type = inputType;
    }

    function spin() external payable {
        require(msg.value == 10 ether); // must send 10 ether to play
        require(block.timestamp != pastBlockTime); // only 1 transaction per block

        pastBlockTime = block.timestamp;

        if (block.timestamp % 15 == 0) {
            (bool sent, ) = msg.sender.call{value: address(this).balance}("");
            require(sent, "Failed to send Ether");
        }
    }
}