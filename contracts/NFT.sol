// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

// we will bring in the openzeppelin ERC721  NFT functionality

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';  // this contract inherits ERC721
// because this contract inherits ERC721, we can use ERC721 in the constructor below

import '@openzeppelin/contracts/utils/Counters.sol'; // for safe math, makes smart contracts more robust and safer. 
                                        // for minting functionality, incrementing, decrementing, and keeping track of amounts of tokens

contract NFT is ERC721URIStorage { // we inherit the URIStorage, which allows us to setup our URI to IPFS and to store that info.
    using Counters for Counters.Counter; // ability to setup counters to specific data
    Counters.Counter private _tokenIds; // if we wanted to keep track of token IDs

    address contractAddress;     // address of marketplace for NFTs to interact

    // OBJ: give the NFT market the ability to transact with tokens or change ownership
    // setApprovalForAll allows us to do that with contract address 

    // constructor set up our address
    constructor(address marketplaceAddress) ERC721('Mazi NFT', 'MAZI'){
        contractAddress = marketplaceAddress;
    }

    function mintToken(string memory tokenURI) public returns(uint) {
        _tokenIds.increment();  // increment token ID  // exists in @openzeppelin/contracts/utils/Counters.sol
        uint256 newItemId = _tokenIds.current();  // get current tokenId // exists in @openzeppelin/contracts/utils/Counters.sol
       
        // the following functions exists in @openzeppelin/contracts/token/ERC721/ERC721.sol
        
        _mint(msg.sender, newItemId); // needs address and tokenID to mint 
        _setTokenURI(newItemId, tokenURI);  // set the token URI: id and url -> so that URI gets passed in with info

        setApprovalForAll(contractAddress, true); // give the marketplace the approval to transact between users. 
        // MAZI NFT can now approve to transact between users.

        return newItemId; // since we minted the token, we can set it for sale by returning the id 


    }
}

