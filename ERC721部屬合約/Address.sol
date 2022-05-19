// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (utils/Address.sol)

pragma solidity ^0.8.1;


 /*
 library, 目的是在一個特定位址只部署一次, 其程式能讓不同的合約反覆使用. 
 任何知道library合約位址或原始碼的人都能使用. 能將共同代碼部署成library, 目的是節省Gas
 */

library Address {  
    
    function isContract(address account) internal view returns (bool) {

        /*
        透過檢查合約帳戶的代碼長度去驗證是否是contract address, 如果長度>0, 回傳True.
        如果是以下種類的地址,則回傳False
        1. externally-owned account(EOA)外部帳戶
        2. a contract in construction
        3. 將被創建之合約的地址, length = 0
        4. 合約所在的位址, 但已被銷毀, length = 0
        */

        return account.code.length > 0;
    }
    
}