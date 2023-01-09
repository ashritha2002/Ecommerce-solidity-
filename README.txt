#PROJECT TITLE: SMART CONTRACTS IN E-COMMERCE(customer to business)



Project description:
The main objective of this project is to solve the customer's problem regarding delivery.
Their hesitance arises as website owners may not deliver the item after payment.
Hence, we have created 2 smart contracts named mediator and customer.
The customer sends money to the mediator. when the product is delivered, the mediator sends money to the website owner(here xyz_owner).
The website owner receives money only when the product is delivered to customer.
We are using solidity 0.8.0 to create both contracts.
Both contracts are deployed in Remix IDE which is used to deploy and run transactions.

if a function has payable as one of the keywords, the function can send and receive ethers from other contracts.
functions used:
customer contract:
i)sendToMediator: customer sends money to the mediator contract.
if the cost is more than what the customer has then the transaction is reverted back and the string "insufficient balance" is printed.
ii)getCustBalance: returns the current balance in the customer's wallet.

mediator contract:
i)getMediatorBalance: returns the current balance of the mediator
ii)startDelivery: starts delivery of the product only if the mediator receives ethers from the customer 
iii)offloadingStatus: returns if offloading of the product started 
iv)sendMoneyXyzowner: sends money to website owner if the customer receives the product. if the product is not delivered transaction is reverted back
v)sendTip: sends tip to xyz.com
vi)checkXyzOwner: returns website owners balance


How to run this code:
Download this code or copy-paste the code into your Remix Ethereum IDE. 
Deploy mediator contract with zero as its initial balance(assumption: one mediator is used by only one customer during a particular instant of time.) 
Deploy customer contract with non-zero initial balance and give mediator's address as its input.if balance is less than the product's cost, the transaction is reverted back.
use sendToMediator function to send ethers to the mediator contract.use getCustBalance to check the customer's current balance.
Use function startDelivery to start delivery if the mediator receives money from the customer.
use offloadingSatus to check if offloading of the product has started
use sendMoneyXyzowner to send money from mediator to the website owner if the product is delivered to the customer
send tip if it is included using sendTip() function
check if ethers are debited from the mediator's wallet and credited to the website owner's wallet using getMediatorBalance and checkXyzOwner





