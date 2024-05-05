// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract QRCode {
    address public manager;
    
    struct Book {
        string Title;
        string AuthorName;
        string PublishingHouse;
        uint Price;
        uint NumPages;
    }
    
    mapping(uint => Book) public books;
    uint public totalBooks;
    
    constructor() {
        manager = msg.sender;
    }
    
    modifier onlyAdmin() {
        require(msg.sender == manager, "Only the contract manager can perform this operation.");
        _;
    }
    
    // Function to add a new book
    function addBook(string memory _title, string memory _authorName, string memory _publishingHouse, uint _price, uint _numPages) public onlyAdmin {
        totalBooks++;
        books[totalBooks] = Book(_title, _authorName, _publishingHouse, _price, _numPages);
    }

    struct User {
        string ipAddress; 
    }
    mapping(address => User) public users;
    function registerUser(string memory _ipAddress) public {
        users[msg.sender] = User(_ipAddress);
    }
}