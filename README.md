# Funcionalidades del SmartContract

#### **Creación de Proyectos de Cultivo:**
- El contrato permitirá crear múltiples proyectos de cultivo, cada uno identificado con un ID único.
- Durante la creación de un proyecto, se definen los hitos o etapas de liberación de fondos, así como los porcentajes de distribución de las ganancias entre el agrónomo, el cultivador, la plataforma y los inversionistas.
- Los hitos determinan cuándo se pueden liberar los fondos y las comisiones se distribuyen de manera predefinida (por ejemplo, 60% para el cultivador, 10% para la plataforma, 2% para el agrónomo, y 28% para los inversionistas).

#### **Ingreso de AVAX a un Proyecto (Inversión):**
- Los inversionistas pueden enviar AVAX al contrato, especificando en qué proyecto están invirtiendo.
- El contrato registra el total de AVAX invertido en cada proyecto y también lleva un registro de las inversiones individuales de cada inversionista.
- El número total de inversionistas en un proyecto se incrementa con cada inversión.

#### **Liberación de Fondos al Cultivador:**
- Los fondos se liberan al dueño del proyecto de forma escalonada, basada en los hitos o etapas del proyecto.
- Cada hito tiene una fecha establecida en la cual se pueden liberar una parte de los fondos totales.
- La función de liberación de fondos verifica que se haya alcanzado el hito correspondiente antes de permitir la transferencia de fondos al cultivador.

#### **Registro de Cosecha:**
- Una vez que todas las etapas del proyecto se han completado, el administrador del contrato puede registrar la cantidad de kilos cosechados y el precio de venta por kilo.
- Este registro es necesario para poder vender los productos cosechados a los compradores interesados.

#### **Compra de Kilos de Cosecha:**
- Los compradores pueden adquirir la cosecha pagando en AVAX por los kilos que desean comprar.
- El contrato distribuye automáticamente los pagos entre el cultivador, la plataforma y el agrónomo, basado en los porcentajes acordados.
- La cantidad de kilos disponibles se actualiza a medida que se realizan las ventas, asegurando que no se vendan más de los kilos cosechados.

#### **Distribución de Ganancias:**
- Una vez que se hayan vendido todos los kilos de cosecha, el contrato distribuirá las ganancias entre las diferentes partes interesadas:
    - 60% para el cultivador.
    - 10% para la plataforma.
    - 2% para el agrónomo.
    - 28% para los inversionistas, en proporción a la cantidad invertida por cada uno.
- La distribución de las ganancias garantiza que los inversionistas reciban primero el retorno de su capital antes de obtener cualquier ganancia adicional.

#### **Devolución de Capital y Pago de Inversionistas:**
- El contrato asegura que primero se devuelva el capital invertido por los inversionistas.
- Una vez devuelto el capital, se distribuyen las ganancias según los porcentajes definidos en la creación del proyecto.
- Los inversionistas reciben su parte de las ganancias en función de cuánto invirtieron en el proyecto en comparación con el total de inversiones.

---

Estas funcionalidades cubren todo el ciclo de inversión, ejecución y distribución de fondos de un proyecto agrícola, asegurando una gestión justa y transparente de los fondos y las ganancias para todas las partes involucradas (inversionistas, agrónomo, cultivador y plataforma).

# Explicación del smartcontract:



### 1. **Estructura del Proyecto (`struct Project`)**

```solidity
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
```

Cada proyecto en este contrato tiene la siguiente estructura:
- **owner**: Dirección del dueño del proyecto (el cultivador).
- **totalFunds**: El total de AVAX que se ha invertido en el proyecto.
- **releasedFunds**: La cantidad de fondos que ya se han liberado (para el cultivador en las etapas).
- **harvestedKilos**: La cantidad de kilos cosechados, que se registran al final del proyecto.
- **pricePerKilo**: El precio por kilo que se usará para vender los productos cosechados.
- **start**: Timestamp del inicio del proyecto.
- **milestones**: Arreglo que contiene los hitos o etapas del proyecto. Estos hitos determinan cuándo se pueden liberar los fondos.
- **currentMilestone**: El índice del hito actual del proyecto.
- **agronomistFee**: Porcentaje de las ganancias que se destina al agrónomo.
- **farmerFee**: Porcentaje de las ganancias que se destina al cultivador.
- **platformFee**: Porcentaje de las ganancias que se destina a la plataforma.
- **investorPercentage**: Porcentaje de las ganancias que se destina a los inversionistas.
- **totalInvestors**: Número total de inversionistas en el proyecto.

### 2. **Inversiones por Proyecto**
```solidity
mapping(uint256 => mapping(address => uint256)) public investments;
```

Este mapping guarda cuánto ha invertido cada inversor en un proyecto. Está estructurado de manera que cada proyecto tiene un mapping que asigna a cada dirección de inversionista la cantidad de AVAX que invirtió.

### 3. **Eventos**
El contrato incluye varios eventos que permiten registrar y notificar acciones importantes en el contrato:

- **ProjectCreated**: Emitido cuando se crea un nuevo proyecto.
- **FundsInvested**: Emitido cuando un inversionista aporta fondos a un proyecto.
- **FundsReleased**: Emitido cuando se liberan fondos para el dueño del proyecto.
- **HarvestRegistered**: Emitido cuando se registra la cosecha.
- **KilosPurchased**: Emitido cuando se compran kilos de la cosecha.
- **InvestorPayout**: Emitido cuando se paga a un inversionista.
- **ProfitDistributed**: Emitido cuando se distribuyen las ganancias entre los participantes.

### 4. **Creación de Proyecto (`createProject`)**
```solidity
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
```

Esta función permite la creación de un proyecto de cultivo, donde se definen:
- **Milestones**: Los hitos que determinan cuándo se liberan fondos.
- **Porcentajes**: Las comisiones para el agrónomo, cultivador, plataforma, y los inversionistas.

Se asegura que la suma de los porcentajes sea del 100%. Al crear un proyecto, se incrementa el contador de proyectos (`projectCount`) y se almacena la información en el mapping `projects`.

### 5. **Inversiones en el Proyecto (`investFunds`)**
```solidity
function investFunds(uint256 _id) public payable {
    require(msg.value > 0, "You must send AVAX to invest");
    Project storage project = projects[_id];
    project.totalFunds += msg.value;
    investments[_id][msg.sender] += msg.value;
    project.totalInvestors++;
    emit FundsInvested(_id, msg.sender, msg.value);
}
```

Esta función permite que los inversionistas envíen AVAX a un proyecto. Los fondos invertidos se registran tanto en el balance total del proyecto como en el mapping `investments` para saber cuánto ha aportado cada inversor.

### 6. **Liberación de Fondos por Etapas (`releaseFunds`)**
```solidity
function releaseFunds(uint256 _id) public onlyPlatform {
    Project storage project = projects[_id];
    require(block.timestamp >= project.milestones[project.currentMilestone], "It's not time to release the funds yet");
    uint256 amountToRelease = project.totalFunds / project.milestones.length;
    project.releasedFunds += amountToRelease;
    project.currentMilestone++;
    payable(project.owner).transfer(amountToRelease);
    emit FundsReleased(_id, amountToRelease);
}
```

Esta función libera los fondos al dueño del proyecto (el cultivador) de manera escalonada, según los hitos predefinidos. Solo la plataforma puede liberar estos fondos, y la cantidad liberada es proporcional al total de fondos del proyecto dividido por el número de hitos.

### 7. **Registro de la Cosecha (`registerHarvest`)**
```solidity
function registerHarvest(uint256 _id, uint256 _kilos, uint256 _pricePerKilo) public onlyPlatform {
    Project storage project = projects[_id];
    require(project.currentMilestone == project.milestones.length, "All milestones must be completed before registering the harvest");
    project.harvestedKilos = _kilos;
    project.pricePerKilo = _pricePerKilo;
    emit HarvestRegistered(_id, _kilos, _pricePerKilo);
}
```

Una vez que todas las etapas del proyecto se han completado, la plataforma puede registrar la cantidad de kilos cosechados y el precio por kilo para vender la cosecha.

### 8. **Compra de Kilos de Cosecha (`buyKilos`)**
```solidity
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
```

Los compradores pueden comprar kilos de la cosecha pagando en AVAX. El contrato distribuye automáticamente las comisiones entre el cultivador, la plataforma y el agrónomo.

### 9. **Distribución de Ganancias Proporcional (`distributeProfits`)**
```solidity
function distributeProfits(uint256 _id) public onlyPlatform {
    Project storage project = projects[_id];
    uint256 totalProfits = project.totalFunds - project.releasedFunds; // Ganancias después de liberar el capital
    
    // Distribuir porcentajes
    uint256 farmerAmount = (totalProfits * project.farmerFee) / 100;
    uint256 platformAmount = (totalProfits * project.platformFee) / 100;
    uint256 agronomistAmount = (totalProfits * project.agronomistFee) / 100;
    uint256 investorAmount = (totalProfits * project.investorPercentage) / 100;

    // Pagar al cultivador
    payable(project.owner).transfer(farmerAmount);

    // Pagar a la plataforma
    payable(platform).transfer(platformAmount);

    // Pagar al agrónomo
    payable(platform).transfer(agronomistAmount);

    // Distribuir a los inversionistas proporcionalmente
    for (uint256 i = 0; i < project.totalInvestors; i++) {
        address investor = msg.sender; // Obtener dirección del inversionista
        uint256 investmentAmount = investments[_id][investor];
        if (investmentAmount > 0) {
            uint256 payout = (investmentAmount * investorAmount) / project.totalFunds; // Proporcional a su inversión
            investments[_id][investor] =

 0; // Reiniciar inversión tras el pago
            payable(investor).transfer(payout);
            emit InvestorPayout(_id, investor, payout);
        }
    }

    emit ProfitDistributed(_id, farmerAmount, platformAmount, agronomistAmount, investorAmount);
}
```

Este método distribuye las **ganancias** del proyecto de acuerdo con los porcentajes establecidos. El flujo es el siguiente:
1. **Se devuelven primero las inversiones**.
2. Luego, las **ganancias** se distribuyen:
    - El 60% para el cultivador.
    - El 10% para la plataforma.
    - El 2% para el agrónomo.
    - El 28% para los inversionistas, de manera proporcional a la cantidad que invirtieron.

### Más información:
[APP](https://uchuvalabs.xyz) de UchuvaLabs.

[API](https://api.uchuvalabs.xyz) de UchuvaLabs.

[Repos](https://github.com/orgs/UchuvaLabs/repositories) de UchuvaLabs.