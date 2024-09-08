# UchuvaLabs WhitePaper
UchuvaLabs es una iniciativa innovadora diseñada para descentralizar los cultivos pequeños de alto rendimiento, proporcionando una solución sostenible y escalable para la agricultura. A través de esta descentralización, buscamos empoderar a los pequeños agricultores, ofreciéndoles acceso a herramientas y tecnologías que optimizan la producción y el rendimiento de sus cultivos.

El proyecto está alineado con varios Objetivos de Desarrollo Sostenible (ODS) de las Naciones Unidas, incluyendo:

ODS 1:Fin de la pobreza, promoviendo oportunidades de ingresos para los pequeños agricultores.

ODS 8: Trabajo decente y crecimiento económico, fomentando una economía local sostenible basada en la agricultura.

ODS 11: Ciudades y comunidades sostenibles, apoyando el desarrollo rural y la resiliencia de las comunidades agrícolas.

ODS 12: Producción y consumo responsables, garantizando prácticas agrícolas que minimizan el impacto ambiental.

UchuvaLabs se distingue por su enfoque en la sostenibilidad, escalabilidad y rentabilidad. Al combinar prácticas agrícolas innovadoras con tecnología avanzada, este proyecto tiene el potencial de transformar la agricultura a pequeña escala, haciéndola más eficiente y económicamente viable, al tiempo que contribuye a un futuro más sostenible y equitativo.

## Detalles:

### **1. Creación de Proyectos Agrícolas descentralizados**
- **Actores Involucrados:**
    - **Plataforma/Admin:** La plataforma es el actor que controla la creación de proyectos. Solo la plataforma puede crear proyectos agrícolas y establecer los términos de cada proyecto, como los hitos (milestones) y los porcentajes de participación de las partes involucradas.
    - **Cultivador:** Es el responsable de llevar a cabo el proyecto agrícola. La plataforma asigna una dirección de wallet para el cultivador en cada proyecto.
    - **Agrónomo:** La plataforma también asigna un agrónomo al proyecto, quien tendrá un rol en la supervisión técnica del mismo. El agrónomo recibe una comisión por su participación.

- **Flujo de Trabajo:**
    - La plataforma crea un proyecto definiendo:
        - Las direcciones del **cultivador** y del **agronomo**.
        - Las **etapas** (milestones) del proyecto, que determinan cuándo se liberan los fondos.
        - Los porcentajes de **participación en las ganancias**:
            - **60% para el cultivador** (u otro valor según sea establecido).
            - **2% para el agrónomo**.
            - **10% para la plataforma**.
            - **28% para los inversionistas**, repartido proporcionalmente según la cantidad que invirtió cada inversionista.

### **2. Inversión en Proyectos**
- **Actores Involucrados:**
    - **Inversionistas:** Los inversionistas pueden inyectar capital (en AVAX) en los proyectos agrícolas con la expectativa de recuperar su inversión y obtener una ganancia cuando el proyecto finalice.

- **Flujo de Trabajo:**
    - Cualquier usuario puede invertir en un proyecto enviando AVAX al contrato, especificando el proyecto en el que desea invertir.
    - El contrato almacena las inversiones individuales de cada inversionista y mantiene un registro del total de fondos invertidos en el proyecto.
    - El número total de inversionistas se actualiza con cada inversión.

### **3. Liberación de Fondos al Cultivador**
- **Actores Involucrados:**
    - **Plataforma:** La plataforma controla cuándo y cuánto dinero se libera al cultivador.
    - **Cultivador:** Recibe los fondos a medida que se alcanzan los hitos del proyecto.

- **Flujo de Trabajo:**
    - Los fondos invertidos se liberan al cultivador en varias etapas según los **milestones** definidos al crear el proyecto.
    - La plataforma verifica que el tiempo actual sea posterior al hito correspondiente antes de liberar los fondos.
    - Estos fondos permiten que el cultivador cubra los costos operativos del proyecto (como insumos, mano de obra, etc.).

### **4. Registro de la Cosecha**
- **Actores Involucrados:**
    - **Plataforma:** La plataforma tiene la responsabilidad de registrar el resultado del proyecto una vez que todas las etapas hayan sido completadas.
    - **Cultivador:** Es el responsable de proporcionar la información sobre la cantidad cosechada.

- **Flujo de Trabajo:**
    - Una vez que se completan todas las etapas del proyecto y se ha realizado la cosecha, la plataforma registra la cantidad de kilos cosechados y el precio por kilo en el contrato.
    - Este registro permite que los compradores adquieran los kilos cosechados.

### **5. Compra de Kilos de Cosecha**
- **Actores Involucrados:**
    - **Compradores:** Los compradores adquieren la cosecha pagando en AVAX por los kilos cosechados.
    - **Cultivador:** Recibe una parte del pago por la venta de la cosecha.
    - **Agrónomo y Plataforma:** Reciben una comisión por su participación en el proyecto.

- **Flujo de Trabajo:**
    - Los compradores pagan en AVAX por los kilos cosechados y el contrato distribuye automáticamente los fondos según los porcentajes acordados en la creación del proyecto.
    - Se realizan pagos directos al **cultivador**, al **agronomo** y a la **plataforma**, basados en sus porcentajes.
    - A medida que se realizan las ventas, el contrato actualiza la cantidad de kilos restantes hasta que se agoten.

### **6. Distribución de Ganancias**
- **Actores Involucrados:**
    - **Cultivador, Agrónomo y Plataforma:** Reciben su parte de las ganancias una vez que se haya vendido toda la cosecha.
    - **Inversionistas:** Reciben el retorno de su inversión más una parte proporcional de las ganancias generadas por el proyecto.

- **Flujo de Trabajo:**
    - Una vez que se han vendido todos los kilos de la cosecha, la plataforma distribuye las ganancias entre los actores.
    - **Distribución de Ganancias:**
        - **60% al cultivador**: El cultivador, que estuvo a cargo del proyecto agrícola, recibe la mayor parte de las ganancias.
        - **10% a la plataforma**: La plataforma recibe su comisión por crear y gestionar el proyecto.
        - **2% al agrónomo**: El agrónomo recibe su comisión por su trabajo de asesoramiento en el proyecto.
        - **28% a los inversionistas**: Los inversionistas recuperan primero su capital y luego reciben una parte proporcional de las ganancias según la cantidad que invirtieron.
    - **Repartición de Ganancias a los Inversionistas:**
        - Cada inversionista recibe un porcentaje de las ganancias correspondiente a su porcentaje de inversión en relación al total de fondos invertidos en el proyecto.

### **7. Control de la Plataforma/Admin**
- **Actores Involucrados:**
    - **Plataforma:** La plataforma es la entidad que tiene el control total del flujo de los proyectos. Solo la plataforma puede:
        - Crear proyectos.
        - Liberar fondos.
        - Registrar la cosecha.
        - Distribuir las ganancias.

- **Flujo de Trabajo:**
    - La plataforma administra y controla los fondos del proyecto y la liberación de los mismos a los actores correspondientes (cultivador, agrónomo, inversionistas) según se avance en las diferentes fases del proyecto.

### **Resumen del Flujo de Negocio**
1. **Creación del Proyecto:** La plataforma crea proyectos y asigna a un cultivador y a un agrónomo, además de establecer las condiciones de inversión y participación en las ganancias.
2. **Inversión:** Los inversionistas envían AVAX para financiar el proyecto, y los fondos se distribuyen en diferentes etapas.
3. **Liberación de Fondos:** La plataforma libera fondos al cultivador en fases, a medida que el proyecto avanza.
4. **Cosecha y Venta:** Una vez completada la cosecha, los compradores pueden adquirir los kilos cosechados.
5. **Distribución de Ganancias:** Al final del proyecto, las ganancias se distribuyen entre el cultivador, el agrónomo, la plataforma y los inversionistas, asegurando que cada parte reciba su porcentaje justo.

Este contrato ofrece una solución integral para proyectos de inversión agrícola, garantizando la participación transparente de todas las partes involucradas (plataforma, cultivador, agrónomo e inversionistas) y asegurando que los fondos y las ganancias se distribuyan de manera justa y segura.

# Definiciones técnicas:

### 1. **Estructura del Contrato y Variables Globales**

```solidity
struct Project {
    address platform;           
    address farmer;             
    address agronomist;         
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

#### Explicación:
- **platform**: Dirección de la plataforma/admin, quien tiene control total sobre los proyectos.
- **farmer**: Dirección del cultivador (agricultor), que será quien reciba los fondos y ejecute el proyecto agrícola.
- **agronomist**: Dirección del agrónomo que asiste técnicamente al proyecto y recibe una comisión.
- **totalFunds**: Total de fondos (AVAX) invertidos en el proyecto por los inversionistas.
- **releasedFunds**: Fondos que ya han sido liberados para el cultivador durante las distintas etapas del proyecto.
- **harvestedKilos**: Cantidad de kilos cosechados, que se registra una vez que el proyecto finaliza.
- **pricePerKilo**: Precio de venta por cada kilo cosechado.
- **start**: Momento en el que el proyecto fue creado.
- **milestones**: Un array de fechas o etapas, que define cuándo se pueden liberar los fondos.
- **currentMilestone**: Índice del hito actual, indicando en qué etapa se encuentra el proyecto.
- **agronomistFee**, **farmerFee**, **platformFee**, **investorPercentage**: Son los porcentajes de las ganancias que corresponden a cada actor del proyecto.
- **totalInvestors**: Número total de inversionistas que han invertido en el proyecto.

### 2. **Constructor del Contrato**

```solidity
constructor() {
    admin = msg.sender; // La plataforma/admin es quien despliega el contrato
}
```

#### Explicación:
- **admin**: El contrato inicializa el `admin` (plataforma) como la cuenta que despliega el contrato. Solo esta cuenta puede crear y gestionar proyectos. El `admin` tiene un control centralizado sobre la operación de los proyectos.

### 3. **Función `createProject`**

```solidity
function createProject(
    address _farmer,
    address _agronomist,
    uint256[] memory _milestones,
    uint256 _agronomistFee,
    uint256 _farmerFee,
    uint256 _platformFee,
    uint256 _investorPercentage
) public onlyAdmin {
    require(_agronomistFee + _farmerFee + _platformFee + _investorPercentage == 100, "The fees must sum to 100%");
    projectCount++;
    projects[projectCount] = Project({
        platform: admin,
        farmer: _farmer,
        agronomist: _agronomist,
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
    emit ProjectCreated(projectCount, _farmer, _agronomist);
}
```

#### Explicación:
- Esta función permite al admin crear un nuevo proyecto, asignando las direcciones del **farmer** (cultivador) y el **agronomist** (agronomo), junto con los hitos de liberación de fondos y los porcentajes de participación en las ganancias.
- Se asegura que los porcentajes asignados a cada parte sumen el 100%.
- Incrementa el contador de proyectos `projectCount` y almacena la información del proyecto en el mapping `projects`.

### 4. **Función `investFunds`**

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

#### Explicación:
- Permite a cualquier usuario enviar AVAX e invertir en un proyecto.
- La cantidad invertida se suma al total de fondos del proyecto `totalFunds` y se almacena en el mapping `investments`, que lleva un registro de cuánto ha invertido cada inversor.
- El número total de inversionistas del proyecto se actualiza.

### 5. **Función `releaseFunds`**

```solidity
function releaseFunds(uint256 _id) public onlyAdmin {
    Project storage project = projects[_id];
    require(block.timestamp >= project.milestones[project.currentMilestone], "It's not time to release the funds yet");
    uint256 amountToRelease = project.totalFunds / project.milestones.length;
    project.releasedFunds += amountToRelease;
    project.currentMilestone++;
    payable(project.farmer).transfer(amountToRelease);
    emit FundsReleased(_id, amountToRelease);
}
```

#### Explicación:
- Esta función permite al admin liberar los fondos al cultivador (farmer) en etapas.
- Se verifica que se haya alcanzado el hito correspondiente antes de liberar los fondos.
- Se transfiere la parte correspondiente de los fondos al **farmer** para que pueda continuar ejecutando el proyecto agrícola.

### 6. **Función `registerHarvest`**

```solidity
function registerHarvest(uint256 _id, uint256 _kilos, uint256 _pricePerKilo) public onlyAdmin {
    Project storage project = projects[_id];
    require(project.currentMilestone == project.milestones.length, "All milestones must be completed before registering the harvest");
    project.harvestedKilos = _kilos;
    project.pricePerKilo = _pricePerKilo;
    emit HarvestRegistered(_id, _kilos, _pricePerKilo);
}
```

#### Explicación:
- Esta función permite registrar la cantidad de kilos cosechados y el precio por kilo una vez que todas las etapas del proyecto se hayan completado.
- Solo puede ser ejecutada por el **admin** y marca la finalización de la parte operativa del proyecto, permitiendo que se realicen las ventas.

### 7. **Función `buyKilos`**

```solidity
function buyKilos(uint256 _id, uint256 _kilos) public payable {
    Project storage project = projects[_id];
    uint256 cost = _kilos * project.pricePerKilo;
    require(msg.value >= cost, "Insufficient funds to buy the kilos");
    require(project.harvestedKilos >= _kilos, "Not enough kilos available");

    uint256 totalFees = (cost * project.agronomistFee) / 100;
    totalFees += (cost * project.farmerFee) / 100;
    totalFees += (cost * project.platformFee) / 100;

    payable(project.farmer).transfer(cost - totalFees);
    payable(admin).transfer((cost * project.platformFee) / 100);
    payable(project.agronomist).transfer((cost * project.agronomistFee) / 100);

    project.harvestedKilos -= _kilos;
    emit KilosPurchased(_id, msg.sender, _kilos);
}
```

#### Explicación:
- Permite a los compradores adquirir kilos de la cosecha pagando en AVAX.
- El costo total de los kilos se distribuye entre el **farmer** (cultivador), el **admin** (plataforma) y el **agronomist** (agronomo), según los porcentajes definidos en el proyecto.
- Se actualiza el estado del proyecto reduciendo el número de kilos disponibles para la venta.

### 8. **Función `distributeProfits`**

```solidity
function distributeProfits(uint256 _id) public onlyAdmin {
    Project storage project = projects[_id];
    uint256 totalProfits = project.totalFunds - project.releasedFunds;

    uint256 farmerAmount = (totalProfits * project.farmerFee) / 100;
    uint256 platformAmount = (totalProfits * project.platformFee) / 100;
    uint256 agronomistAmount = (totalProfits * project.agronomistFee) / 100;
    uint256 investorAmount = (totalProfits * project.investorPercentage) / 100;

    payable(project.farmer).transfer(farmerAmount);
    payable(admin).transfer(platformAmount);
    payable(project.agronomist).transfer(agronomistAmount);

    for (uint256 i = 0; i < project.totalInvestors; i++) {
        address investor = msg.sender;
        uint256 investmentAmount = investments[_id][investor];
        if (investmentAmount > 0) {
            uint256 payout = (investmentAmount * investorAmount) / project.totalFunds;
            investments[_id][investor] = 0;
            payable

(investor).transfer(payout);
            emit InvestorPayout(_id, investor, payout);
        }
    }

    emit ProfitDistributed(_id, farmerAmount, platformAmount, agronomistAmount, investorAmount);
}
```

#### Explicación:
- Esta función distribuye las ganancias del proyecto entre el **farmer**, **admin**, **agronomist**, y los **inversionistas**.
- Las ganancias se calculan restando los fondos ya liberados a los fondos totales.
- Cada parte recibe su porcentaje según los términos definidos en la creación del proyecto.
- Los inversionistas reciben su parte proporcional de las ganancias basadas en su inversión original.

### Conclusión Técnica:

Este contrato gestiona todo el ciclo de vida de un proyecto agrícola, desde la inversión inicial, la liberación de fondos por etapas, la venta de la cosecha y la distribución final de las ganancias. Cada actor en el contrato (plataforma, cultivador, agrónomo, inversionistas) tiene su propio rol definido y sus pagos garantizados según los términos establecidos al inicio del proyecto.


### Más información:
[APP](https://uchuvalabs.xyz) de UchuvaLabs.

[API](https://api.uchuvalabs.xyz) de UchuvaLabs.

[Repos](https://github.com/orgs/UchuvaLabs/repositories) de UchuvaLabs.