// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; 
/*引入父合約, 繼承父合約的屬性與方法, 內容包括以下*/
// tokenURI : 透過合約訪問對應的tokenid儲存在IPFS的metadata文件，以NFT舉例而言，就是圖片。
// baseURI : token與URI做鏈接
// approve : 授權"to" 合約位址操作tokenid
// getApprove : tokenid的操作員位址
// setApprovalForAll : 啟用或禁用操作員權限，觸發ApprovalForAll事件
// isApprovalForAll : 確認operator位址是否為owner操作員的位址
// safeTransferfrom : 從 from 位址轉移NFT tokenId的所有權到 to 位址，檢查呼叫者是否為擁有者或被授權者
// sageTransfer : 安全的將tokenid從from轉移到to，必須先檢查合約接收者
// exists : 檢查tokenid是否存在
// isApprovedOrOwner : 檢查是否有權限管理tokenid
// safeMint : 安全的鑄造tokenid並且轉移到to，data為附加數據
// burn : 摧毀tokenid，以及與其相關的data 觸發事件transfer

import "@openzeppelin/contracts/access/Ownable.sol"; 
/*引入父合約, 繼承父合約的屬性與方法, 內容包括以下*/
// owner : 回傳擁有者合約地址
// renounceOwnership : 放棄所有權，將使onlyOwner()失效
// transferOwnership : 轉移所有權，只有擁有者有權限轉移

contract MintContract is ERC721, Ownable {  //繼承 ERC721 以及 Ownable 合約
    uint256 public mintPrice = 0.0005 ether; //mint價格, Remix ide無法輸入小數，所以必須將ether轉換成相對應的Wei
    uint256 public totalSupply = 10; //設定總發行量
    uint256 public maxSupply; //最大發行量
    bool public isMintEnabled; //啟用mint
    mapping(address => uint256) public mintedWallets; //映射, 追蹤每個錢包已經mint的數量
    
    


    constructor() payable ERC721('Mint', 'MINT'){  //名稱(name): Mint 、 代稱(symbol): MINT
        maxSupply = 2; //最大發行量 = 2
    }

    function toggleIsMintEnabled() external onlyOwner{
        isMintEnabled = ! isMintEnabled;
    }
    /*擁有者才能執行此合約*/

    function setMaxSupply(uint256 maxSupply_) external onlyOwner{
        maxSupply = maxSupply_; 
    }
    /*只有擁有者可以更改最大發行量*/

    function mint() external payable {
        require(isMintEnabled, 'minting not enabled'); //檢查是否mint失敗,回傳錯誤訊息
        require(mintedWallets[msg.sender] < 1, 'exceeds max per wallet'); //每個錢包只能mint一個NFT 
        require(msg.value == mintPrice, 'wrong value'); //檢查是否以正確的價格mint
        require(maxSupply > totalSupply, 'sold out'); //限制最大發行量不會 > 總發行量

        mintedWallets[msg.sender]++; //追蹤發行量
        totalSupply++; 
        uint256 tokenid = totalSupply; //區域變數,省gas
        _safeMint(msg.sender, tokenid); //確保mint正確執行且提供給正確的合約位址
    }
}