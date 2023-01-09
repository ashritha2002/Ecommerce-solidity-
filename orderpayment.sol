// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract customer  {
     
    mediator public m1;//object m1 of mediator class
    uint customerBalance = msg.value;//initial balance of customer is given during deployment
   
    constructor(address payable _m1Address) payable{
        m1 = mediator(_m1Address);
   }//initializes the mediators address which is provided to customer during payment
  

//customer sends money to mediator
function sendToMediator(uint _x) external returns(bool){
    
        require(_x < customerBalance, "Insufficient balance");//if the amount customer sending is less thst its balance the transaction is reverted
        (bool success,) = payable(m1).call{value: _x}("");//this statement calls the constructor of the m1 object and executes it while sending it some money as "value"
        return success;
    }
    function getCustBalance() public view returns(uint){
        return address(this).balance;//returns current balnce of the customer

    }
    
}



contract mediator{
bool off_loading = false;//initialize offloading of product to be false
address xyz_owner = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148; //mediator uses website owners address to send money to xyz.com
uint price = 10;//price is fixed and mediator knows it to verify
uint tip;//customer can add tip to website if they ar esatisfies with xyz.com's service

  constructor() payable{

  }//in solidity u need to call default constructor

//returns current mediator balnce
   function getMediatorBalance() public view returns(uint){
        return address(this).balance;
    }

 //starts delivery of the product only if mediator recives ethers from customer 
  function startDelivery() public {
      if(address(this).balance >= price){
           tip = address(this).balance - price;//ethers customer sent-actual price is tip 
           off_loading = true; //off_loading of the product starts   
      }
  }
//returns if off loading of the product started 
  function offloadingStatus() public view returns(bool){
      return off_loading;
  }
//sends money to website owner if customer recieves the product
  function sendMoneyXyzowner(bool delivered) payable  public {
      require(delivered == true, "Not delivered");//if product is not delivered transcation is reverted back
      payable(xyz_owner).transfer(price);//send cost to xyz.com
  }
  //sends tip to xyz.com
  function sendTip() payable public returns(string memory ){
       payable(xyz_owner).transfer(tip);
       return("tip sent to xyz owner");
  }
  //check website owners balance
  function checkXyzOwner() public view returns(uint){
      return xyz_owner.balance;
  }

  receive() external payable{}//this function is used as mediator is receiveing money from customer
}



