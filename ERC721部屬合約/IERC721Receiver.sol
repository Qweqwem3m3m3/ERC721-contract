// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC721/IERC721Receiver.sol)

pragma solidity ^0.8.0;

 //safeTransfer合約的接口

interface IERC721Receiver {  
    /*IERC721Receiver 防止token被永久鎖定在合約中, 此合約會檢查接收者是否為核可的IERC721Receiver, 
    透過IERC721.onERC721Received.selector選擇器確認tokenid轉移, 與function _safeTransfer和 event Transfer 功能相依*/
    
    function onERC721Received(
        address operator, //操作者合約地址
        address from,     // 合約地址 from
        uint256 tokenId,  
        bytes calldata data
    ) external returns (bytes4);
    /*tokenid必須歸屬於from合約地址, 且呼叫者必須是from或是已經被function approve 核可權限
    另外, to 地址若屬於合約, 須符合IERC721Receiver.IERC721.onERC721Received fuction才能觸發Transfer事件安全轉移token*/
}