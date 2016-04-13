# run pbrt with oar

## batch mode

edit `oar_batch.sh` then:

```
oarsub -S ./oar_batch.sh
```

## params mode

edit `oar_params.txt` and `oar_params.sh` then:

```
oarsub -S ./oar_params.sh
```

## get results

```
scp pbrt.png dehos@yangra.univ-littoral.fr:public-html/tmp
```

