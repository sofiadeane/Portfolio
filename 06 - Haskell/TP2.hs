import Text.Show.Functions
import Distribution.Simple.Setup (trueArg)


data Auto = Auto {
    marca :: String,
    modelo :: String,
    desgasteRueda :: Float,
    desgasteChasis :: Float, 
    velocidadMaxima :: Float, 
    tiempoDeCarrera :: Float, 
    apodos :: [String]
} deriving (Show)

data Equipo = Equipo {
    nombreEquipo :: String,
    autos :: [Auto],
    presupuesto :: Float
} deriving (Show)

equipo1 :: Equipo
equipo1 = Equipo {
    nombreEquipo = "one", 
    autos = [auto1, auto2], 
    presupuesto = 20000
}

equipo2 :: Equipo
equipo2 = Equipo {
    nombreEquipo = "los OG", 
    autos = [auto2, auto3], 
    presupuesto = 7000
}

equipo3 :: Equipo
equipo3 = Equipo {
    nombreEquipo = "Trinidad", 
    autos = [auto5, auto6], 
    presupuesto = 20000
}

equipo4 :: Equipo
equipo4 = Equipo {
    nombreEquipo = "todos", 
    autos = [auto1, auto2, auto3, auto4], 
    presupuesto = 20000
}

equipo5 :: Equipo
equipo5 = Equipo {
    nombreEquipo = "5-upla", 
    autos = [auto7], 
    presupuesto = 10000
}

equipo0 :: Equipo
equipo0 = Equipo {
    nombreEquipo = "zero", 
    autos = [], 
    presupuesto = 10
}


auto1 :: Auto
auto1 = Auto {
    marca = "Ferrari",
    modelo = "F50",
    desgasteRueda = 0,
    desgasteChasis = 0, 
    velocidadMaxima = 65, 
    tiempoDeCarrera = 0, 
    apodos = ["La Nave", "El fierro", "Ferrucho"]
}

auto2 :: Auto
auto2 = Auto {
    marca = "Lamborghini",
    modelo = "Diablo",
    desgasteRueda = 7,
    desgasteChasis = 4, 
    velocidadMaxima = 73, 
    tiempoDeCarrera = 0, 
    apodos = ["Lambo", "La bestia"]
}

auto3 :: Auto
auto3 = Auto {
    marca = "Fiat",
    modelo = "600",
    desgasteRueda = 27,
    desgasteChasis = 33, 
    velocidadMaxima = 44, 
    tiempoDeCarrera = 0, 
    apodos = ["La Bocha", "La bolita", "Fitito"]
}

auto4 :: Auto
auto4 = Auto {
    marca = "Peugeot",
    modelo = "504",
    desgasteRueda = 0,
    desgasteChasis = 0, 
    velocidadMaxima = 40, 
    tiempoDeCarrera = 0, 
    apodos = ["El rey del desierto"]
} 

auto4AUX :: Auto
auto4AUX = Auto {
    marca = "Peugeot",
    modelo = "504",
    desgasteRueda = 0,
    desgasteChasis = 30, 
    velocidadMaxima = 40, 
    tiempoDeCarrera = 0, 
    apodos = ["El rey del desierto"]
}

auto5 :: Auto
auto5 = Auto {
    marca = "Ferrari",
    modelo = "F50",
    desgasteRueda = 0,
    desgasteChasis = 10, 
    velocidadMaxima = 65, 
    tiempoDeCarrera = 0, 
    apodos = ["La Nave", "El fierro", "Ferrucho"]
}

auto6 :: Auto
auto6 = Auto {
    marca = "Lamborghini",
    modelo = "F50",
    desgasteRueda = 0,
    desgasteChasis = 20, 
    velocidadMaxima = 65, 
    tiempoDeCarrera = 0, 
    apodos = ["La Nave", "El fierro", "Ferrucho"]
}

auto7 :: Auto
auto7 = Auto {
    marca = "Fiat",
    modelo = "600",
    desgasteRueda = 27,
    desgasteChasis = 50, 
    velocidadMaxima = 44, 
    tiempoDeCarrera = 0, 
    apodos = ["Tortuga", "Caracol", "Molusco"]
}


-- PUNTO 1: Equipos de competición
{-  1.a
    Realizar una reparación en equipo, que repare todos los autos de un equipo y descuente del 
    presupuesto el costo de reparación mientras tenga presupuesto suficiente. El costo es $500 
    por cada punto de desgaste reducido en chasis.  
    costoReparacion :: Auto -> Float
    costoReparacion auto = (desgasteChasis auto) * 500
-}

--funciones auxiliares
costoDeRepararUnAuto :: Auto -> Float
costoDeRepararUnAuto = (* 500) . (*0.85) . desgasteChasis

repararAuto :: Auto -> Auto
repararAuto auto = auto {
    desgasteChasis = (*0.15) . desgasteChasis $ auto, 
    desgasteRueda = 0
}

-- tipos de funciones que operan con equipos
type ModificadorDeEquipo = (Equipo -> Auto -> Equipo)

-- Orden Superior: Le aplica una ModificadorDeEquipo a un equipo
funcionEnEquipo :: ModificadorDeEquipo -> Equipo -> Equipo
funcionEnEquipo modificadorEquipo equipo = foldl modificadorEquipo equipo{autos=[]} (autos equipo)

-- Transforma una funcion de tipo (Auto -> Auto) en ModificadorDeEquipo
rayoModificadorDeEquipoizador :: (Auto -> Auto) -> (Auto -> Float) -> ModificadorDeEquipo
rayoModificadorDeEquipoizador funcion costo equipo auto
    | presupuesto equipo >= costo auto = equipo {
                                            autos = autos equipo ++ [funcion auto], 
                                            presupuesto = presupuesto equipo - costo auto
    }
    | otherwise = equipo {autos = autos equipo ++ [auto]}


repararEquipo :: ModificadorDeEquipo
repararEquipo = rayoModificadorDeEquipoizador repararAuto costoDeRepararUnAuto

reparracionDeAutosEnEquipo :: Equipo -> Equipo
reparracionDeAutosEnEquipo = funcionEnEquipo repararEquipo 


{- 1.b
    Optimizar autos en equipo. Se trabaja con los autos de un equipo y se “pone nitro” a cada uno, 
    hasta que se encuentre un auto que no haya más presupuesto. El costo de poner nitro a un auto 
    es de la velocidad máxima del auto (antes de poner nitro) * $100.
    
    ponerNitro auto = auto{velocidadMaxima = velocidadMaxima auto * 1.2}
-}

costoNitro :: Auto -> Float
costoNitro = (*100) . velocidadMaxima

ponerNitro :: Auto -> Auto
ponerNitro auto = auto{velocidadMaxima = velocidadMaxima auto * 1.2}

optimizarEquipo :: ModificadorDeEquipo
optimizarEquipo = rayoModificadorDeEquipoizador ponerNitro costoNitro

optimizacionDeAutosEnEquipo :: Equipo -> Equipo
optimizacionDeAutosEnEquipo = funcionEnEquipo optimizarEquipo

{-  1.c
    Ferrarizar: llevar todos los autos al desarmadero para cambiar su marca a Ferrari y modelo a
    F50. Realizar esto hasta que no alcance el presupuesto. El costo de convertir un auto en una
    Ferrari es de $3500. Si un auto del equipo ya era Ferrari, queda igual que como estaba y no 
    hay costo para ese auto.
-}

ferrarizarAuto :: Auto -> Auto
ferrarizarAuto auto = auto{marca = "Ferrari"}

costoDeFerrarizar :: Num a => Auto -> a
costoDeFerrarizar auto
    |marca auto == "Ferrari" = 0
    |otherwise = 3500

ferrarizarEquipo :: ModificadorDeEquipo
ferrarizarEquipo = rayoModificadorDeEquipoizador ferrarizarAuto costoDeFerrarizar

ferrarizacionDeAutosEnEquipo :: Equipo -> Equipo
ferrarizacionDeAutosEnEquipo = funcionEnEquipo ferrarizarEquipo


{- PUNTO 2: Equipo Infinia
Tenemos el equipo Infinia, cuyos autos son:
    - auto Ferrari con desgaste de chasis 1
    - auto Ferrari con desgaste de chasis 1 y con el doble de velocidad
    - auto Ferrari con desgaste de chasis 1 y con el triple de velocidad
    - auto Ferrari con desgaste de chasis 1 y con el cuádruple de velocidad
y así indefinidamente… tiene $5000 de presupuesto.
-}

{-  2.a
    Modelar al equipo Infinia.

Infinia :: Equipo
Infinia = Equipo {
    nombreEquipo = "Infinia",
    autos = [auto1 {marca = "Ferrari ", modelo = "F50", desgasteChasis = 1, velocidadMaxima = 1}, 
             auto2 {marca = "Ferrari ", modelo = "F50", desgasteChasis = 1, velocidadMaxima = 2}, 
             auto3 {marca = "Ferrari ", modelo = "F50", desgasteChasis = 1, velocidadMaxima = 3}, 
             auto4 {marca = "Ferrari ", modelo = "F50", desgasteChasis = 1, velocidadMaxima = 4}]
         --  auton {marca = "Ferrari ", modelo = "F50", desgasteChasis = 1, velocidadMaxima = n}]
    presupuesto = 5000}
-}

infinia :: Equipo
infinia = Equipo {
    nombreEquipo = "Infinia",
    autos = autosInfinitos,
    presupuesto = 5000}

autosInfinitos :: [Auto]
autosInfinitos = map crearAuto [0..]
    where
        crearAuto velocidad = Auto "Ferrari" "F50" 0 1 velocidad 0 ["La Nave", "El Fierro", "Ferrucho"]

{-  2.b
    Contestar qué sucede si:
        i - Se realiza una reparación en equipo de ese equipo.
        Nunca termina de operar la funcion operacionRecursiva (usada por reparacionEnEquipo), 
        entra en un bucle recursivo infinito al no llegar nunca al caso base que es la lista vacia.

        ii - Se optimizan los autos de ese equipo.
        Nunca termina de operar la funcion operacionRecursiva (usada por optimizarEquipo), entra en un
        bucle recursivo infinito al no llegar nunca al caso base que es la lista vacia
    
        iii - Se ferrarizan sus autos.
        Nunca termina de operar la funcion operacionRecursiva (usada por optimizarEquipo), entra en un
        bucle recursivo infinito al no llegar nunca al caso base que es la lista vacia ya que la distincion
        entre tipos de autos esta hecha por la funcion de costo no la de transformacion.

        En versiones anteriores, la funcion devolvia el equipo infinia sin modificar al no tener que entrar nunca
        a modificar un auto ya que todos son ferraris.

        iv - Se quiere saber el nivel de joyez de los autos del equipo.
        nivelDeJoyez :: [Auto] -> Int
        nivelDeJoyez listaDeAutos = sum(map joyezDeUnAuto listaDeAutos)

        No terminaria de procesar nunca la función, ya que tengo que sumar infinitos números, 
        porque la lista se compone de infinitos autos. 

-}


--CODIGO NECESARIO DE LA ENTREGA 1

type Parametros = [Float]

type Tramo = Auto -> Auto

{-
    a. La curva tiene dos datos relevantes: el ángulo y la longitud. 
        - Al atravesar una curva, el auto sufre un desgaste de ruedas de valor: 3 * longitud / ángulo.
        - Suma un tiempo de longitud / ( velocidad máxima / 2 )
        - Modelar curvaPeligrosa, que es una curva de ángulo 60 y longitud de 300m
        - Modelar curvaTranca, que es una curva de ángulo 110 y longitud de 550m
-}
transitarCurva :: Float -> Float -> Auto -> Auto
transitarCurva angulo longitud auto = auto {
                                            desgasteRueda = desgasteRueda auto + 3 * longitud / angulo, 
                                            tiempoDeCarrera = tiempoDeCarrera auto + tiempo
   } where tiempo = longitud / (velocidadMaxima auto/2)

curvaPeligrosa :: Tramo
curvaPeligrosa = transitarCurva 60 300

curvaTranca :: Tramo
curvaTranca = transitarCurva 110 550



{-
    b. El tramo recto:
        - Debido a la alta velocidad se afecta el chasis del auto en una centésima parte de la longitud del tramo.
        - Suma un tiempo de longitud / velocidad máxima
        - Modelar tramoRectoClassic de 715 m
        - Modelar tramito de 260 m
-}

--Tramos Rectos = [angulo = 0, longitud]
--tiempo: longitud / velocidad
transitarTramoRecto :: Float -> Auto -> Auto
transitarTramoRecto longitud auto = auto{
                                                desgasteChasis = desgasteChasis auto + longitud / 100, 
                                                tiempoDeCarrera = tiempoDeCarrera auto + (longitud / velocidadMaxima auto)
                                                }

tramoRectoClassic :: Tramo
tramoRectoClassic = transitarTramoRecto 715

tramito :: Tramo
tramito = transitarTramoRecto 260

{-
    c. Tramo zigzag, que tiene una cantidad de cambios de dirección.
        - Suma un tiempo de cambios * 3
        - Genera un desgaste de chasis de 5 y un desgaste de ruedas de velocidad máxima * cambios / 10
        - Modelar zigZagLoco, con 5 cambios de dirección.
        - Modelar casiCurva, con 1 cambio de dirección.
-}
--Zigzags = [cantidad de cambios de dirección]
transitarZigZag :: Float -> Auto -> Auto
transitarZigZag cambios auto = auto {
                                    tiempoDeCarrera = tiempoDeCarrera auto + (cambios * 3), 
                                    desgasteChasis = desgasteChasis auto + 5, 
                                    desgasteRueda = desgasteRueda auto + velocidadMaxima auto * cambios / 10
                                    }

zigZagLoco :: Tramo
zigZagLoco = transitarZigZag 5

casiCurva :: Tramo
casiCurva = transitarZigZag 1

{-
    d. Tramo rulo en el aire, que tiene un diámetro en metros.
        - Genera un desgaste de ruedas que corresponde a diámetro * 1.5
        - Suma un tiempo de 5 * diámetro / velocidad máxima.
        - Modelar ruloClasico con 13 metros de diámetro.
        - Modelar deseoDeMuerte, un rulo con 26 metros de diámetro.
-}

tramoRulo :: Float -> Auto -> Auto
tramoRulo diametro auto = auto{
                                desgasteRueda = desgasteRueda auto + diametro * 1.5, 
                                tiempoDeCarrera = tiempoDeCarrera auto + (5 * diametro / velocidadMaxima auto)
                                }

ruloClasico :: Tramo
ruloClasico = tramoRulo 13

deseoDeMuerte :: Tramo
deseoDeMuerte = tramoRulo 26





-- PUNTO 3: Modificadores de tramos
{- 3.a
    Cuando pasa por un tramo que tiene boxes agregado, puede entrar o no a boxes, pero siempre 
    atraviesa el tramo produciendo el desgaste y tiempos originales. Si entra a boxes el auto 
    se repara (lo que agrega 10 segundos adicionales al tiempo de carrera). 
-}

enBuenEstado :: Auto -> Bool
enBuenEstado auto =  marca auto /= "Peugeot" || ((even . round) (tiempoDeCarrera auto) && chasisMenorA 20 auto ) || (  (odd . round) (tiempoDeCarrera auto) && chasisMenorA 40 auto && ruedasMenorA 60 auto) 

entrarABoxes :: Tramo -> Auto -> Auto
entrarABoxes tramo auto
    | not . enBuenEstado $ auto  = boxes.tramo $ auto 
    | otherwise = auto
    where 
        boxes auto =  auto { desgasteChasis = desgasteChasis auto * 0.15, 
            desgasteRueda = 0, 
            tiempoDeCarrera = tiempoDeCarrera auto  + 10}

{- 3.b
    Cualquier tramo existente puede estar mojado. Esto hace que, además de los efectos que produce 
    el tramo, sume 50% más del tiempo de carrera que produce originalmente el tramo. 
-}

estaMojado :: Tramo -> Auto -> Auto
estaMojado tramo = mojado.tramo 
    where mojado auto = auto{ tiempoDeCarrera = ((1.5*) . tiempoDeCarrera ) auto  }


{- 3.c
    Algunos tramos tienen ripio (sí... están un poco descuidadas las pistas) y producen el doble 
    de efecto de un tramo normal equivalente, y se tarda el doble en atravesarlo también. 
    Nos aclaran que, por suerte, nunca hay boxes con ripio. 
-}
tieneRipio :: Tramo -> Auto -> Auto
tieneRipio tramo auto = (ripio . tramo . tramo) auto
    where 
        ripio auto = auto{tiempoDeCarrera = ((*2) . tiempoDeCarrera) auto }


{- 3.d
    Los tramos que tienen alguna obstrucción, además, producen un desgaste en las ruedas de acuerdo 
    a la cantidad de metros afectada, siendo 2 puntos de desgaste por cada metro de pista que esté 
    obstruida, producto de la maniobra que se debe realizar al esquivar dicha obstrucción.
-}
tieneObstruccion :: Float -> Tramo -> Auto -> Auto
tieneObstruccion metros tramo auto = obstruccion metros (tramo auto )
    where
        obstruccion metros auto = auto {desgasteRueda = desgasteRueda auto + (metros *2)}



{- 3.e
    Tramo con turbo, durante el tramo a atravesar, el auto cuenta con el doble de velocidad máxima. 
    Luego del tramo, el auto debería tener la velocidad máxima que tenía antes de recorrerlo.
-}
tieneTurbo :: Tramo -> Auto -> Auto
tieneTurbo tramo auto = tramo (auto{velocidadMaxima = (*2) . velocidadMaxima $ auto })



-- PUNTO 4: pasarPorTramo

{- 4.a
    Realizar la función que haga pasarPorTramo/2 que, dado un tramo y un auto, hace que el auto
    atraviese el tramo, siempre y cuando no pase que no da más al inicio del tramo. Si el escenario
    es que no da más, entonces el auto no recibe ningún efecto, ya que no pasa por el tramo.
-}

chasisMenorA :: Float -> Auto -> Bool
chasisMenorA n auto = desgasteChasis auto < n
ruedasMenorA :: Float -> Auto -> Bool
ruedasMenorA n auto = desgasteChasis auto < n
noDaMas :: Auto -> Bool
noDaMas auto = (not (chasisMenorA 80 auto) && (take 3.head.apodos) auto == "La ") || not (ruedasMenorA 80 auto )

pasarPorTramo :: Tramo -> Auto -> Auto 
pasarPorTramo tramo auto 
    |not . noDaMas $ auto = tramo auto 
    |otherwise = auto 

-- PUNTO 5: Atravesando pistas

{- 5.a
    Crear la vueltaALaManzana. Es una pista que se llama “La manzana”, en “Italia”, con un precio 
    de $30 y con:
        i - tramo recto de 130m
        ii - curva de 13m de 90°
        iii - tramo recto de 130m
        iv - curva de 13m de 90°
        v - tramo recto de 130m 
        vi - curva de 13m de 90º
        vii - tramo recto de 130m
        viii - curva de 13m de 90°
-}
data Pista = Pista {
    nombrePista :: String,
    pais :: String,
    precio :: Float, 
    tramos :: [Tramo]
} deriving Show
{-
pista pistaPrueba = Pista {
    nombrePista = "Pista de prueba",
    pais = "Argentina",
    precio = 100,
    tramos = [transitarTramoRecto 100, transitarCurva 90 10]
}

-}

laVueltaManzana :: Pista
laVueltaManzana = Pista  {nombrePista = "La manzana", 
pais = "Italia", precio= 30, tramos = [transitarTramoRecto 130, transitarCurva 90 13,
transitarTramoRecto 130, transitarCurva 90 13, 
transitarTramoRecto 130, transitarCurva 90 13, 
transitarTramoRecto 130, transitarCurva 90 13]}
--Buscar la manera de no repetir 4 veces lo mismo en la lista 


{- 5.b
    Crear la superPista, en “Argentina”, con precio de $300 y con los siguientes tramos:
        i - tramoRectoClassic
        ii - curvaTranca
        iii - 2 tramitos consecutivos, pero el segundo está mojado y el primero con turbo
        iv - Rulo en el aire de 10m
        v - Curva con ángulo de 80º, longitud 400m; con obstrucción de 2m
        vi - Curva con ángulo de 115º, longitud 650m
        vii - Tramo recto de 970m
        viii - curvaPeligrosa
        ix - tramito con ripio
        x - Boxes con un Tramo Recto de 800m
        xi - casiCurva con una obstrucción de 5m
        xii - Tramo zig zag de 2 cambios
        xiii - deseoDeMuerte, mojado y de ripio (“¿Cómo que de ripio? Si es un rulo... ¡se caen las piedras!”... Sí, nosotros nos preguntamos lo mismo)
        xiv - ruloClasico
        xv - zigZagLoco
-}

superPista :: Pista
superPista = Pista {nombrePista = "Super Pista", 
pais = "Argentina", precio = 300, tramos = [tramoRectoClassic, curvaTranca, 
estaMojado tramito, tieneTurbo tramito, tramoRulo 10, tieneObstruccion 2 (transitarCurva 80 400), 
transitarCurva 115 650, transitarTramoRecto 970, curvaPeligrosa, 
tieneRipio tramito, entrarABoxes (transitarTramoRecto 800), tieneObstruccion 5 casiCurva,
transitarZigZag 2, (estaMojado . tieneRipio) deseoDeMuerte, ruloClasico, zigZagLoco ]}


{- 5.c
    Hacer la función peganLaVuelta/2 que dada una pista y una lista de autos, hace que todos los 
    autos den la vuelta (es decir, que avancen por todos los tramos), teniendo en cuenta que un 
    auto que no da más “deja de avanzar”.
-}

-- Dado un auto y un tramo, si el auto “no da más” lo dejamos igual y caso contrario, aplicamos el tramo.
aplicarTramoSiPuede :: Auto -> Tramo -> Auto
aplicarTramoSiPuede auto tramo
  | noDaMas auto = auto
  | otherwise     = tramo auto

-- Reemplazamos recursión por foldl que recorre la lista de tramos y devolvuelve el auto resultante.
pasarTramos :: [Tramo] -> Auto -> Auto
pasarTramos listaDeTramos autoInicial =
  foldl aplicarTramoSiPuede autoInicial listaDeTramos

-- La función “peganLaVuelta” queda tal cual
peganLaVuelta :: Pista -> [Auto] -> [Auto]
peganLaVuelta pista = map (pasarTramos (tramos pista))

pasaPorLaPista :: [Tramo] -> Auto -> Auto
pasaPorLaPista [] auto = auto
pasaPorLaPista (tramo:restoDeTramos) auto 
    |not . noDaMas $ auto = pasaPorLaPista restoDeTramos (tramo auto)
    |otherwise = auto 

puedePasarElTramo :: Tramo -> Auto -> Bool
puedePasarElTramo tramo  = not . noDaMas

-- PUNTO 6: ¡¡Y llegaron las carreras!!
{- 6.a
    Modelar una carrera que está dada por una pista y un número de vueltas.
-}
data Carrera = Carrera {
    pista :: Pista, 
    numDeVueltas :: Int 
} deriving Show



{- 6.b
    Representar el tourBuenosAires, una carrera que se realiza en la superPista y tiene 20 vueltas.
-}
tourBuenosAires :: Carrera
tourBuenosAires = Carrera {pista = superPista, numDeVueltas = 20}

{- 6.c
    Hacer que un conjunto de autos juegue una carrera, obteniendo el ganador de la misma, 
    que es el auto que si da más y tiene menor tiempo de carrera.
-}

--Filtro los autos que dan más
autosQueDanMas :: [Auto] -> [Auto]
autosQueDanMas = filter (not . noDaMas) 

-- Resolución utilizando fold

autoGanador :: [Auto] -> [Auto] -- te devuelve una lista de autos ganadores contemplando si hay un hay empate
autoGanador autos = filter (\auto -> tiempoDeCarrera auto == (foldl1 min (map tiempoDeCarrera autos))) autos

recorrerVueltas :: Int -> Pista -> [Auto] -> [Auto]
recorrerVueltas vueltas pista autos = foldl (\autosEnCarrera _ -> peganLaVuelta pista autosEnCarrera) autos [vueltas]

jugarCarrera :: Carrera -> [Auto] -> [Auto] 
jugarCarrera carrera autos = 
    (autoGanador . autosQueDanMas) ( recorrerVueltas (numDeVueltas carrera) (pista carrera) autos) 

