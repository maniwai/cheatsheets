class HashTable {
    constructor(size = 7) {
        this.dataMap = new Array(size);
    }
    // store the pair in an array[6]
    set(key, value) {
        let index = this._hash(key); // 0-6
        if (!this.dataMap[index]) {
            this.dataMap[index] = [];
        }
        this.dataMap[index].push([key, value]);
        return this;
    }
    // get the value, and manage collision
    // note: doesn´t manage duplicate keys
    get(key) {
        let index = this._hash(key);
        if (this.dataMap[index]) {
            for (let i = 0; i < this.dataMap[index].length; i++) {
                if (this.dataMap[index][i][0] === key) {
                    return this.dataMap[index][i][1];
                }
            }
        }
        return undefined;
    }
    // returns all keys in one array
    keys() {
        let allKeys = [];
        for (let i = 0; i < this.dataMap.length; i++) {
            if (this.dataMap[i]) {
                // skip if empty
                for (let j = 0; j < this.dataMap[i].length; j++) {
                    allKeys.push(this.dataMap[i][j][0]);
                }
            }
        }
        return allKeys;
    }

    _hash(key) {
        let hash = 0;
        for (let i = 0; i < key.length; i++) {
            hash = (hash + key.charCodeAt(i) * 23) % this.dataMap.length;
        }
        return hash;
    }
}

let myHT = new HashTable();
myHT.set('one', 'one-one');
myHT.set('two', 'two-one');
myHT.set('two', 'two-second');
myHT.set('three', 'three-one');
myHT;
