class tfabricant {
    public String ref;
    public String nom;
    public String adresse;
    public String tel;
}

class tarticle {
    public String ref;
    public String libelle;
    public float prix;
    public tfabricant fab;
}

class chap8_refstruct {
    public static void main(String[] args) {
        tarticle article = new tarticle();
        tarticle art2;
        article.ref = "Art001_01";
        article.fab = new tfabricant();
        article.fab.ref = "Fab1234";
        art2 = article;
        System.out.println(art2.ref);
        System.out.println(art2.fab.ref);
    }
}
