# analyse du bruit des algos de synthèse d'images

## préparer les scènes

```
cd breakfast
gzip -dk ceramic.bsdf.gz
cd..
```

## lancer les runs (sur calculco)

```
oarsub -S ./run_oar.sh
```

## récupérer les résultats (sur une autre machine)

```
scp jdehos@calculco.univ-littoral.fr:depots/github/pbrt-v3/data_noise/output/*.exr .
```

