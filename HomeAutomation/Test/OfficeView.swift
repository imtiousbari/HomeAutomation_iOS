//
//  OfficeView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 23/4/24.
//


import SwiftUI

class OfficeData: ObservableObject {
    @Published var offices: [Office] = []

    func addOffice(_ office: Office) {
        offices.append(office)
    }

    func addDepartment(_ department: Department, to officeName: String) {
        guard let officeIndex = offices.firstIndex(where: { $0.name == officeName }) else {
            return
        }
        offices[officeIndex].departments.append(department)
    }

    func addEmployee(_ employee: Employee, to officeName: String, departmentName: String) {
        guard let officeIndex = offices.firstIndex(where: { $0.name == officeName }),
              let departmentIndex = offices[officeIndex].departments.firstIndex(where: { $0.name == departmentName }) else {
            return
        }
        offices[officeIndex].departments[departmentIndex].employees.append(employee)
    }
}

struct OfficeView: View {
    enum AddType {
        case office, department, employee
    }
    
    @StateObject private var officeData = OfficeData()
    @State private var officeName: String = ""
    @State private var departmentName: String = ""
    @State private var employeeName: String = ""
    @State private var employeePosition: String = ""
    @State private var addType: AddType? = .office // Initially set to add an office

    var body: some View {
        VStack {
            // Input Section
            VStack {
                TextField("Enter \(addType == .office ? "Office" : "Department") Name", text: addType == .office ? $officeName : $departmentName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if addType == .employee || addType == .department {
                    TextField("Enter Employee Name", text: $employeeName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Enter Employee Position", text: $employeePosition)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
            }
            .padding()

            // Add Button
            Button("Add \(addType == .office ? "Office" : addType == .department ? "Department" : "Employee")") {
                switch addType {
                case .office:
                    if !officeName.isEmpty {
                        let office = Office(name: officeName, departments: [])
                        officeData.addOffice(office)
                        officeName = ""
                    }
                case .department:
                    if !departmentName.isEmpty && !officeName.isEmpty {
                        let department = Department(name: departmentName, employees: [])
                        officeData.addDepartment(department, to: officeName)
                        departmentName = ""
                    }
                case .employee:
                    if !employeeName.isEmpty && !employeePosition.isEmpty && !departmentName.isEmpty && !officeName.isEmpty {
                        let employee = Employee(name: employeeName, position: employeePosition)
                        officeData.addEmployee(employee, to: officeName, departmentName: departmentName)
                        employeeName = ""
                        employeePosition = ""
                    }
                case .none:
                    break
                }
            }
            .padding()

            // Type Selector
            Picker(selection: $addType, label: Text("")) {
                Text("Office").tag(AddType.office)
                Text("Department").tag(AddType.department)
                Text("Employee").tag(AddType.employee)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // List Section
            List {
                ForEach(officeData.offices.indices, id: \.self) { officeIndex in
                    Section(header: Text(officeData.offices[officeIndex].name)) {
                        ForEach(officeData.offices[officeIndex].departments.indices, id: \.self) { departmentIndex in
                            VStack(alignment: .leading) {
                                Text(officeData.offices[officeIndex].departments[departmentIndex].name)
                                    .font(.headline)

                                ForEach(officeData.offices[officeIndex].departments[departmentIndex].employees.indices, id: \.self) { employeeIndex in
                                    Text("\(officeData.offices[officeIndex].departments[departmentIndex].employees[employeeIndex].name) - \(officeData.offices[officeIndex].departments[departmentIndex].employees[employeeIndex].position)")
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}





#Preview {
    OfficeView()
}
