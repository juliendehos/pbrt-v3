# Run pbrt with OAR

## Using a classic script

edit `oar_batch.sh` then:

```
oarsub -S ./oar_batch.sh
```

## Using a parameter array

edit `oar_params.txt` and `oar_params.sh` then:

```
oarsub -S ./oar_params.sh
```

## Get results

```
scp *.png dehos@yangra.univ-littoral.fr:public-html/tmp
```

