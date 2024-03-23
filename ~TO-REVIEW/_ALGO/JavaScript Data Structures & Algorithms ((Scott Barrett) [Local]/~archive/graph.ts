export class Graph<T> {
  private adjList = new Map<T, Array<T>>();

  public addVertex(vertex: T): boolean {
    if (!this.adjList.get(vertex)) {
      this.adjList.set(vertex, new Array<T>());
      return true;
    }
    return false;
  }
  public addEdge(vertex1: T, vertex2: T): boolean {
    var getVertex1 = this.adjList.get(vertex1);
    var getVertex2 = this.adjList.get(vertex2);

    if (getVertex1 && getVertex2) {
      getVertex1.push(vertex2);
      getVertex2.push(vertex1);
      return true;
    }
    return false;
  }
  public removeEdge(vertex1: T, vertex2: T) {
    var getVertex1 = this.adjList.get(vertex1);
    var getVertex2 = this.adjList.get(vertex2);
    if (getVertex1 && getVertex2) {
      getVertex1.shift();
      getVertex2.shift();
      return true;
    }
    return false;
  }

  removeVertex(vertex: T): boolean {
    const vertesis = this.adjList.get(vertex);
    if (!vertesis) return false;
    vertesis.forEach((ele) => {
      // console.log(ele);
      // const temp = this.adjList.get(ele)
      // console.log(temp?.indexOf(ele));
      // const temp2 =vertesis.splice(temp!.indexOf(ele))
      // console.log(temp2);
      // vertesis.splice(vertesis.indexOf(ele),1);
      console.log(vertesis.indexOf(ele));
      // console.log(this.adjList.get(ele)?.filter(()=>{!vertex}))
    });
    return true;
  }

  print() {
    console.table(this.adjList);
  }
}
