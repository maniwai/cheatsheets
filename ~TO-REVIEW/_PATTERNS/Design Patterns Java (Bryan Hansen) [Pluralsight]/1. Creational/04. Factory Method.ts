enum WebsiteType {
  BLOG,
  SHOP,
}
abstract class Website {
  public constructor() {
    this.createWebsite();
  }
  public abstract createWebsite(): void;
}
class Blog extends Website {
  public createWebsite(): void {
    console.log("Blog Website");
  }
}
class Shop extends Website {
  public createWebsite(): void {
    console.log("Shop Website");
  }
}
class WebsiteFactory {
  public static getWebsite(siteType: WebsiteType): Website | null {
    switch (siteType) {
      case WebsiteType.BLOG: {
        return new Blog();
      }
      case WebsiteType.SHOP: {
        return new Shop();
      }
      default: {
        return null;
      }
    }
  }
}
// Client Code
const blogSite: Website | null = WebsiteFactory.getWebsite(WebsiteType.BLOG); // clg: Blog Website
const shopSite: Website | null = WebsiteFactory.getWebsite(WebsiteType.SHOP); // clg: Shop Website
