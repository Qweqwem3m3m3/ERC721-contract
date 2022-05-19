// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

import "./IERC721.sol";


interface IERC721Metadata is IERC721 {
    /*
      回傳token的名稱, memory, 只需被短暫儲存
    */
    function name() external view returns (string memory);

    /*
      回傳token的代稱, memory, 只需被短暫儲存
    */
    function symbol() external view returns (string memory);

    /*
      根據tokenid回傳所連結的URI資源, memory, 只需被短暫儲存
    */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}