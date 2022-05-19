// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

import "./IERC165.sol";

/*IERC165接口介面之實施. 任何合約想要實施ERC165合約需從此合約繼承, 
 檢查interfaceId是否支援ERC165標準
 */
abstract contract ERC165 is IERC165 {
    
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {  
        return interfaceId == type(IERC165).interfaceId;
    }
}