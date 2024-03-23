const person = {
  name: "Conan",
  city: "Los Angeles",
  sing: function () {
    const res = `${this.name} sing LA LA LA`;
    console.log(res);
  },
};

// person.sing(); // 'Conan sing LA LA LA'
const pSing = person.sing;
// pSing(); // ' sing LA LA LA' // Unexpected!

class Cat {
  constructor(name) {
    this.name = name;
  }
  dance() {
    const res = `Meow, I am ${this.name}`;
    console.log(res);
  }
}

let cat = new Cat("Fluffy");
let cDance = cat.dance;
cDance.call(cat); // TypeError: Cannot read properties of undefined (reading 'name')

function whatIsThis() {
  console.log("The value of this is: ", this);
}
whatIsThis(); // The value of this is: Window{...}

const obj = { name: "obj", what: whatIsThis };
obj.what();

class MyClass {
  constructor(value) {
    this.value = value;
  }

  getValue() {
    console.log(this.value);
  }
}

const myObject = new MyClass(42);
const method = myObject.getValue;

// Calling method separately loses the 'this' context
method.call(myObject); // 'this' is undefined or refers to the global object

const conan = {
  name: "Conan",
  sing: function () {
    console.log("This is: ", this);
  },
};

const lisa = {
  name: "Lisa",
};

conan.sing.call(lisa); // This is:  {name: 'Lisa'}
