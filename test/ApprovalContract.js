const ApprovalContract = artifacts.require("../../contracts/ApprovalContract.sol");

	contract("ApprovalContract", function(accounts){

		it('initiates contract', async function(){
			const contract = await ApprovalContract.deployed(); //makes sure the contract is deployed before we start
			const approver = await contract.approver.call();
			assert.equal(approver, 0x627306090abab3a6e1400e9345bc60c78a8bef57, "approver dont match"); //running the actuall test
		})

		it('takes a deposit', async function(){

			const contract = await ApprovalContract.deployed();
			await contract.deposit(accounts[0], {value: 1e+18, from: accounts[1]}); // to 1st account in the array, and sets a value 1 ether(1e+18), from second account[1]
			assert.equal(web3.eth.getBalance(contract.address), 1e+18, "ammount didnt match");
		})
	})