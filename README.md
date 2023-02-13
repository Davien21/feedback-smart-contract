# feedback-smart-contract
A basic feedbacks smart contract

This is a basic smart contract that stores user feedbacks on-chain and allows one to retrieve all feedbacks later.

Here are a few things to know about this smart contract.
1. It has a **``feedbackCount``** property for keeping track of the total number of feedbacks added.<br/>
This **``feedbackCount``** property is also useful in the function that returns all the feedbacks.<br/>
This is because we will put the feedbacks in an array, and arrays in solidity need to have their size declared when created, unlike in **Javascript**.   
    
2. It has a **``idToFeedbackItem``** property which is essentially a **dictionary**, **map** or what we call **object** in Javascript.<br/>
This property is a key to value mapping of feedbacks in the smart contract.<br/> 
We like to use mappings in solidity to store data like this instead of arrays.<br/>
This is because arrays are heavy or ***expensive*** in solidity.<br/> 
In solidity, we avoid those type of things - we try to keep things as light or as cheap as possible.

3. It has an **``addFeedback``** function that only takes in a message (must be a string) as it's argument.<br/>
The function uses this message as well as the address of the sender to create a FeedbackItem **Struct** (similar to an object in javascript).<br/>
This **Struct** is then included in our **``idToFeedbackItem``** mapping (earlier discussed above) with it's key being the current feedbackCount.

4. Finally It has a **``getAllFeedback``** function that simply returns a messy array of **Feedback Items**.<br/> 
It's your job on the frontend to write some code to clean up this messy array and form something you can use to display the feedbacks on the frontend.<br/> 
Oh, and by the way, if you noticed the keywords ***external*** and ***view*** beside the **``getAllFeedback``** function and you're wondering what they are...

***external*** is an access modifier. it means that the function can only be used / called externally - by your wallet or another smart contract.<br/>
***view*** is a special keyword means that tells the smart contract that this function is not modifying the state (data in the smart contract)

Both of these are used to make the smart contract lighter or more optimised. <br/> 
I used them because:<br/> 
a. There was no need for me to use the function internally in the smart contract - external
b. I am not modifying the state of the smart contract - view

As time goes on you will learn more about optimising smart contracts to save gas fees and make things faster .
