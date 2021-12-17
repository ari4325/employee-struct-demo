// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

contract StructDemo {

  struct Employee {
    uint empid;
    string name;
    string designation;
    string department;
  }

  Employee[] emps;

  function addEmployee(uint empid, string memory name, string memory designation, string memory department) external{
      for(uint i = 0; i < getCount(); i++ ){
         Employee memory emp = emps[i];
         if(emp.empid == empid) revert('User already exists');
      }
      emps.push(Employee(empid, name, designation, department));
  }

  function getCount() internal view returns(uint){
      return emps.length;
  }

  function getEmployee(uint empid) external view returns (Employee memory){
      for(uint i = 0; i < getCount(); i++ ){
         Employee memory emp = emps[i];
          if(emp.empid == empid) return emp;
      }
      revert('Employee Not Found');
  }

}
