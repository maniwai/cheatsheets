# Null Reference

An object can be null while a primitive type always have a value

# Aliasing

Aliasing occurs when two or more variables refer to the same memory location or object. Changes made through one variable are reflected in the others

```java
MyObj obj1 = new MyObj();
MyObj obj2 = obj1
```

# Passing Objects

Primitives are passed by value.  
Objects are passed by reference.

> To be more accurate: Both primitives and objects are passed the same way, but in case of an object, we are copying the value of a reference.

# Identity and Equality

Two objects are:

- **identical** if they are the same object in memory
- **equal** if they contains the same value

Comparing objects:

- `==` operator checks for identity
- `equals()` compare objects either by their values or by their references depending on the method implementation.

```java
String s1 = "hello";
String s2 = "hello";
s1 == s2 // true (older Java version return false)
```

> For efficiency, newer version of Java evaluates the string value and convert to a primitive (depending of its size) for efficiency.

# The Meaning of Constants

**Constant**: Applies to variables, including object references. It means that you cannot reassign the variable.  
**Immutable**: Applies to objects. It means that you cannot change the state of the object.

# Autoboxing

**Wrapper class** are used to convert primitive type to object type.

```java
int aPrimitive = 42;
Integer anObject = new Integer(aPrimitive);
myList.add(anObject)
```

> Newer version of Java, does the conversion automatically, so in this example, we can directly pass the integer primitive: `myList.add(aPrimitive)` or `Integer anObject = aPrimitive`

### Auto-unboxing

Unboxing is when we convert an object wrapper back to its primitive. Taking the same example above:

```java
int anotherPrimitive = anObject;
```

> In this example, we don't need to call the method `valueOf()`, Java does it automatically (*auto-unboxing*)

### Overloading

**Overloading** means having multiple methods with the same name, but with different arguments

# More About Constructors

We can call other constructor inside a constructor with `this(arg)`

```java
class Alarm {
    final String message;
    
    Alarm() {
        this("Some default message");
    }
    Alarm(String message) {
        this.message = message;
    }
}
```

# Final Strikes Back

`final` keyword have different meaning, it means:

- On a **variable/field**: cannot reassign
- On a **method**: cannot override
- On a **class**: cannot inherit

> Good Practice: A method called by a constructor should be either private or final

# Sealed Classes

`sealed` modifier permits only specified subclass to be inherit:

```java
public sealed class Parent permits Child1, Child2 {}
```

The subclass should also be either: `sealed`, `non-sealed`, or `final`

# Upcasting

**Upcasting** means we are casting a subclass to its superclass:

```java
Animal myCat = new Cat();
cat.vocalize(); // Meow!
```

> Even we declare a superclass, it still reference its subclass, so it will first call the subclass overridden methods

# Downcasting

When using polymorphism, to access specific subclass method, we need to *downcast*, here to access `purring()`:

```java
Animal myCat = new Cat();
((Cat) myCat).purring(); // purring
```

> **Note**: avoid downcasting, improve your design to remove downcasting.

we can use `instanceof` to check when we are downcasting: `if(myCat instanceof Cat)`

# Interfaces
Interfaces can have public methods: `abstract`, `static` or `default`
They can have `public static final` fields

- Interface methods are public and abstract by default, so we can leave those identifier blank:
	```java
	public interface Widget {
		String getHelpText();
	}
	```
- Interface fields can only be constant with the modifiers: `public static final`
- We can have `static` method in an interface
- we can use default modifier in an interface for a default implementation:
	```java
	public interface Widget {
		default String getHelpText() {
			return "read the manual"
		}
	}
	```

# Inheritance is About Upcasting

The main reason for using inheritance is mostly for polymorphism, to be able to upcast a subclass to its superclass.

### Delegation vs Inheritance

Delegation is a design pattern and programming concept where an object passes on a task or responsibility to another object.
> We usely import the delegate object as a parameter
```
class Printer {
	private PrintDelegate delegate;
}
```

# Two Design Guidelines
- Use inheritance when you want to upcast
	- Use delegation if you just want to share code
- Don't switch on type (`instanceof`)
	- avoid chains of `instanceof` and downcasts
	- use polymorphism instead 

# Mixing Static and Non-Static
- We can call static method member inside a non-static method.
But to call non-static method inside a static method, we need to create a new object: `new Alarm.turnOn();`
- We cannot override a static method

# Global Variables and Global Constants
- `public static fields` are like **global variable** and should be avoid.
- but we can add `final` modifier to make it a **global constant**.
> by convention it should be all uppercase: 
```java
public static final String DOCUMENTATION = "turnOn() to activate"
```

# Static Initializer
Static initializer is usefull to run a code only once when we first use this class
```
public class Example {
	static {
		doSomething();
	}
	...
```

