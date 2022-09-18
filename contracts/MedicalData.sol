/// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.4;

import "./MedicalHistory.sol";

contract MedicalData {

    address public owner;
    MedicalHistory public history;
    string public appoint;
}