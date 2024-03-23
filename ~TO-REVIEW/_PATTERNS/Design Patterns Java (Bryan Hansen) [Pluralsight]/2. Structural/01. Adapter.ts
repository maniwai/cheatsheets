/**
 * LEGACY CODE
 */
interface Employee {
  getFirstName(): string;
  getLastName(): string;
}
class EmployeeDB implements Employee {
  private firstname: string;
  private lastname: string;

  public constructor(firstname: string, lastname: string) {
    this.firstname = firstname;
    this.lastname = lastname;
  }

  getFirstName(): string {
    return this.firstname;
  }
  getLastName(): string {
    return this.lastname;
  }
}
/**
 * Other Legacy Code
 */
class EmployeeLdap {
  private _surname: string;
  private _givenName: string;

  public constructor(surname: string, givenName: string) {
    this._surname = surname;
    this._givenName = givenName;
  }
  public get givenName() {
    return this._givenName;
  }
  public get surname() {
    return this._surname;
  }
}
/**
 * CLIENT CODE
 */
class EmployeeAdapterLdap implements Employee {
  private instance: EmployeeLdap;
  public constructor(instance: EmployeeLdap) {
    this.instance = instance;
  }
  getFirstName(): string {
    return this.instance.surname;
  }
  getLastName(): string {
    return this.instance.givenName;
  }
  // Note: If we add more functionality (than required by Employee)
  // ... it become a Decorator pattern
}
class EmployeeClient {
  getEmployeeList() {
    // Legacy Code
    let employees: Employee[] = [];
    let employeeFromDB: Employee = new EmployeeDB("John", "Doe");
    employees.push(employeeFromDB);
    // Client Code
    let employeeFromLdap: EmployeeLdap = new EmployeeLdap("Eric", "William");
    let employeeFrommLdap: Employee = new EmployeeAdapterLdap(employeeFromLdap); // Adapter in action
    employees.push(employeeFrommLdap);
    return employees;
  }
}

const client = new EmployeeClient();
const employees = client.getEmployeeList();
console.log(employees);
