interface CheckResult {
  valid: boolean;
  reasons: string[];
}
enum PasswordErrors {
  SHORT = "Password is too short!",
  NO_UPPER_CASE = "Upper case letter required!",
  NO_LOWER_CASE = "Lower case letter required!",
  NO_NUMBER = "At least one number required",
}
export class PasswordChecker {
  public checkPassword(password: string): CheckResult {
    const reasons: PasswordErrors[] = [];

    this.checkForLength(password, reasons);
    this.checkForUpperCase(password, reasons);
    this.checkForLowerCase(password, reasons);

    return {
      valid: reasons.length > 0 ? false : true,
      reasons: reasons,
    };
  }

  public checkAdminPassword(password: string): CheckResult {
    const basicCheck = this.checkPassword(password);
    this.checkForNumber(password, basicCheck.reasons as PasswordErrors[]);
    return {
      valid: basicCheck.reasons.length > 0 ? false : true,
      reasons: basicCheck.reasons,
    };
  }

  public checkForNumber(password: string, reasons: PasswordErrors[]): void {
    const hasNumber = /\d/;
    console.log(hasNumber);
    if (!hasNumber.test(password)) {
      reasons.push(PasswordErrors.NO_NUMBER);
    }
  }

  private checkForLength(password: string, reasons: PasswordErrors[]) {
    if (password.length < 8) {
      reasons.push(PasswordErrors.SHORT);
    }
  }
  private checkForUpperCase(password: string, reasons: PasswordErrors[]) {
    if (password == password.toLowerCase()) {
      reasons.push(PasswordErrors.NO_UPPER_CASE);
    }
  }
  private checkForLowerCase(password: string, reasons: PasswordErrors[]) {
    if (password == password.toUpperCase()) {
      reasons.push(PasswordErrors.NO_LOWER_CASE);
    }
  }
}

describe.skip("PasswordChecker test suite", () => {
  let sut: PasswordChecker;

  beforeEach(() => {
    sut = new PasswordChecker();
  });
  it("Password with less than 8 chars is invalid", () => {
    const actual = sut.checkPassword("1234567");
    expect(actual.valid).toBe(false);
    expect(actual.reasons).toContain(PasswordErrors.SHORT);
  });
  it("Password with more than 8 char is ok", () => {
    const actual = sut.checkPassword("123445s78A");
    expect(actual.reasons).not.toContain(PasswordErrors.SHORT);
  });
  it("Password with no upper case is invalid", () => {
    const actual = sut.checkPassword("123afbd");
    expect(actual.valid).toBe(false);
    expect(actual.reasons).toContain(PasswordErrors.NO_UPPER_CASE);
  });
  it("Password with upper case letter is valid", () => {
    const actual = sut.checkPassword("123Aqwer");
    expect(actual.valid).toBe(true);
    expect(actual.reasons).not.toContain(PasswordErrors.NO_UPPER_CASE);
  });
  it("Password with no lower case is invalid", () => {
    const actual = sut.checkPassword("123UIUPSDF");
    expect(actual.valid).toBe(false);
    expect(actual.reasons).toContain(PasswordErrors.NO_LOWER_CASE);
  });
  it("Complex password is valid", () => {
    const actual = sut.checkPassword("123456ASDasd");
    expect(actual.valid).toBe(true);
    expect(actual.reasons).toHaveLength(0);
  });
  it("Admin password with no number is invalid", () => {
    const actual = sut.checkAdminPassword("asdfASDF");
    expect(actual.valid).toBe(false);
    expect(actual.reasons).toContain(PasswordErrors.NO_NUMBER);
  });
  it.only("Admin password with number is valid", () => {
    const actual = sut.checkAdminPassword("asd123fASDF");
    expect(actual.valid).toBe(true);
    expect(actual.reasons).not.toContain(PasswordErrors.NO_NUMBER);
  });
});
