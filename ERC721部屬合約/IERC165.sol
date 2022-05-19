// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (utils/introspection/IERC165.sol)

pragma solidity ^0.8.0;

/* ERC165介面標準*/

interface IERC165 {
    /* 

     合約的InterfaceID是否支援所定義的標準,如果是,回傳True,否則回傳False
     標準連結 : https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     IERC確保實現合約使用正確的方法、參數以及值
     
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}