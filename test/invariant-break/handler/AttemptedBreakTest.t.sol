// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {HandlerStatefulFuzzCatches} from "../../../src/invariant-break/HandlerStatefulFuzzCatches.sol";
import {MockUSDC} from "../../mocks/MockUSDC.sol";
import {YeildERC20} from "../../mocks/YeildERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AttemptedBreakTest is StdInvariant, Test{
        HandlerStatefulFuzzCatches handlerStatefulFuzzCatches;
        YeildERC20 yeildERC20;
        MockUSDC mockUSDC;
        IERC20[] supportedTokens;
        uint256 startingAmount;

        address user =makeAddr("user");

        function setUp() public{
          vm.startPrank(user);
          yeildERC20= new YeildERC20();
          mockUSDC= new MockUSDC();
          startingAmount=yeildERC20.INITIAL_SUPPLY();
          mockUSDC.mint(user,startingAmount);
          vm.stopPrank();

          supportedTokens.push(mockUSDC);
          supportedTokens.push(yeildERC20);

          handlerStatefulFuzzCatches = new HandlerStatefulFuzzCatches(supportedTokens);

          targetContract(address(handlerStatefulFuzzCatches));
        }


      // function testStartingAmounttheSame()public view{
      //   assert(startingAmount==yeildERC20.balanceOf(user));
      //   assert(startingAmount==mockUSDC.balanceOf(user));
      // }


      //deposit
      //1000 -> 1000 non mockusdc and yeilderc20 tokens
      //never called approved
      // function statefulFuzz_invaraintBreaks() public {
        //   vm.startPrank(user);
        //   handlerStatefulFuzzCatches.withdrawToken(mockUSDC);
        //   handlerStatefulFuzzCatches.withdrawToken(yeildERC20);
        //   vm.stopPrank();

        //   assert(mockUSDC.balanceOf(address(handlerStatefulFuzzCatches))==0); 
        //   assert(yeildERC20.balanceOf(address(handlerStatefulFuzzCatches))==0); 

        //   assert(mockUSDC.balanceOf(user)==startingAmount);
        //   assert(yeildERC20.balanceOf(user)==startingAmount);
        // }
}