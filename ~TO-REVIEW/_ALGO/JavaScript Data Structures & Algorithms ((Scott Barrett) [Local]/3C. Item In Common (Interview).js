function itemInCommon(arr1, arr2) {
    let obj = {}; // {one: true, three: true}
    for (let i = 0; i < arr1.length; i++) {
        obj[arr1[i]] = true;
    }
    for (let j = 0; j < arr2.length; j++) {
        if (obj[arr2[j]]) return true;
        // if(obj[two] is true) // false
        // if(obj[three] is true)) // return true
    }
    return false;
}

let array1 = ['one', 'three'];
let array2 = ['two', 'three'];

const result = itemInCommon(array1, array2);

console.log(result);
