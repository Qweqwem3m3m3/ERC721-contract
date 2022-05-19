// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

pragma solidity ^0.8.0;

 /* 提供當前執行者的相關訊息, 內容包含了交易的發送者合約地址與其數據*/

abstract contract Context {   
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
/*抽象合約,繼承此合約的子合約必須重寫抽象合約中的函數,否則子合約也會被認定為抽象合約. 
internal只能被合約內部或繼承的合約呼叫, 此fuction是查交易發送者之地址*/

    function _msgData() internal view virtual returns (bytes calldata) { //此function是查交易發送者之數據
        return msg.data;
    }
    /*calldata是包含函數參數的數據位置, 僅可使用外部合約函數呼叫參數. 此function是查交易發送者之數據*/
}