// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract EnumDemo{
    enum ShirtSize {XSMALL, SMALL, MEDIUM, LARGE, XLARGE, XXLARGE}

    ShirtSize public choice;
    ShirtSize public constant defaultChoice = ShirtSize.MEDIUM;

    function PickSmallSize() public {
        choice = ShirtSize.SMALL;
    }

    function PickLargeSize() public {
        choice = ShirtSize.LARGE;
    }

    function SetChoice(ShirtSize selectedChoice) public{
        choice = selectedChoice;
    }
}