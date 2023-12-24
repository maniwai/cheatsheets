var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var Page = /** @class */ (function () {
    function Page() {
    }
    return Page;
}());
var ContactPage = /** @class */ (function () {
    function ContactPage() {
    }
    return ContactPage;
}());
var CartPage = /** @class */ (function (_super) {
    __extends(CartPage, _super);
    function CartPage() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return CartPage;
}(Page));
var PostPage = /** @class */ (function (_super) {
    __extends(PostPage, _super);
    function PostPage() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return PostPage;
}(Page));
var Website = /** @class */ (function () {
    function Website() {
        this._pages = new Array();
        this.createWebsite();
    }
    Object.defineProperty(Website.prototype, "pages", {
        get: function () {
            return this._pages;
        },
        enumerable: false,
        configurable: true
    });
    return Website;
}());
var Blog = /** @class */ (function (_super) {
    __extends(Blog, _super);
    function Blog() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Blog.prototype.createWebsite = function () {
        this.pages.push(new PostPage());
        this.pages.push(new CartPage());
        this.pages.push(new ContactPage());
    };
    return Blog;
}(Website));
