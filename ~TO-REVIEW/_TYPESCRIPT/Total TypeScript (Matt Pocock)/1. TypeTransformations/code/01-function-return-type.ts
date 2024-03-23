import { Equal, Expect } from './helpers/type-utils';

const myFunc = () => {
    return 'hello';
};

/**
 * How do we extract MyFuncReturn from myFunc?
 */

// 1. we return the function type
type MyFunc = typeof myFunc;
// 2. we extract the type of the function with ReturnType<> utility
type ReturnValue = ReturnType<MyFunc>;

type tests = [Expect<Equal<ReturnValue, string>>];
