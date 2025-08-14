
import Text.Show.Functions
import Distribution.Simple.Setup (trueArg)


--EJERCICIO 1
--Cargo los datos de cada auto usando un data 
data Auto = Auto {
    marca :: String,
    modelo :: String,
    desgasteRueda :: Float,
    desgasteChasis :: Float, 
    velocidadMaxima :: Float, 
    tiempoDeCarrera :: Int, 
    apodos :: [String]
} deriving (Show)

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


auto1AUX :: Auto
auto1AUX = Auto {
    marca = "Ferrari",
    modelo = "F50",
    desgasteRueda = 0,
    desgasteChasis = 0, 
    velocidadMaxima = 65, 
    tiempoDeCarrera = 60, 
    apodos = ["La Nave"]
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




-- EJERCICIO 2 
{- 
    a. Saber si un auto esta en mal estado. Peugeot nunca esta en buen estado segundos de carera par y chasis < 20 desgaste de  chasis < 40 y desgaste de ruedas < 60
-}
chasisMenorA :: Float -> Auto -> Bool
chasisMenorA n auto = desgasteChasis auto < n
ruedasMenorA :: Float -> Auto -> Bool
ruedasMenorA n auto = desgasteChasis auto < n
enBuenEstado :: Auto -> Bool
enBuenEstado auto =  marca auto /= "Peugeot" || (even (tiempoDeCarrera auto) && chasisMenorA 20 auto )|| ( odd (tiempoDeCarrera auto) && chasisMenorA 40 auto && ruedasMenorA 60 auto) 

{-
    b. Saber si un auto no da más, cuando: 
    El desgaste del chasis es mayor a 80 y el primer apodo arranca con La
    El desgaste de las ruedas es maor que 80
-}
noDaMas :: Auto -> Bool
noDaMas auto = (not (chasisMenorA 80 auto) && (take 3.head.apodos) auto == "La ") || not (ruedasMenorA 80 auto )


{-
    c. Saber si el auto es un chiche, cuando: el desgaste de chasis es menor a 20 y la cantidad de apodos es par la cantidad de apodos  es impar y desgaste de chasis menos a 50
-}

--conciderar que pasa cuando la lista de apodos este vacia 
esUnChiche :: Auto -> Bool
esUnChiche auto
    |chasisMenorA 40 auto  = (even.length.apodos) auto --apodos[]
    |otherwise = chasisMenorA 50 auto 

{- 
    d. Saber si es una joya, cuando:
    No hay desgaste ni mas de un apodo
-}
esUnaJoya :: Auto -> Bool
esUnaJoya auto = desgasteChasis auto == 0 && desgasteRueda auto  == 0 && (length . apodos) auto <= 1


{-
    e. Conocer el nivel de chetez de un auto, que es 20 multiplicado por la cantidad de apodos 
    y por la cantidad de letras de su modelo.
-}
chetez :: Auto -> Int
chetez auto = 20 * (length.apodos) auto * (length.modelo) auto


{-
    f. Determinar cuál es la capacidad supercalifragilisticaespialidosa de un auto, que está dada 
    por la cantidad de letras de su primer apodo, incluyendo los espacios en el texto.
-}
capacidadSupercalifragilisticaespialidosa :: Auto -> Int
--cosiderar que pasa cuando un auto no tiene ningun apodo
capacidadSupercalifragilisticaespialidosa = length.head.apodos -- pm apodos[]


{-
    g. Calcular qué tan riesgoso es un auto. Esto es igual a la velocidad máxima por un décimo del 
    desgaste en las ruedas. Y, si el auto no está en buen estado, es el doble.
-}


calcularRiesgo :: Auto -> Float
calcularRiesgo auto
    | enBuenEstado auto = multiplicacionVelocidadYRuedas auto * 0.1
    | otherwise = multiplicacionVelocidadYRuedas auto  * 0.2

multiplicacionVelocidadYRuedas :: Auto -> Float
multiplicacionVelocidadYRuedas auto = velocidadMaxima auto * desgasteRueda auto 

--extraer y abstraer


--EJERCICIO 3

{-
    a. Reparar el auto: 
    - si se repara el desgaste del chasis baja un 85% y
    - el desgaste de las ruedas queda en 0
-} 
reparar auto = auto {
            desgasteChasis = desgasteChasis auto * 0.15, 
            desgasteRueda = 0
            }


{-
    b. Aplicar penalidad aumentando el tiempo de carrera
-}
aplicarPenalidad :: Int -> Auto-> Auto
aplicarPenalidad penalidad auto  = auto{tiempoDeCarrera = tiempoDeCarrera auto + penalidad} 


{-
    c. Poner nitro: aumenta su velocidad un 20%
-}
ponerNitro auto = auto{velocidadMaxima = velocidadMaxima auto * 1.2}


{-
    d. Bautizar auto: agregar un apodo
-}
bautizarAuto :: String -> Auto -> Auto
bautizarAuto apodo auto  = auto {apodos = apodos auto ++ [apodo]}

{-
    e. Llevar a un desarmadero: cambiar marca y modelo por los indicados y cambiar sus apodos 
    por "Nunca Taxi"
-}
desarmadero :: String -> String -> Auto -> Auto
desarmadero  marcaNueva modeloNuevo auto = auto{
                                marca = marcaNueva, 
                                modelo = modeloNuevo, 
                                apodos = ["Nunca taxi"]}




--EJERCICIO 4:
{-
    Modelar una pista que tiene un nombre, pais, precio base de entrada y un conjunto de tramos
-}
data Pista = Pista {
    nombre :: String,
    pais :: String,
    precio :: Float, 
    tramos :: [Tramo]
} deriving (Show)

type Parametros = [Float]

type Tramo = Auto -> Auto

{-
    a. La curva tiene dos datos relevantes: el ángulo y la longitud. 
        - Al atravesar una curva, el auto sufre un desgaste de ruedas de valor: 3 * longitud / ángulo.
        - Suma un tiempo de longitud / ( velocidad máxima / 2 )
        - Modelar curvaPeligrosa, que es una curva de ángulo 60 y longitud de 300m
        - Modelar curvaTranca, que es una curva de ángulo 110 y longitud de 550m
-}
transitarCurva :: Float -> Float  -> Auto -> Auto
transitarCurva angulo longitud auto = auto {
                                            desgasteRueda = desgasteRueda auto + 3 * longitud / angulo, 
                                            tiempoDeCarrera = tiempoDeCarrera auto + round tiempo
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
                                                tiempoDeCarrera = tiempoDeCarrera auto + round (longitud / velocidadMaxima auto)
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
                                    tiempoDeCarrera = tiempoDeCarrera auto + round (cambios * 3), 
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
                                tiempoDeCarrera = tiempoDeCarrera auto + round (5 * diametro / velocidadMaxima auto)
                                }

ruloClasico :: Tramo
ruloClasico = tramoRulo 13

deseoDeMuerte :: Tramo
deseoDeMuerte = tramoRulo 26


-- EJERCICIO 5

{-
    a. Definir una función pisteandoLikeAChamp que aplique una lista de tramos al auto, 
    pero deteniéndose si en algún momento el auto:
        - No está en buen estado, o
        - Ha acumulado un tiempo de carrera mayor o igual a 100.
-}

listaDeTramos1 :: [Tramo]
listaDeTramos1 = [ruloClasico, zigZagLoco, tramoRectoClassic, curvaPeligrosa, deseoDeMuerte]
tiempoMenorOIgual :: Int -> Auto -> Bool
tiempoMenorOIgual n auto = tiempoDeCarrera auto <= n

sePuedeSeguir :: Auto -> Bool
sePuedeSeguir auto = enBuenEstado auto && tiempoMenorOIgual 100 auto 

pisteandoLikeAChamp ::  [Tramo] -> Auto -> Auto
-- frenar si la lista esta vacia
pisteandoLikeAChamp [] auto  = auto
-- llamo recursivamente (si cumple condiciones) y le paso (auto dsps del 1er tramo) (resto de los tramos por recorrer)
pisteandoLikeAChamp  (primerTramo:restoTramos) auto
   | sePuedeSeguir auto = pisteandoLikeAChamp  restoTramos (primerTramo auto)
   | otherwise = auto

-- ✔✔ Casos de prueba creados y testeados (https://docs.google.com/spreadsheets/d/1i6JOzOFxWhGPD0O-It-4SHspdIhcU4Y0sWbhgi6d1bw/edit?usp=sharing)



{-
    b. Queremos calcular el nivelDeJoyez para una serie de autos. Se calcula asi:
        - Si un auto “joya” tiene tiempo en carrera menor a 50 se cuenta como 1.
        - Si el tiempo en carrera es mayor o igual a 50, se "premia" contando 2 
        unidades en lugar de 1
-}
listaDeAutos1 = [auto1AUX, auto2, auto3, auto4]
listaDeAutos2 = [auto1, auto2, auto4]
listaDeAutos3 = [auto2, auto3]


joyezDeUnAuto :: Auto -> Int
joyezDeUnAuto auto
    | not (esUnaJoya auto) = 0
    | esUnaJoya auto && (tiempoDeCarrera auto >= 50) = 2
    | otherwise = 1

nivelDeJoyez :: [Auto] -> Int
nivelDeJoyez listaDeAutos = sum(map joyezDeUnAuto listaDeAutos)

-- ✔✔ Casos de prueba creados y testeados (https://docs.google.com/spreadsheets/d/1i6JOzOFxWhGPD0O-It-4SHspdIhcU4Y0sWbhgi6d1bw/edit?usp=sharing)




{-
    c. Simular una carrera en la que se repite una secuencia de tramos (una vuelta) 
    un número dado de veces para ver cómo queda el auto. El auto deja de correr sí:
        - Se piden 0 o menos vueltas.
        - El auto no está en buen estado.
        - El tiempo en carrera alcanza o supera 300 (se considera fatiga).
-}
type CantVueltas = Int
listaDeTramos2 = [ruloClasico, zigZagLoco]
listaDeTramos3 = [ruloClasico, tramoRectoClassic]


carrera :: [Tramo] -> Int  ->  Auto -> Auto 
carrera  pista 0 auto  = auto
carrera pista vueltas auto
    |tiempoMenorOIgual 300 auto  && seguir auto = carrera  pista (vueltas-1) (pisteandoLikeAChamp pista auto )
    |otherwise = auto
    where seguir auto = enBuenEstado auto && tiempoMenorOIgual 300 auto


{-
    d. Determinar si un grupo de autos son “paraEntendidos”. Con que que al menos un auto:
    - No esté en buen estado 
    - Tenga tiempo de carrera > 200 segundos 
    Se determina que el grupo NO es “paraEntendidos”
-}
esUnAutoParaEntendidos :: Auto -> Bool
esUnAutoParaEntendidos auto = tiempoMenorOIgual 200 auto && enBuenEstado auto


andAplicadoAUnaLista :: [Bool] -> Bool
andAplicadoAUnaLista lista = head lista && andAplicadoAUnaLista (tail lista)

paraEntendidos :: [Auto] -> Bool
paraEntendidos listaAutos = andAplicadoAUnaLista (map esUnAutoParaEntendidos listaAutos)
-- func all y any



-- EJERCICIO 6
{- Equipos de competición

En las carreras, los autos pertenecen a equipos.
Cada equipo tiene un nombre, un conjunto de autos y un presupuesto disponible.
En estos puntos se debe usar recursividad.-}

{- 
    a. Modelar un equipo de competición con su nombre, autos y presupuesto. 
    - Agregar un auto a un equipo, si el equipo tiene suficiente presupuesto.
    - Cada auto tiene un costo de inscripción proporcional a su velocidad máxima: $1,000 por cada m/s.
-}

data Equipo = Equipo {
    nombreEquipo :: String,
    conjuntoDeAutos :: [Auto],
    presupuesto :: Float
} deriving (Show)

equipo1 :: Equipo
equipo1 = Equipo {
    nombreEquipo = "one", 
    conjuntoDeAutos = [auto1, auto2], 
    presupuesto = 140000
}

valorAuto :: Auto -> Float
valorAuto auto = velocidadMaxima auto  *1000
{- 
alcanzaElPresupuesto :: Equipo -> Float -> Bool
alcanzaElPresupuesto equipo unGasto = (presupuesto equipo - unGasto) >= 0

equipoMasUnAuto :: Auto -> Equipo -> Equipo --app par
equipoMasUnAuto auto equipo = equipo{
                                    conjuntoDeAutos = conjuntoDeAutos equipo ++ [auto],
                                    presupuesto = presupuesto equipo - valorAuto auto 
                                    }

agregarAutosAlEquipo:: [Auto] -> Equipo ->  Equipo
agregarAutosAlEquipo [] equipo = equipo

agregarAutosAlEquipo (candidato:resto) equipo 
    | alcanzaElPresupuesto equipo gastoCandidato = agregarAutosAlEquipo resto (equipoMasUnAuto  candidato equipo) 
    | otherwise = agregarAutosAlEquipo resto equipo
    where gastoCandidato = valorAuto candidato
    -}


-- sin usar recursividad: 

valorDelEquipo :: Equipo -> Float
valorDelEquipo equipo = sum (map valorAuto (conjuntoDeAutos equipo))

agregarUnAuto :: Auto -> Equipo -> Equipo
agregarUnAuto  auto equipo
    |valorDelEquipo equipo + valorAuto auto < presupuesto equipo = equipo {conjuntoDeAutos = auto : conjuntoDeAutos equipo}
    | otherwise = equipo

{- 
    b. Realizar una reparación en equipo, que:
        - Repare todos los autos de un equipo
        - Descuente del presupuesto el costo de reparación mientras tenga presupuesto suficiente
    El costo es $500 por cada punto de desgaste reducido en chasis.
-}


costoDeReparacion :: Auto -> Float
costoDeReparacion auto = desgasteChasis auto * 500
-- llamar rep autos y sacar tupla

presupuestoAutos :: (Float, [Auto]) -> (Float, [Auto])
presupuestoAutos (presupuesto, []) = (presupuesto, [])
presupuestoAutos (presupuesto,  auto:resto)
    |costoDeReparacion auto < presupuesto = presupuestoAutos (arreglo auto,  resto)
    | otherwise = (arreglo auto, resto)
    where 
        arreglo auto = presupuesto - costoDeReparacion auto 

repararEquipo :: Equipo -> Equipo
repararEquipo equipo = equipo {presupuesto = presupuestoActual}
    where
        presupuestoActual = fst (presupuestoAutos (presupuesto equipo, conjuntoDeAutos equipo))
        



{-c) Optimizar autos en equipo.
 Se trabaja con los autos de un equipo y se “pone nitro” a cada uno,
  hasta que se encuentre un auto que no esté en buen estado (es decir, 
  se cortan las optimizaciones y se dejan sin modificar el resto de autos).
-}

optimizarAutos :: [Auto] -> [Auto]
optimizarAutos [] = []
optimizarAutos (auto:resto)
    | enBuenEstado auto = ponerNitro auto : optimizarAutos resto  
    | otherwise = auto : resto

optimizarEquipo equipo = equipo { conjuntoDeAutos = autosOptimizados}
    where
        autosOptimizados = optimizarAutos (conjuntoDeAutos equipo)

{-d) Vender autos en mal estado a un valor dado. 
Si un auto cumple la condición de “no da más” (por ejemplo, 
está tan deteriorado que se decide venderlo), 
se “vende” generando ingresos que se suman al presupuesto
 (usando como valor de venta, por ejemplo, $2000 por cada m/s de velocidad máxima). 
 En cuanto se encuentre un auto que no cumpla la condición de “no da más”, se detiene la venta
  y se dejan sin vender el resto de autos.-}

costoDeVenta :: Auto -> Float
costoDeVenta auto = velocidadMaxima auto * 500

-- sacar tuplas
ventasAutos :: (Float, [Auto]) -> (Float, [Auto])
ventasAutos (presupuesto, []) = (presupuesto, [])
ventasAutos (presupuesto,  primero:resto)
    |noDaMas primero  = ventasAutos (venta primero,  resto)
    | otherwise = (presupuesto , primero:resto)
    where 
        venta auto = presupuesto +  costoDeVenta auto 

venderEquipo :: Equipo -> Equipo
venderEquipo equipo = equipo {presupuesto = presupuestoActual}
    where
        presupuestoActual = fst (ventasAutos (presupuesto equipo, conjuntoDeAutos equipo))
 