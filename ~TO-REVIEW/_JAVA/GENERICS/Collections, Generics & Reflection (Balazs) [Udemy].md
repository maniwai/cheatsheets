[source](https://www.udemy.com/course/introduction-to-generics-in-java/)

# Why to Use Generics

-   **Generics** makes type checking **detectable at compile time** instead of run-time.
-   Generics enable classes to be parameters for dynamic instantiation, so we can **reuse the same code** with different inputs
-   We can **eliminate type casting**: Type casting is not a good practice, we should use **generics** instead. Instead of:
    ```java
    List list = new ArrayList();
    String name = (String) list.get(0);
    ```
    ... we can use generics:
    ```java
    List<String> list = new ArrayList<>();
    String name = list.get(0);
    ```

# Generic Types

```java
class Store<T> {
    private T item;
    public void setItem(T item) {
        this.item = item;
    }
    public T getItem() {
        return this.item;
    }
}
```

```java
Store<String> store = new Store<>();
store.setItem("Hello");
String item = store.getItem();
```

> Under the hood, Java will replace all generic reference to `Object` class. So the main reason to use generics is to avoid type casting and avoid runtime errors.

Note: We still can use type casting with class implementing generics but its pointless:

```java
Store store = new Store();
store.setItem(34);
Integer item = (Integer) store.getItem();
```

# Using multiple Generic Types

```java
class Hashtable<K, V> {
    private K key;
    private V value;
    public Hashtable(K key, V value) {
        this.key = key;
        this.value = value;
    }
}
```

```java
Hashtable<String, Integer> hashTable = new Hashtable<>("Hello", 23);
```

> We need to declare the generic types in the class signature because we are using them in the constructor

# Generic Method

```java
class GenericMethod {
    public <T> T showItem(T item) {
        return item;
    }
}
```

```java
GenericMethod method = new GenericMethod();
String item = method.showItem("Hello world");
System.out.println(item); // Hello world
```

### Example with Array of Generics

```java
public <T> void showItems(T[] items) {
    for (T item : items)
        System.out.println(item);
}
```

```java
GenericMethod method = new GenericMethod();
Integer[] nums = {1, 2, 5, 4};
method.showItems(nums); // 1 2 5 4
```

# Bounded Type Parameter

We can **restrict** the generic types using the keyword `extends`

```java
public static <T extends Comparable<T>> T calculateMin(T num1, T num2) {
    if (num1.compareTo(num2) < 0) {
        return num1;
    }
    return num2;
}
```

> We can use `compareTo()` method because we are bounding `Comparable` interface with the use of keyword `extends`

# Type Inference

```
App.<String>addStore("hello")
```

We can omit the `<String>` and Java will infer the type based on the arguments

# Wildcards

_left at chapter Wildcard_
