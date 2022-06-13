// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MintNFT is ERC721Enumerable, Ownable {
    mapping(uint => string) public metadataURIs;
    
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}
    
    function mintNFT() public {
        uint tokenId = totalSupply() + 1;

        _mint(msg.sender, tokenId);
    }

    function setTokenURI(uint _tokenId, string memory _metadataURI) public onlyOwner {
        metadataURIs[_tokenId] = _metadataURI;
    }

    function tokenURI(uint _tokenId) override public view returns (string memory) {
        return metadataURIs[_tokenId];
    }
}