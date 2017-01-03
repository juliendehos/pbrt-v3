# analyse du bruit des algos de synthèse d'images

## préparer les scènes

```
cd breakfast
gzip -dk ceramic.bsdf.gz
cd ..
```

## lancer les runs (sur calculco)

Éditer le fichier `generate_params.sh` puis lancer la génération du fichier de
paramètre :

```
./generate_params > run_oar.txt
```

Éventuellement, éditer le fichier de configuration `run_oar.sh` (par exemple,
pour éviter de tout lancer à la brutasse sur toute la grille).

Vérifier l'état de la grille :

```
oarstat
```

Lancer le calcul :

```
oarsub -S ./run_oar.sh
```

Vérifier le déroulement, via l'interface web
<https://www-calculco.univ-littoral.fr/outils_visu/drawgantt/>.

## récupérer les résultats (sur une autre machine)

```
mkdir output_calculco
scp login@calculco.univ-littoral.fr:pbrt-v3/data_noise/output/*.exr output_calculco
```

## convertir en png (installer exrtools avant)

```
find output_calculco/ -name "*.exr" -exec ./run_tonemapping.sh {} \;
```

