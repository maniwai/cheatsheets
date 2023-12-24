export class User {
    private username!: string;
    private email!: string;

    private constructor(builder: UserBuilder) {
        this.username = builder.getUsername();
        this.email = builder.getEmail();
    }

    getUsername(): string {
        return this.username;
    }

    getEmail(): string {
        return this.email;
    }

    static createUser(builder: UserBuilder): User {
        return new User(builder);
    }
}

export class UserBuilder {
    private username!: string;
    private email!: string;

    setUsername(username: string): UserBuilder {
        this.username = username;
        return this;
    }

    setEmail(email: string): UserBuilder {
        this.email = email;
        return this;
    }

    build(): User {
        return User.createUser(this);
    }

    getUsername(): string {
        return this.username;
    }

    getEmail(): string {
        return this.email;
    }
}
