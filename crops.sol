// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FarmingProject {
    struct Project {
        address owner;
        uint256 totalFunds;
        uint256 releasedFunds;
        uint256 harvestedKilos;
        uint256 pricePerKilo;
        uint256 start;
        uint256[] milestones;
        uint256 currentMilestone;
        uint256 agronomistFee;
        uint256 farmerFee;
        uint256 platformFee;
        uint256 investorPercentage;
        uint256 totalInvestors;
    }

    mapping(uint256 => Project) public projects;
    mapping(uint256 => mapping(address => uint256)) public investments;
    uint256 public projectCount;
    address public platform;

    event ProjectCreated(uint256 id, address owner);
    event FundsInvested(uint256 id, address investor, uint256 amount);
    event FundsReleased(uint256 id, uint256 amount);
    event HarvestRegistered(uint256 id, uint256 kilos, uint256 pricePerKilo);
    event KilosPurchased(uint256 id, address buyer, uint256 kilosPurchased);
    event InvestorPayout(uint256 id, address investor, uint256 payout);
    event ProfitDistributed(uint256 id, uint256 farmerAmount, uint256 platformAmount, uint256 agronomistAmount, uint256 investorAmount);

    constructor() {
        platform = msg.sender;
    }

    modifier onlyPlatform() {
        require(msg.sender == platform, "Only the platform can perform this action");
        _;
    }

    function createProject(
        uint256[] memory _milestones,
        uint256 _agronomistFee,
        uint256 _farmerFee,
        uint256 _platformFee,
        uint256 _investorPercentage
    ) public {
        require(_agronomistFee + _farmerFee + _platformFee + _investorPercentage == 100, "The fees must sum to 100%");
        projectCount++;
        projects[projectCount] = Project({
            owner: msg.sender,
            totalFunds: 0,
            releasedFunds: 0,
            harvestedKilos: 0,
            pricePerKilo: 0,
            start: block.timestamp,
            milestones: _milestones,
            currentMilestone: 0,
            agronomistFee: _agronomistFee,
            farmerFee: _farmerFee,
            platformFee: _platformFee,
            investorPercentage: _investorPercentage,
            totalInvestors: 0
        });
        emit ProjectCreated(projectCount, msg.sender);
    }

    function investFunds(uint256 _id) public payable {
        require(msg.value > 0, "You must send AVAX to invest");
        Project storage project = projects[_id];
        project.totalFunds += msg.value;
        investments[_id][msg.sender] += msg.value; // Registro de la inversión
        project.totalInvestors++;
        emit FundsInvested(_id, msg.sender, msg.value);
    }

    function releaseFunds(uint256 _id) public onlyPlatform {
        Project storage project = projects[_id];
        require(block.timestamp >= project.milestones[project.currentMilestone], "It's not time to release the funds yet");
        uint256 amountToRelease = project.totalFunds / project.milestones.length;
        project.releasedFunds += amountToRelease;
        project.currentMilestone++;
        payable(project.owner).transfer(amountToRelease);
        emit FundsReleased(_id, amountToRelease);
    }

    function registerHarvest(uint256 _id, uint256 _kilos, uint256 _pricePerKilo) public onlyPlatform {
        Project storage project = projects[_id];
        require(project.currentMilestone == project.milestones.length, "All milestones must be completed before registering the harvest");
        project.harvestedKilos = _kilos;
        project.pricePerKilo = _pricePerKilo;
        emit HarvestRegistered(_id, _kilos, _pricePerKilo);
    }

    function buyKilos(uint256 _id, uint256 _kilos) public payable {
        Project storage project = projects[_id];
        uint256 cost = _kilos * project.pricePerKilo;
        require(msg.value >= cost, "Insufficient funds to buy the kilos");
        require(project.harvestedKilos >= _kilos, "Not enough kilos available");

        uint256 totalFees = (cost * project.agronomistFee) / 100;
        totalFees += (cost * project.farmerFee) / 100;
        totalFees += (cost * project.platformFee) / 100;

        // Distribute payments and fees
        payable(project.owner).transfer(cost - totalFees);
        payable(platform).transfer((cost * project.platformFee) / 100);

        // Update project state
        project.harvestedKilos -= _kilos;
        emit KilosPurchased(_id, msg.sender, _kilos);
    }

    function distributeProfits(uint256 _id) public onlyPlatform {
        Project storage project = projects[_id];
        uint256 totalProfits = project.totalFunds - project.releasedFunds; // Ganancias totales (después de devolver capital)

        // Distribuir porcentajes
        uint256 farmerAmount = (totalProfits * project.farmerFee) / 100;
        uint256 platformAmount = (totalProfits * project.platformFee) / 100;
        uint256 agronomistAmount = (totalProfits * project.agronomistFee) / 100;
        uint256 investorAmount = (totalProfits * project.investorPercentage) / 100;

        // Pagar al cultivador
        payable(project.owner).transfer(farmerAmount);

        // Pagar a la plataforma
        payable(platform).transfer(platformAmount);

        // Pagar al agrónomo (en este ejemplo, la plataforma lo paga, pero puede ser otra dirección)
        payable(platform).transfer(agronomistAmount);

        // Distribuir a los inversionistas proporcionalmente
        for (uint256 i = 0; i < project.totalInvestors; i++) {
            address investor = msg.sender; // Obtener dirección del inversionista
            uint256 investmentAmount = investments[_id][investor];
            if (investmentAmount > 0) {
                uint256 payout = (investmentAmount * investorAmount) / project.totalFunds; // Proporcional a su inversión
                investments[_id][investor] = 0; // Reiniciar inversión tras el pago
                payable(investor).transfer(payout);
                emit InvestorPayout(_id, investor, payout);
            }
        }

        emit ProfitDistributed(_id, farmerAmount, platformAmount, agronomistAmount, investorAmount);
    }
}
