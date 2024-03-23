enum CARD_TYPE {
  GOLD,
  PLATINIUM,
}
abstract class CreditCard {}
class AmexGoldCreditCard extends CreditCard {}
class AmexPlatinumCreditCard extends CreditCard {}
class VisaGoldCreditCard extends CreditCard {}
class VisaBlackCreditCard extends CreditCard {}

// Abstract Factory
abstract class CreditCardFactory {
  public staticFix = null;
  public static getCreditCardFactory(creditScore: number): CreditCardFactory {
    if (creditScore > 500) {
      return new AmexFactory();
    } else {
      return new VisaFactory();
    }
  }
  public abstract getCreditCard(CardType: CARD_TYPE): CreditCard | undefined;
}

class VisaFactory extends CreditCardFactory {
  public getCreditCard(cardType: CARD_TYPE): CreditCard | undefined {
    switch (cardType) {
      case CARD_TYPE.GOLD:
        return new VisaGoldCreditCard();
      case CARD_TYPE.PLATINIUM:
        return new VisaBlackCreditCard();
      default:
        return;
    }
  }
}
class AmexFactory extends CreditCardFactory {
  public getCreditCard(cardType: CARD_TYPE): CreditCard | undefined {
    switch (cardType) {
      case CARD_TYPE.GOLD:
        return new AmexGoldCreditCard();
      case CARD_TYPE.PLATINIUM:
        return new AmexPlatinumCreditCard();
      default:
        break;
    }
  }
}

// Client
const abstractFactory = CreditCardFactory.getCreditCardFactory(775);
const card = abstractFactory.getCreditCard(CARD_TYPE.PLATINIUM);
