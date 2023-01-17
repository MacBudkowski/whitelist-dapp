// SPDX License Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
// Max number of whitelisted addresses

    uint8 public maxWhitelistedAddresses;

// Create a mapping of whitelisted addresses. If the address is whitelisted it'd answer True, otherwise it's False

    mapping(address => bool) public whitelistedAddresses;

// numAddressesWhitelisted will be used for reviewing how many of them were listed

    uint8 public numAddressesWhitelisted;
    

// Setting the max number of whitelisted addresses. User will put the value at the time of deployment.
    
    constructor (uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

/** 
 addAddressToWhitelist - this function adds the addres of the sender to the whitelist
 */

function addAddressToWhitelist() public {
// check if the user has been whitelisted
require(!whitelistedAddresses[msg.sender], "Sender has been already whitelisted");
// check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error. 
require(numAddressesWhitelisted < maxWhitelistedAddresses, "Limit reached. More addresses can't be added.");
// Add the address which called the function to the whitelistedAddress array
whitelistedAddresses[msg.sender] = true;
// increase the number of whitelisted addresses
numAddressesWhitelisted += 1;
}

}
