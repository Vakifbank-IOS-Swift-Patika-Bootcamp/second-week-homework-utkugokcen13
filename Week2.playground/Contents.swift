import Foundation

// MARK: -  Company
protocol CompanyFunctions{
    func addJrEmployee(name: String, surname: String, age: Int, maritalStatus: String)
    func addSrEmployee(name: String, surname: String, age: Int, maritalStatus: String)
    func addMidEmployee(name: String, surname: String, age: Int, maritalStatus: String)
    func paySalary()
    func addIncome(amount: Double)
    func addExpense(amount: Double)
    func getSalary()
}

class Company: CompanyFunctions{
    var name: String
    var budget: Double
    var foundationYear: Int
    var employeeList: [Employee]
    
    init(companyName: String, companyBudget: Double, companyFoundationYear: Int, companyEmployeeList: [Employee]){
        name = companyName
        budget = companyBudget
        foundationYear = companyFoundationYear
        employeeList = companyEmployeeList
    }
    
    // This function adds income to the company budget.
    func addIncome(amount: Double) {
        budget += amount
    }
    
    //This function adds expense to the company budget.
    func addExpense(amount: Double) {
        budget -= amount
    }
    
    //This function pays salaries of employees.
    func paySalary(){
        for employee in employeeList{
            budget -= employee.salary
        }
    }
    
    //This function adds jr Employee to the company.
    func addJrEmployee(name: String, surname: String, age: Int, maritalStatus: String){
        employeeList.append(JrEmployee(employeeName: name, employeeSurname: surname, employeeAge: age, employeeMaritalStatus: maritalStatus))
    }
    
    //This function adds mid Employee to the company.
    func addMidEmployee(name: String, surname: String, age: Int, maritalStatus: String){
        employeeList.append(MidEmployee(employeeName: name, employeeSurname: surname, employeeAge: age, employeeMaritalStatus: maritalStatus))
    }
    
    //This function adds senior Employee to the company.
    func addSrEmployee(name: String, surname: String, age: Int, maritalStatus: String){
        employeeList.append(SrEmployee(employeeName: name, employeeSurname: surname, employeeAge: age, employeeMaritalStatus: maritalStatus))
    }
    
    //This function prints the salaries of the employees.
    func getSalary() {
        for employee in employeeList{
            print("Employee \(employee.name) \(employee.surname) has \(employee.salary) salary")
        }
    }
}

//Employee class
class Employee{
    var name: String
    var surname: String
    var age: Int
    var maritalStatus: String?
    var salary: Double {
        return Double(age * salaryFactor * 1000)
    }
    var salaryFactor: Int {
        return 0
    }
    
    init(employeeName: String, employeeSurname: String, employeeAge: Int, employeeMaritalStatus: String){
        name = employeeName
        surname = employeeSurname
        age = employeeAge
        maritalStatus = employeeMaritalStatus

    }
}

//JrEmployee class that inherits Employee class
class JrEmployee: Employee{
    override var salaryFactor: Int {
        return 2
    }
    override var salary: Double {
        return Double(age * salaryFactor * 1000)
    }
}

//MidEmployee class that inherits Employee class
class MidEmployee: Employee{
    override var salaryFactor: Int {
        return 3
    }
    override var salary: Double {
        return Double(age * salaryFactor * 1000)
    }
}

//SrEmployee class that inherits Employee class
class SrEmployee: Employee{
    override var salaryFactor: Int {
        return 4
    }
    override var salary: Double {
        return Double(age * salaryFactor * 1000)
    }
}

//--------------------------------------------------------------------------------------------------
var myCompany = Company(companyName: "Meta", companyBudget: 1000000, companyFoundationYear: 1984, companyEmployeeList: [])
myCompany.addJrEmployee(name: "Sergio", surname: "Oliveira", age: 32, maritalStatus: "Single")
myCompany.addSrEmployee(name: "Juan", surname: "Mata", age: 35, maritalStatus: "Married")
myCompany.addMidEmployee(name: "Mauro", surname: "Icardi", age: 29, maritalStatus: "Married")
myCompany.addJrEmployee(name: "Kerem", surname: "Aktürkoğlu", age: 24, maritalStatus: "Single")

myCompany.getSalary()
print("Total budget is: \(myCompany.budget) before salary payment")
myCompany.paySalary()
print("Total budget is: \(myCompany.budget) after salary payment")
myCompany.addExpense(amount: 300000)
myCompany.addIncome(amount: 200000)
print(myCompany.budget)

print("--------------------------------------------------------------------------------------------------")




// MARK: -  Zoo
protocol ZooFunctions{
    func addIncome(amount: Double)
    func addExpense(amount: Double)
    func increaseWaterLimit(amount: Double)
    func paySalary()
    func addZooKeeper(keeper: ZooKeeper)
    func addAnimal(animal: Animal)
    func getKeeperList()
    func getAnimalList()
    func assignKeeperToAnimal(keeper: ZooKeeper, animal: Animal)
    func subtractWaterUsage()
}

class Zoo: ZooFunctions{
    var dailyWaterLimit: Double
    var budget: Double
    var animalList: [Animal]
    var zooKeeperList: [ZooKeeper]
    
    init(waterLimit: Double, zooBudget: Double, zooAnimalList: [Animal], zooZookeeperList: [ZooKeeper]){
        dailyWaterLimit = waterLimit
        budget = zooBudget
        animalList = zooAnimalList
        zooKeeperList = zooZookeeperList
    }
    
    // This function adds income to the zoo budget.
    func addIncome(amount: Double) {
        budget += amount
    }
    
    // This function adds expense to the zoo budget.
    func addExpense(amount: Double) {
        budget -= amount
    }
    
    // This function increases the daily water uasge limit.
    func increaseWaterLimit(amount: Double) {
        dailyWaterLimit += amount
    }
    
    // This function pays salaries of zoo keepers.
    func paySalary() {
        for zooKeeper in zooKeeperList{
            budget -= zooKeeper.salary
        }
    }
    
    // This function adds keepers to zoo
    func addZooKeeper(keeper: ZooKeeper) {
        zooKeeperList.append(keeper)
    }
    
    // This function prints zoo keepers salaries
    func getKeeperList() {
        for keeper in zooKeeperList{
            print(keeper.salary)
        }
    }
    
    // This function prints the animals and their water consumptions.
    func getAnimalList() {
        for animal in animalList{
            print("\(animal.type) has \(animal.waterConsumption) water consumption")
        }
    }
    
    //This function assings a keeper to an animal.
    func assignKeeperToAnimal(keeper: ZooKeeper, animal: Animal) {
        keeper.animalList.append(animal)
        animal.keeper = keeper
    }
    
    //This function adds an animal to the zoo.
    func addAnimal(animal: Animal) {
        animalList.append(animal)
    }
    
    //This function subtract daily water usage from the limit.
    func subtractWaterUsage() {
        var dailyWaterUsage = 0.0
        for animal in animalList{
            dailyWaterUsage += animal.waterConsumption
        }
        dailyWaterLimit -= dailyWaterUsage
    }
}

class Animal {
    var type: String
    var waterConsumption: Double
    var voice: String?
    var keeper: ZooKeeper? = nil
    var difficultyFactor: Int
    
    init(animalType: String, animalWaterConsumption: Double, animalVoice: String, animalDifficultyFactor: Int){
        type = animalType
        waterConsumption = animalWaterConsumption
        voice = animalVoice
        difficultyFactor = animalDifficultyFactor
    }
}

class ZooKeeper{
    var animalList: [Animal]
    var salary: Double{
        var tempSalary = 0.0
        if(animalList.count != 0){
            //Zoo keepers salaries are calculated by multiplying the animals' difficulty factor by 1000
            for i in 0...animalList.count - 1{
                tempSalary += Double(animalList[i].difficultyFactor * 1000)
            }
        }
        return tempSalary
    }
    
    init(keeperAnimalList: [Animal]){
        animalList = keeperAnimalList
    }
}

//My zoo
var myZoo = Zoo(waterLimit: 300.0, zooBudget: 1_000_000, zooAnimalList: [], zooZookeeperList: [])

//ZooKeeper Initialization
var keeper1: ZooKeeper = ZooKeeper(keeperAnimalList: [])
var keeper2: ZooKeeper = ZooKeeper(keeperAnimalList: [])
var keeper3: ZooKeeper = ZooKeeper(keeperAnimalList: [])
var keeper4: ZooKeeper = ZooKeeper(keeperAnimalList: [])

//Animal Initialization
var horse: Animal = Animal(animalType: "Horse", animalWaterConsumption: 15.0, animalVoice: "brüfsss", animalDifficultyFactor: 2)
var lion: Animal = Animal(animalType: "Lion", animalWaterConsumption: 32.0, animalVoice: "wroaghhh", animalDifficultyFactor: 7)
var elephant: Animal = Animal(animalType: "Elephant", animalWaterConsumption: 59.0, animalVoice: "filfilfil", animalDifficultyFactor: 6)

//Add ZooKeeper
myZoo.addZooKeeper(keeper: keeper1)
myZoo.addZooKeeper(keeper: keeper2)
myZoo.addZooKeeper(keeper: keeper3)
myZoo.addZooKeeper(keeper: keeper4)

//Add Animal
myZoo.addAnimal(animal: horse)
myZoo.addAnimal(animal: lion)
myZoo.addAnimal(animal: elephant)

//Assign keeper to animals
myZoo.assignKeeperToAnimal(keeper: keeper1, animal: horse)
myZoo.assignKeeperToAnimal(keeper: keeper1, animal: lion)
myZoo.assignKeeperToAnimal(keeper: keeper2, animal: elephant)


//ZooKeeper salaries
for keeper in myZoo.zooKeeperList{
    print(String(keeper.salary))
}

//Water consumption
print("Daily water limit at the BEGINNING of the day: \(myZoo.dailyWaterLimit) L")
myZoo.subtractWaterUsage()
print("Daily water limit at the END of the day: \(myZoo.dailyWaterLimit) L")


//Salary payment
print("Budget of the zoo before salary payment \(myZoo.budget) TL")
myZoo.paySalary()
print("Budget of the zoo after salary payment \(myZoo.budget) TL")

//Increase water usage limit
print("Daily water limit before increase \(myZoo.dailyWaterLimit)")
myZoo.increaseWaterLimit(amount: 50.0)
print("Daily water limit after increase \(myZoo.dailyWaterLimit)")

//Add income, expense
print("Budget before adding income \(myZoo.budget)")
myZoo.addIncome(amount: 20_000)
print("Budget after adding income \(myZoo.budget)")

print("Budget before adding expense \(myZoo.budget)")
myZoo.addExpense(amount: 70_000)
print("Budget after adding expense \(myZoo.budget)")

// Get animals and their water consumption.
myZoo.getAnimalList()














