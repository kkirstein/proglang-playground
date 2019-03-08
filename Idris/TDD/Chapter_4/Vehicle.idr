-- Vehicle.idr
--
-- Demonstrates type families
-- includes first part of exercise 4.2

||| Power source for Vehicle type
data PowerSource = Petrol | Pedal | Electric

||| Vehicle data type parametrized by power source
data Vehicle : PowerSource -> Type where
  ||| Unicycle, powered by pedal
  Unicycle : Vehicle Pedal
  ||| Bicycle, powered by pedal
  Bicycle : Vehicle Pedal
  ||| Motorcycle, powered by petrol
  Motorcycle : (fuel : Nat) -> Vehicle Petrol
  ||| Car, powered by petrol
  Car : (fuel : Nat) -> Vehicle Petrol
  ||| Bus, powered by petrol
  Bus : (fuel : Nat) -> Vehicle Petrol
  ||| Tram, electical powered
  Tram : Vehicle Electric
  ||| ECar, electrical powered by battery
  ECar : (bat : Nat) -> Vehicle Electric


||| gives number of wheels
wheels : Vehicle power -> Nat
wheels Bicycle = 2
wheels (Car fuel) = 4
wheels (Bus fuel) = 4
wheels Unicycle = 1
wheels (Motorcycle fuel) = 2
wheels Tram = 16
wheels ECar = 4

||| refuels petrol powered vehicles
refuel : Vehicle Petrol -> Vehicle Petrol
refuel (Car fuel) = Car 100
refuel (Bus fuel) = Bus 200
refuel (Motorcycle fuel) = Motorcycle 50
refuel Bicycle impossible
refuel Unicycle impossible

||| charges electrical powered vehicles with battery
charge : Vehicle Electric -> Vehicle Electric
charge Tram = Tram   -- nothing changed, not fully reflected by type
charge (ECar bat) = ECar 70

