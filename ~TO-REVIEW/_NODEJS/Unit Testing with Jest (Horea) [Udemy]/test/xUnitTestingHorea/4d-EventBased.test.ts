import { IncomingMessage } from "http";
import { getRequestBody } from "./server_app/utils/Utils";

const requestMock = {
  on: jest.fn(),
};
const someObject = {
  name: "John",
  age: 30,
  city: "Paris",
};
const someObjectAsString = JSON.stringify(someObject);

describe("getRequestBody", () => {
  it("should return object for valid JSON", async () => {
    requestMock.on.mockImplementation((event, cb) => {
      if (event == "data") {
        cb(someObjectAsString);
      } else {
        cb();
      }
    });
    const actual = await getRequestBody(requestMock as any as IncomingMessage);
  });
  it("should throw error for invalid JSON", () => {});
  it("should throw error for unexpected error", () => {});
});
