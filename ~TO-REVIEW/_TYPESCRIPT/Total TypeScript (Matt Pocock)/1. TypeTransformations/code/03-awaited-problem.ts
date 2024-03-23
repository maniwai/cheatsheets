import { Equal, Expect } from "./helpers/type-utils";

const myFunc = () => {
    return Promise.resolve({
        id: "123",
        name: "John",
        email: "john@example.com",
    });
};


type TmyFunc = typeof myFunc;

type TReturnValue = Awaited<ReturnType<TmyFunc>>;

type tests = [
    Expect<Equal<TReturnValue, { id: string; name: string; email: string }>>,
];
