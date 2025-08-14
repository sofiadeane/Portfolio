# Especificación de Requisitos del Sistema: Simulación de Carreras de Automóviles

## 1. Gestión de Equipos de Competición

El sistema deberá modelar el concepto de **Equipo de Competición**, que se define por los siguientes atributos:

* Nombre: Identificador del equipo.
* Automóviles: Un conjunto de vehículos que pertenecen al equipo.
* Presupuesto: Cantidad de dinero disponible para operaciones.

Se deberán implementar los siguientes procedimientos de gestión de equipo:

### 1.1. Reparación de Equipos

Implementar un procedimiento que repare todos los automóviles de un equipo. El costo de reparación se calculará y se descontará del presupuesto del equipo. La reparación solo se realizará si el presupuesto es suficiente para cubrir el costo total.

* **Lógica de Costo**: Por cada punto de desgaste del chasis que se reduzca, se descontarán $500 del presupuesto. La reparación se efectuará hasta que el chasis alcance un estado óptimo (valor mínimo de desgaste, por ejemplo, 1.5).

<br>

**Casos de Prueba a Definir**:
| Condición Inicial | Resultado Esperado |
|-----------------|---------------------|
| Un equipo con un Ferrari (chasis 10), un Lamborghini (chasis 20) y un presupuesto de $20,000. | El Ferrari finaliza con un chasis de 1.5 (reducción de 8.5, costo de $4,250). El Lamborghini finaliza con un chasis de 3 (reducción de 17, costo de $8,500). El presupuesto restante es de $7,250.|
| Un equipo con un Fiat (chasis 50) y un presupuesto de $10,000.| El Fiat permanece con un chasis de 50. El presupuesto del equipo no se modifica, ya que el costo de reparación ($21,250) supera el presupuesto disponible.                                                                                                                   |

### 1.2. Optimización de Automóviles

Implementar un procedimiento para optimizar los automóviles de un equipo. La optimización consiste en aplicar una mejora de "nitro" a cada vehículo. El proceso se detendrá al encontrar el primer automóvil para el que el presupuesto sea insuficiente.

* **Lógica de Costo**: El costo de aplicar nitro a un automóvil es igual a su velocidad máxima (antes de la mejora) multiplicada por $100.
* **Lógica de Mejora**: La velocidad máxima del automóvil aumenta en un 20%.

* **Casos de Prueba a Definir**:

| Condición Inicial                                                                                        | Resultado Esperado                                                                                                                                                                                                                                                                                        |
|-------------------------------------------|-----------------------------------------------------------------|
| Un equipo con un Ferrari (velocidad 65 m/s), un Lamborghini (velocidad 73 m/s) y $20,000 de presupuesto. | El Ferrari finaliza con una velocidad máxima de 78 m/s y el Lamborghini con 87.6 m/s. El presupuesto restante es de $6,200 ($20,000 - (65 + 73) * 100).                                                                                                                                                           |
| Un equipo con un Ferrari (velocidad 65 m/s), un Lamborghini (velocidad 73 m/s) y $10,000 de presupuesto. | El Ferrari finaliza con una velocidad máxima de 78 m/s. El Lamborghini no es modificado. El presupuesto restante es de $3,500 ($10,000 - 65 * 100).                                                                                                                                                          |

### 1.3. Ferrarización de Automóviles

Implementar un procedimiento que transforme los automóviles de un equipo en vehículos Ferrari. La transformación se detendrá cuando el presupuesto sea insuficiente para modificar el siguiente automóvil.

* **Lógica de Costo**: El costo de convertir un automóvil es de $3,500.
* **Lógica de Transformación**: El automóvil cambia su marca a "Ferrari", su modelo a "F50" y se le asigna el apodo "Nunca Taxi". Si el automóvil ya era un Ferrari, no se modifica ni se incurre en costo.

* **Casos de Prueba a Definir**:

| Condición Inicial                                                                                    | Resultado Esperado                                                                                                                                                                                                                                                                                                                                                                   |
|------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Un equipo con un Peugeot y un Lamborghini con un presupuesto de $20,000.                             | Ambos automóviles se convierten en Ferrari F50 con el apodo "Nunca Taxi". El presupuesto restante es de $13,000.                                                                                                                                                                                                                                                                   |
| Un equipo con un Peugeot y un Lamborghini con un presupuesto de $4,000.                             | El Peugeot se convierte en un Ferrari F50 con el apodo "Nunca Taxi". El Lamborghini no se modifica, ya que el presupuesto es insuficiente. El presupuesto restante es de $500.                                                                                                                                                                                                            |
| Un equipo con un Peugeot, una Ferrari y un Lamborghini con un presupuesto de $20,000.                | El Peugeot y el Lamborghini se convierten en Ferrari F50. La Ferrari original no es modificada. El equipo final incluye dos Ferrari F50 con el apodo "Nunca Taxi" y un Ferrari con sus atributos originales. El presupuesto restante es de $13,000.                                                                                                                                |

---
## 2. Equipo "Infinia"

Modelar un equipo especial llamado "Infinia" que posee un presupuesto de $5,000 y una colección infinita de automóviles.
* **Automóviles**:
    * Un Ferrari con desgaste de chasis 1.
    * Un Ferrari con desgaste de chasis 1 y el doble de velocidad que el anterior.
    * Un Ferrari con desgaste de chasis 1 y el triple de velocidad que el primero.
    * Y así sucesivamente, con la velocidad multiplicándose indefinidamente.

Se deberá analizar y justificar conceptualmente qué sucede si se aplican los siguientes procedimientos a este equipo:

* **Reparación de equipo**: Analizar si el procedimiento se completa y cuál es el estado final del equipo.
* **Optimización de autos**: Analizar si el procedimiento se completa y cuál es el estado final del equipo.
* **Ferrarización de autos**: Analizar si el procedimiento se completa y cuál es el estado final del equipo.
* **Nivel de joyez de los autos**: Determinar si es posible calcular el nivel de "joyez" de los autos y justificar la respuesta.

---
## 3. Modificadores de Tramos

Se deberá implementar un sistema de modificadores que alteren las propiedades de los tramos de la pista. Un tramo base puede tener los siguientes modificadores:

* **Boxes**: Si un automóvil no se encuentra en buen estado, entrará a boxes. Esto le otorga una reparación gratuita, pero añade 10 segundos al tiempo de carrera. El automóvil siempre atraviesa el tramo con sus efectos originales.
* **Mojado**: Aumenta el tiempo de carrera del tramo en un 50% de su valor original.
* **Ripio**: Duplica el efecto del tramo (desgaste, tiempo, etc.) y duplica el tiempo de carrera. Un tramo con ripio no puede tener boxes.
* **Obstrucción**: Causa un desgaste adicional en las ruedas de 2 puntos por cada metro de obstrucción.
* **Turbo**: Duplica la velocidad máxima del automóvil durante el tramo. La velocidad máxima vuelve a su valor original al finalizar el tramo.

Se deberá implementar la función `pasarPorTramo/2`, que permite a un automóvil atravesar un tramo. El automóvil solo recibe los efectos del tramo si está en condiciones de conducirse (no "no da más"). En caso contrario, no sufre ningún efecto.

---
## 4. Simulación de Pistas y Vueltas

### 4.1. Creación de Pistas

Modelar las siguientes pistas de carrera:

* **`vueltaALaManzana`**: Ubicada en "Italia", con un precio de $30. Compuesta por 8 tramos alternos: 4 tramos rectos de 130m y 4 curvas de 13m y 90°.
* **`superPista`**: Ubicada en "Argentina", con un precio de $300. Compuesta por una secuencia de tramos con diversos modificadores.

### 4.2. Función `peganLaVuelta/2`

Implementar la función `peganLaVuelta/2`, que permite a un conjunto de automóviles dar una vuelta completa a una pista. Los automóviles que "no dan más" durante la vuelta detienen su avance y no continúan por los tramos restantes.

* **Casos de Prueba a Definir**:

| Condición Inicial                                                                                                                                                                | Resultado Esperado                                                                                                                                                                                                                                                                                                    |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Una Ferrari y un Peugeot, ambos con 79 puntos de desgaste de ruedas, dan una vuelta en la `vueltaALaManzana`.                                                                         | La Ferrari finaliza con un tiempo de carrera de 9.6 segundos. El Peugeot finaliza con un tiempo de carrera de 11.7 segundos, ya que deja de avanzar después de la tercera curva.                                                                                                                                     |

---
## 5. Simulación de Carreras

### 5.1. Modelado de Carrera

Modelar una **Carrera** definida por una pista y un número de vueltas.

* **`tourBuenosAires`**: Una carrera que se lleva a cabo en la `superPista` durante 20 vueltas.

### 5.2. Determinación del Ganador

Implementar un procedimiento que simule una carrera para un conjunto de automóviles. El ganador será el automóvil que complete todas las vueltas y obtenga el menor tiempo de carrera.