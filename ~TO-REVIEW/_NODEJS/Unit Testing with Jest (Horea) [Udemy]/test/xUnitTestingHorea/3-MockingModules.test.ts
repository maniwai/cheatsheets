jest.mock("./OtherUtils.ts", () => ({
  // 1. we copy all the method implementation in the *empty* mock
  ...jest.requireActual("./OtherUtils.ts"),
  // 2. we override the method we want to mock
  calculateComplexity: () => {
    return 10;
  },
}));

jest.mock("uuid", () => ({
  v4: () => "123",
}));

import * as OtherUtils from "./OtherUtils";

describe.skip("Mock Modules", () => {
  it("calculate complexity", () => {
    const result = OtherUtils.calculateComplexity({} as any);
    console.log(result);
  });
  it("keep other functions", () => {
    const result = OtherUtils.toUpperCase("abc");
    expect(result).toBe("ABC");
  });
  it("string with id", () => {
    const result = OtherUtils.toLowerCaseWithId("ABC");
    expect(result).toBe("abc123");
  });
});
