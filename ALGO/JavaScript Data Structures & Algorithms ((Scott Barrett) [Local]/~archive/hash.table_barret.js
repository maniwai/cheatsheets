// note: incomplete - [set()] will store duplicate [keys]

class HashTable {
    constructor(size = 7) {
        this.dataMap = new Array(size)
    }
    _hash(key) {
        let hash = 0
        for (let i = 0; i < key.length; i++) {
            hash = (hash + key.charCodeAt(i) * 23) % this.dataMap.length
        }
        return hash
    }
    set(key, value) {
        let index = this._hash(key)
        if (!this.dataMap[index])
            this.dataMap[index] = []
        this.dataMap[index].push([key, value])
        return this
    }
    get(key) {
        let index = this._hash(key)
        if (this.dataMap[index]) {
            for (let i in this.dataMap[index]) {
                if (this.dataMap[index][i][0] === key) {
                    return this.dataMap[index][i][1]
                }
            }
        }
        return undefined
    }
    keys() {
        let allKeys = []
        for (let i = 0; i < this.dataMap.length; i++) {
            if (this.dataMap[i]) {
                for (let j = 0; j < this.dataMap[i].length; j++) {
                    allKeys.push(this.dataMap[i][j][0])
                }
            }
        }
        return allKeys
    }
}

let hashTable = new HashTable()
hashTable.set("first", "one")
hashTable.set("second", "two")
hashTable.set("three", "three")
hashTable.set("three", "three")

console.log(hashTable.keys())
return