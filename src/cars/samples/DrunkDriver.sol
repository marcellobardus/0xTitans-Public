// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./../../interfaces/ICar.sol";

contract DrunkDriver is ICar {
  uint256 internal constant ACCEL_FLOOR = 50;
  uint256 internal constant SHELL_FLOOR = 200;
  uint256 internal constant SUPER_SHELL_FLOOR = 200;
  uint256 internal constant BANANA_FLOOR = 100;
  uint256 internal constant SHIELD_FLOOR = 400;

  function takeYourTurn(
    Monaco monaco,
    Monaco.CarData[] calldata allCars,
    uint256[] calldata bananas,
    uint256 ourCarIndex
  ) external {
    bytes32 someThrash = blockhash(block.number - 1);

    uint256 stupidRandomNumber1 = uint256(someThrash >> (64 * 3)); // ACC
    uint256 stupidRandomNumber2 = uint256(someThrash >> (64 * 2)); // SHELL
    uint256 stupidRandomNumber3 = uint256(someThrash >> (64 * 1)); // BANANA
    uint256 stupidRandomNumber4 = uint256(someThrash >> (64 * 0)); // SHIELD

    // Pick biggest random number

    uint256 biggestRandomNumber = stupidRandomNumber1;
    string memory action = "ACC";

    if (stupidRandomNumber2 > biggestRandomNumber) {
      biggestRandomNumber = stupidRandomNumber2;
      action = "ACC";
    }
    if (stupidRandomNumber3 > biggestRandomNumber) {
      biggestRandomNumber = stupidRandomNumber3;
      action = "SHELL";
    }
    if (stupidRandomNumber4 > biggestRandomNumber) {
      biggestRandomNumber = stupidRandomNumber4;
      action = "SHIELD";
    }

    // TODO use these random numbers to make decisions

    if (keccak256(abi.encodePacked(action)) == keccak256("ACC")) {
      monaco.buyAcceleration(1);
    }
    if (keccak256(abi.encodePacked(action)) == keccak256("SHELL")) {
      monaco.buyShell(1);
    }
    if (keccak256(abi.encodePacked(action)) == keccak256("BANANA")) {
      monaco.buyBanana();
    }
    if (keccak256(abi.encodePacked(action)) == keccak256("SHIELD")) {
      monaco.buyShield(1);
    }
  }

  function sayMyName() external pure returns (string memory) {
    return "DrunkDriver";
  }
}
