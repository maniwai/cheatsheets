import { v4 } from "uuid";

type stringInfo = {
  lowerCase: string;
  upperCase: string;
  characters: string[];
  length: number;
  extraInfo: Object;
};

function calculateComplexity(stringInfo: stringInfo) {
  return Object.keys(stringInfo.extraInfo).length * stringInfo.length;
}
function toUpperCaseWithCb(arg: string, callback: Function) {
  if (!arg) {
    callback("Invalid argument!");
    return;
  }
  callback(`called function with ${arg}`);
  return arg.toUpperCase();
}
/**
 * STUBS
 * --------------------------------------------------
 */
describe.skip("Test Double", () => {
  describe("Stubs", () => {
    it("Calculate Complexity", () => {
      const someInfo = {
        length: 5,
        extraInfo: { field1: "someInfo", field2: "someOtherInfo" },
      };
      // STUBS: are incomplete object with only the parameters we test against
      // Note: note really usefull for javascript as it is dynamicly type, so we can ommit those [as any]
      const actual = calculateComplexity(someInfo as any);
    });
    it("ToUpperCase - call callback for invalid argument", () => {
      const actual = toUpperCaseWithCb("", () => {});
      expect(actual).toBeUndefined();
    });
    it("ToUpperCase - call callback for valid argument", () => {
      const actual = toUpperCaseWithCb("abc", () => {});
      expect(actual).toBe("ABC");
    });
  });

  /**
   * MOCKS
   * --------------------------------------------------
   */
  describe.skip("Custom Mock", () => {
    let cbArgs: string[] = [];
    let timesCalled = 0;

    function callbackMock(arg: string) {
      cbArgs.push(arg);
      timesCalled++;
    }
    afterEach(() => {
      cbArgs = [];
      timesCalled = 0;
    });
    it("call callback for invalid argument - track calls", () => {
      const actual = toUpperCaseWithCb("", callbackMock);
      expect(actual).toBeUndefined();
      expect(cbArgs[0]).toContain("Invalid argument!");
      expect(timesCalled).toBe(1);
    });
    it("call callback for valid argument - track calls", () => {
      const actual = toUpperCaseWithCb("abc", callbackMock);
      expect(actual).toBe("ABC");
      expect(cbArgs[0]).toContain("called function with abc");
      expect(timesCalled).toBe(1);
    });
    describe.skip("Jest Mock", () => {
      // MOCKS are method we inject
      const callBackMock = jest.fn();

      afterEach(() => {
        jest.clearAllMocks();
      });

      it("call callback for invalid argument - track calls", () => {
        const actual = toUpperCaseWithCb("", callBackMock);
        expect(actual).toBeUndefined();
        expect(callBackMock as jest.Mock<string>).toBeCalledWith(
          "Invalid argument!",
        );
        expect(callBackMock as jest.Mock<number>).toBeCalledTimes(1);
      });
      it.only("call callback for valid argument - track calls", () => {
        const actual = toUpperCaseWithCb("abc", callBackMock);
        expect(actual).toBe("ABC");
        expect(callBackMock as jest.Mock<string>).toBeCalledWith(
          "called function with abc",
        );
        expect(callBackMock as jest.Mock<number>).toBeCalledTimes(1);
      });
    });
  });

  /**
   * SPIES
   * --------------------------------------------------
   * SPIES in contrast to MOCKS keep its functionality
   * They are used to track method calls of object
   */

  class OtherStringUtils {
    public toUpperCase(arg: string) {
      return arg.toUpperCase();
    }

    public logString(arg: string) {
      console.log(arg);
    }
    private callExternalService() {
      console.log("Calling external service");
    }
  }
  describe("SPIES", () => {
    let sut: OtherStringUtils;

    beforeEach(() => {
      sut = new OtherStringUtils();
    });

    it("Use a spy to track calls", () => {
      const toUpperCaseSpy = jest.spyOn(sut, "toUpperCase");
      sut.toUpperCase("asa");
      expect(toUpperCaseSpy).toBeCalledWith("asa");
    });
    it("Use a spy to track calls to other module", () => {
      const consoleLogSpy = jest.spyOn(console, "log");
      sut.logString("asdf");
      expect(consoleLogSpy).toBeCalledWith("asdf");
    });
    it("Use a spy to replace the implementation of a method", () => {
      // we can hack the implementation with [mockImplementation] (even on private method)
      jest.spyOn(sut as any, "callExternalService").mockImplementation(() => {
        console.log("calling mocked implemetation");
      });
    });
  });
});
