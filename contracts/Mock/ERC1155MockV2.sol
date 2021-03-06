pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract ERC1155MockV2 is ERC1155 {
    using Strings for uint256;

    string public name;
    string public symbol;
    string private _uri;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory uri_
    ) ERC1155(uri_) {
        name = _name;
        symbol = _symbol;
        _uri = uri_;
    }

    function uri(uint256 _id) public view override returns (string memory) {
        return string(abi.encodePacked(_uri, _id.toString()));
    }

    function mint(
        address account,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) external {
        _mint(account, id, amount, data);
    }

    function mintBatch(
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) external {
        _mintBatch(to, ids, amounts, data);
    }
}
