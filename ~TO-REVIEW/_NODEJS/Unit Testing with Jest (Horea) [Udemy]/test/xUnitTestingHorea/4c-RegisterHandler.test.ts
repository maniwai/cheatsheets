import { ServerResponse } from "http";
import { IncomingMessage } from "http";
import { RegisterHandler } from "./server_app/handlers/RegisterHandler";
import { Authorizer } from "./server_app/auth/Authorizer";
import { Account } from "./server_app/model/AuthModel";
import { HTTP_CODES, HTTP_METHODS } from "./server_app/model/ServerModel";

const getRequestBodyMock = jest.fn();

jest.mock("./server_app/utils/Utils", () => ({
  getRequestBody: () => getRequestBodyMock(),
}));

describe.skip("RegisterHandler test suite", () => {
  let sut: RegisterHandler;

  const request = {
    method: undefined,
  };

  const responseMock = {
    statusCode: 0,
    writeHead: jest.fn(),
    write: jest.fn(),
  };

  const authorizerMock = { registerUser: jest.fn() };

  const someAccount: Account = {
    id: "",
    password: "somePassword",
    userName: "someUserName ",
  };

  const someId = "1234 ";

  beforeEach(() => {
    sut = new RegisterHandler(
      request as IncomingMessage,
      responseMock as any as ServerResponse,
      authorizerMock as any as Authorizer,
    );
  });
  afterEach(() => {
    jest.clearAllMocks();
  });

  it("should register valid accounts request", async () => {
    request.method = HTTP_METHODS.POST as any;
    getRequestBodyMock.mockResolvedValueOnce(someAccount);
    authorizerMock.registerUser.mockResolvedValueOnce(someId);

    await sut.handleRequest();

    expect(responseMock.statusCode).toBe(HTTP_CODES.CREATED);
    expect(responseMock.writeHead).toBeCalledWith(HTTP_CODES.CREATED, {
      "Content-Type": "application/json",
    });
    expect(responseMock.write).toBeCalledWith(
      JSON.stringify({ userId: someId }),
    );
  });
});
