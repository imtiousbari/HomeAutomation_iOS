//
//  OfficeData.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 23/4/24.
//

struct Employee: Hashable {
    var name: String
    var position: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(position)
    }
    
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.name == rhs.name && lhs.position == rhs.position
    }
}



struct Department {
    var name: String
    var employees: [Employee]
}

struct Office {
    var name: String
    var departments: [Department]
}

var employeesInOffice: [Office] = []

// Function to add a new office
func addOffice(name: String) {
    let newOffice = Office(name: name, departments: [])
    employeesInOffice.append(newOffice)
}

// Function to add a new department to an existing office
func addDepartment(to officeIndex: Int, name: String) {
    guard officeIndex < employeesInOffice.count else {
        print("Error: Invalid office index")
        return
    }
    let newDepartment = Department(name: name, employees: [])
    employeesInOffice[officeIndex].departments.append(newDepartment)
}

// Function to add a new employee to a department
func addEmployee(to officeIndex: Int, departmentIndex: Int, name: String, position: String) {
    guard officeIndex < employeesInOffice.count, departmentIndex < employeesInOffice[officeIndex].departments.count else {
        print("Error: Invalid office or department index")
        return
    }
    let newEmployee = Employee(name: name, position: position)
    employeesInOffice[officeIndex].departments[departmentIndex].employees.append(newEmployee)
}

// Function to edit an existing employee's position
func editEmployeePosition(in officeIndex: Int, departmentIndex: Int, employeeIndex: Int, newPosition: String) {
    guard officeIndex < employeesInOffice.count, departmentIndex < employeesInOffice[officeIndex].departments.count, employeeIndex < employeesInOffice[officeIndex].departments[departmentIndex].employees.count else {
        print("Error: Invalid office, department, or employee index")
        return
    }
    employeesInOffice[officeIndex].departments[departmentIndex].employees[employeeIndex].position = newPosition
}

// Function to delete an office
func deleteOffice(at index: Int) {
    guard index < employeesInOffice.count else {
        print("Error: Invalid office index")
        return
    }
    employeesInOffice.remove(at: index)
}

// Function to delete a department from an office
func deleteDepartment(from officeIndex: Int, at departmentIndex: Int) {
    guard officeIndex < employeesInOffice.count, departmentIndex < employeesInOffice[officeIndex].departments.count else {
        print("Error: Invalid office or department index")
        return
    }
    employeesInOffice[officeIndex].departments.remove(at: departmentIndex)
}

// Function to delete an employee from a department
func deleteEmployee(from officeIndex: Int, departmentIndex: Int, at employeeIndex: Int) {
    guard officeIndex < employeesInOffice.count, departmentIndex < employeesInOffice[officeIndex].departments.count, employeeIndex < employeesInOffice[officeIndex].departments[departmentIndex].employees.count else {
        print("Error: Invalid office, department, or employee index")
        return
    }
    employeesInOffice[officeIndex].departments[departmentIndex].employees.remove(at: employeeIndex)
}

// Example usage:
//addOffice(name: "Main Office")
//addDepartment(to: 0, name: "Engineering")
//addEmployee(to: 0, departmentIndex: 0, name: "John Doe", position: "Software Engineer")
//editEmployeePosition(in: 0, departmentIndex: 0, employeeIndex: 0, newPosition: "Senior Software Engineer")
//deleteEmployee(from: 0, departmentIndex: 0, at: 0)
//deleteDepartment(from: 0, at: 0)
//deleteOffice(at: 0)

