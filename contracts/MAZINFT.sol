// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

// we will bring in the openzeppelin ERC721  NFT functionality

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol'; // security against transactions for multiple requests

import '@openzeppelin/contracts/utils/Counters.sol'; // for safe math, makes smart contracts more robust and safer. 
                                        // for minting functionality, incrementing, decrementing, and keeping track of amounts of tokens

import 'hardhat/console.sol';

contract MAZINFT is ReentrancyGuard {
    // we want to track the # of items minting, # of transactions, # of NFTs that have not been sold
    // we want to keep track tokens total # w/ tokenId
    // in Solidity, arrays need to know the length
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    Counters.Counter private _tokensSold;
    
    // determine who is the owner of the contract
    // charge a listing fee so the owner makes a commission

    address payable owner;
    uint256 listingPrice = 0.045 ether;

    constructor(){
        // set the owner
        owner = payable(msg.sender);
    }

    // we cannot create objects in Solidity but we can create structs
    struct MarketToken {
        uint itemId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    // mapping creates a database and we can access it in different ways

    mapping(uint256 => MarketToken) private idToMarketToken; // tokenId return which MarketToken - fetch which one it is

    // listen to events from front end applications 
    event MarketTokenMinted(
        uint indexed itemId,
        address indexed nftContract,
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sold
    );

    // get the listing price
    function getListingPrice() public view returns (uint256) {
        return listingPrice;
    }

    // we need 2 functions to interact with the contract 
      // 1. one function that creates a market item to put it up for sale (mints)
      // 2. one function 

    function mintMarketItem(address nftContract, uint tokenId, uint price) public payable nonReentrant { // nonReentrant is a modifier to prevent reentry attack

        require(price > 0, 'Price must be at least one wei');
        require(msg.value == listingPrice, 'Price must be equal to listing price');
        _tokenIds.increment();
        uint itemId = _tokenIds.current();

        // putting it up for sale - bool - no owner
        idToMarketToken[itemId] = MarketToken(
            itemId,
            nftContract,
            tokenId,
            payable(msg.sender),
            payable(address(0)),
            price,
            false
        );

       // NFT Transaction -> posts NFT to marketplace
       IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);  // transferFrom exists in @openzeppelin/contracts/token/ERC721/IERC721.sol
       
       emit MarketTokenMinted(
        itemId, 
        nftContract, 
        tokenId, 
        msg.sender, 
        address(0), 
        price, 
        false
    );

    }
      // function to conduct transactions and market sales
      function createMarketSale(address nftContract, uint itemId) public payable nonReentrant {
        uint price = idToMarketToken[itemId].price;
        uint tokenId = idToMarketToken[itemId].tokenId;
        require(msg.value == price, 'Please submit the asking price in order to continue');

        // transfer amount to seller 
        idToMarketToken[itemId].seller.transfer(msg.value);

        // transfer the token from contract address to the buyer
        IERC721(nftContract).transferFrom(address(this), msg.sender, tokenId);
        

      }

      


    
}