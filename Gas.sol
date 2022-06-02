// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Gas {
    // Example scenario

    // 1. inititalize 2 arrays
    // 2. initialize a mapping variable to make the last step possible
    // 3. Loop through the first array
    // 4. Set the element of each index in the first array as a key to the
    // 5. corresponding element at that index in the second array element with mapping

    // 1.
    string[6] public keys = ['one', 'two', 'three', 'four', 'five', 'six'];
    string[6] public values = ['mango', 'apple', 'orange', 'pineapple', 'watermelon', 'avocado'];

    // 2.
    mapping(string => string) public keysToValues;

    // 3. This step 3 is where everything changes, I'll make 3 different looping scenarios to show
    // the varying gas prices per my code approach to solve this problem
    uint256 length = values.length;
    
    // Loop 1
    function loopThroughValuesArray() public {
        for (uint256 i=0; i < length; i++) {
            mapKeysToValues(keys[i], values[i]);
        }
    }
    // Gas: 226348

    // Second loop scenario
    function SecondLoopThroughValuesArray() public {
        for (uint256 i=0; i < length;) {
            mapKeysToValues(keys[i], values[i]);
            unchecked { i++; }
        }
    }
    // Gas: 103712

    function mapKeysToValues(string memory _key, string memory _value) public {
        keysToValues[_key] = _value;
    }

}