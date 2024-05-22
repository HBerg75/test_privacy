// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacyScript is Script {

    //  instance du contrat Privacy en utilisant l'adresse où il est déployé

    Privacy public privacyInstance = Privacy(0xFDd15d728a150139AB8fb42B462e8fb973873E7b);

    //  fonction run qui déverrouille le contrat Privacy en utilisant la clé privée stockée dans l'environnement

    function run() external {

        // Démarre la simulation de transaction en utilisant la clé privée spécifiée dans l'environnement
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // Définit la clé récupérée par analyse du stockage du contrat, tronquée à 16 octets pour l'usage
        bytes32 key = "cle a recuperer sur etherscan   => cast storage [privacy instance]";

        // Affiche l'état verrouillé du contrat avant la tentative de déverrouillage
        console.log("Avant: ", privacyInstance.locked());

        // Appelle la fonction unlock du contrat Privacy avec les 16 premiers octets de la clé
        privacyInstance.unlock(bytes16(key));

        // Affiche l'état verrouillé du contrat après la tentative de déverrouillage
        console.log("Apres: ", privacyInstance.locked());

        // Arrête la simulation de transaction
        vm.stopBroadcast();
    }
}