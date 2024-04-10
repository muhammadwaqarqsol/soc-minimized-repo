// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;
import {Test} from "forge-std/Test.sol";
import {StatefulFuzzCatches} from "../../src/invariant-break/StatefulFuzzCatches.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
contract StatefullFuzzCatchesTest is StdInvariant,Test{
        StatefulFuzzCatches statefulFuzzCatches;

        function setUp() public {
          statefulFuzzCatches = new StatefulFuzzCatches();
          targetContract(address(statefulFuzzCatches));
        }

        function testDoMoreMathAgain(uint128 randomNumber) public{
          assert(statefulFuzzCatches.doMoreMathAgain(randomNumber)!=0);
        }

        function statefulFuzz_catchesInvariant()public view{
          assert(statefulFuzzCatches.storedValue()!=0);
        }
}