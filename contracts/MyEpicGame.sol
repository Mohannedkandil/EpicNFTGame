// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract MyEpicGame {
    // Hold the Chatacter's attributes in a struct
    struct CharacterAttributes {
        uint256 characterIndex;
        string name;
        string imageURI;
        uint256 hp;
        uint256 maxHp;
        uint256 attackDamage;
    }
    /*
        An Array to help me hold the default data for the characters
        This will be helpful when we mint new characters and need to know things like
        HP, AD, etc. 
     */
    CharacterAttributes[] defaultCharacters;

    // Data passed in to the contract when it's first created initializing the characters

    constructor(
        string[] memory charactersNames,
        string[] memory charactersImageURIs,
        uint256[] memory characterHp,
        uint256[] memory characterAttackDmg
    ) {
        // Loop through all the characters, and save their values in our contract
        // so we can use thme later when we build out NFTs
        for (uint256 i = 0; i < charactersNames.length; i += 1) {
            defaultCharacters.push(
                CharacterAttributes({
                    characterIndex: i,
                    name: charactersNames[i],
                    imageURI: charactersImageURIs[i],
                    hp: characterHp[i],
                    maxHp: characterHp[i],
                    attackDamage: characterAttackDmg[i]
                })
            );
            CharacterAttributes memory c = defaultCharacters[i];
            console.log("Done initializing %s HP %s", c.name, c.hp, c.imageURI);
        }
    }
}
