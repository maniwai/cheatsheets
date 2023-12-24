abstract class Page {
    private foo = null;
}
class PostPage extends Page {}
class CartPage extends Page {}
class ContactPage extends Page {}

abstract class Website {
    protected _pages: Page[] = [];

    protected constructor() {
        this.createWebsite();
    }

    abstract createWebsite(): void;

    protected get pages(): Page[] {
        return this._pages;
    }
}

class Blog extends Website {
    createWebsite(): void {
        this.pages.push(new PostPage());
        this.pages.push(new CartPage());
        this.pages.push(new ContactPage());
    }
}
