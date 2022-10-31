// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21;
pragma experimental ABIEncoderV2;
import './Operations.sol';

contract UserContract is Operations{

    struct userStruct {
      string username;
      string userID;
      string email;
      string phone;
      string Haddress;
      string areaCode;
    }

    mapping (address => string) public userIdMap;
    mapping (string => userStruct) public userDetailsMap;

    uint Usercount;

    constructor() public {
        Usercount=0;
    }

    function registerUser(address _usraddr, string memory name, string memory email, string memory phone,
                                            string memory Haddress, string memory area_code ) public 
    {
        Usercount++;
        //Convert int to string 
        string memory H="U";
        string memory userID=concatenate(H,IntToString(Usercount));

        userIdMap[_usraddr]=userID;
        userDetailsMap[userID]=userStruct(name,userID,email,phone,Haddress,area_code);
    }

    function getUserID(address _usraddr) public view returns (string memory _userID) {
        return userIdMap[_usraddr];
    }

    function getUser(string memory userID) public view returns (userStruct memory _userStruct) {
        return userDetailsMap[userID];
    }

}