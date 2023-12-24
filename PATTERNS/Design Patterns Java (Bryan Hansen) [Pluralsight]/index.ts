import { Singleton } from './1. Creational/01. Singleton';
import { User, UserBuilder } from './1. Creational/02. Builder';

// Singleton Pattern
let instance = Singleton.getInstance();
let otherInstance = Singleton.getInstance();

// Builder Pattern
const user: User = new UserBuilder()
    .setUsername('john_doe')
    .setEmail('john@example.com')
    .build(); // return  a User object

console.log(`Username: ${user.getUsername()}`);
console.log(`Email: ${user.getEmail()}`);
