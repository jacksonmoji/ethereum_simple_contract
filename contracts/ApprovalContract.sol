pragma solidity ^0.4.18;

contract ApprovalContract {

	address public sender;  //type called address representing the sender 
	address public reciever;
	address public constant approver = 0x627306090abab3a6e1400e9345bc60c78a8bef57; //setting this type equal to a value for running tests, same as above only difference is its accepting values

    //function to hacle deposits, external meaning that this function can called from outside this contract and jsut internally
	function deposit(address _receiver) external payable { // this is extenal payable because its taking in ether

		require(msg.value > 0); // condition to check if the sender is actually depositing something in the deposit function
		sender = msg.sender; // just to see who is sending the money in
		reciever = _receiver;

	} 
     // will not cause any gas
	function viewApprover() external pure returns(address){

		return (approver);
	}
	// this is the actuall approve that will release the money
	function approve() external {

		require(msg.sender == approver);
		reciever.transfer(address(this).balance);

	}
}