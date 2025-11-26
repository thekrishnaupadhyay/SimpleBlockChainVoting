
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Project {
    struct Candidate {
        string name;
        uint voteCount;
    }

    address public admin;
    bool public votingActive;

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;

    constructor() {
        admin = msg.sender;
        votingActive = true;

        // Hardcoded candidates (change names as you like)
        candidates.push(Candidate("Alice", 0));
        candidates.push(Candidate("Bob", 0));
        candidates.push(Candidate("Charlie", 0));
    }

    // Core Function 1: Vote
    function vote(uint candidateIndex) external {
        require(votingActive, "Voting is not active");
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateIndex < candidates.length, "Invalid candidate");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;
    }

    // Core Function 2: Stop Voting
    function stopVoting() external {
        require(msg.sender == admin, "Only admin can stop voting");
        votingActive = false;
    }

    // Core Function 3: Return all candidates
    function getCandidates() external view returns (Candidate[] memory) {
        return candidates;
    }
}
