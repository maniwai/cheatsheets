interface Formatter {
  format(details: Detail[]): void;
}
class PrintPDF implements Formatter {
  format(details: Detail[]): void {
    let result: string[] = [];
    details.forEach((element) => {
      result.push(element.value);
    });
    console.log(result);
  }
}
class HTMLFormatter implements Formatter {
  format(details: Detail[]): void {
    let result: string[] = [];
    details.forEach((element) => {
      result.push("<h1>" + element.value + "</h1>");
    });
    console.log(result);
  }
}
abstract class Printer {
  public print(formatter: Formatter) {
    return formatter.format(this.getDetails());
  }
  protected abstract getDetails(): Detail[];
}
class MoviePrinter extends Printer {
  private _movie: Movie;
  public constructor(movie: Movie) {
    super();
    this._movie = movie;
  }

  protected getDetails(): Detail[] {
    let details = [];
    details.push(new Detail("Title", this._movie.title));
    return details;
  }
}
class Detail {
  private _label: string;
  private _value: string;
  public constructor(label: string, value: string) {
    this._label = label;
    this._value = value;
  }
  public get label() {
    return this._label;
  }
  public get value() {
    return this._value;
  }
}

class Movie {
  private _title: string = "";
  public set title(title: string) {
    this._title = title;
  }
  public get title() {
    return this._title;
  }
}

// Client Code
const movie = new Movie();
movie.title = "Titanic";
const moviePrinter = new MoviePrinter(movie);
// Print PDF
const printPDF = new PrintPDF();
moviePrinter.print(printPDF);
// Print HTML
const htmlFormatter = new HTMLFormatter();
moviePrinter.print(htmlFormatter);
