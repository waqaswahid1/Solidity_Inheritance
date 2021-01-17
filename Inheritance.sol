// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Human {
    
    uint128 public age;
    
    event logString(string);
    
    constructor()  {
        age=18;
        emit logString("Human constructor called");
    }
    
    function setAge(uint128 _age) public {
        age = _age;
    }
    
    function getAge() public view returns (uint128) {
        return age;
    }
}


contract Student is Human {
    
    constructor()  {
        //age=15;
        emit logString("Student constructor called");
    }
}


contract Monitor is Student {
    constructor()  {
        //age = 22;
        emit logString("Monitor constructor called");
    }
}

contract Teacher is Monitor {
    constructor()  {
        //age = 55;
        emit logString("Teacher constructor called");
    }
}
contract MainContract {
    
    Student public studentObj;
    Monitor public monitorObj;
    Teacher public teacherObj;
    
    
    function getStudentAge() public  returns(uint128) {
        studentObj = new Student(); //contact deploy
        studentObj.setAge(19); //transaciton  state of human got change
        return studentObj.getAge(); //call returned
        
    }
    
    function getMonitorAge() public  returns(uint128) {
        monitorObj = new Monitor();
        monitorObj.setAge(20);
        return monitorObj.getAge();
    }
    
    function getTeacherAge() public  returns(uint128) {
        teacherObj = new Teacher();
        teacherObj.setAge(42);
        return teacherObj.getAge();
    }
}
