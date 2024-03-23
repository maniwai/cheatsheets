function merge<T, U>(a: T, b: U) {
    return {
        ...a,
        ...b
    }
}

const user = merge<{ name: string }, { age: number }>({ name: "Mani" }, { age: 46 })


console.log(user.name); // Mani
console.log(user.age); // 46