```
VAR
    Indice, Taille, Curseur: entier
    Phrase(1,n): caractère
    Continue: booléen

DEBUT
    Lire Phrase

    Taille <- longueur(Phrase)
    Indice <- 1
    Continue <- vrai

    TantQue Continue Faire
        Si Phrase[Indice] = "." Alors // Si la valeur de l'indice est un point ...
            Pour I <- Indice + 1 à Taille Faire // ... on efface tout ce qu'il y a après
                Effacer Phrase[I]
            FinPour
            Continue <- faux // ... et on sort de la boucle
        SinonSi Phrase[Indice] = " " Alors // Si la valeur de l'indice est un espace ...
            Curseur <- Indice + 1

            TantQue Curseur <= Taille ET Phrase[Curseur] = " " Faire // Tant qu'il y a des espaces ...
                Curseur <- Curseur + 1 // ... on décale le curseur
            FinTantQue

            Si Curseur <= Taille Alors
                Phrase[Indice] <- Phrase[Curseur] // ... on intervertit les valeurs
                Indice <- Indice + 1 // ... on passe au caractère suivant
            FinSi
        Sinon // Sinon, c'est un caractère bien placé ...
            Indice <- Indice + 1 // ... on peut donc passer au caractère suivant
        FinSi
    FinTantQue

    Afficher Phrase
FIN
```
