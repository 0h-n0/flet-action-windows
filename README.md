# Flet-Action-Windows

## Sample

* https://github.com/0h-n0/myflet

## Features

* support more recent version python (3.10)
* support more recent version pyinstaller(5.5.0)

## Poetry

If you use poetry as package manager, before using this action, you need to dump `requirements.txt` with the following command.

```shell
$ poetry export --without-hashes -f requirements.txt --output requirements.txt
```

## Example

* https://github.com/0h-n0/myflet
* https://github.com/0h-n0/myflet-extlib

## Trouble shootings

### **0.1** Including static files
You can set static files in the second argments. Especially, you want to inlculde multple static files, you can use "@" as splitter like the following. 

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Package Application
      uses: 0h-n0/flet-action-windows@master
      with:
        srcfile: myflet_extlib/main.py
        adddata: sample.png
```

Multiple files

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Package Application
      uses: 0h-n0/flet-action-windows@master
      with:
        srcfile: myflet_extlib/main.py
        adddata: assets/sample1.png@assets/sample2.png
```

### **0.2** Import error of from 

## See Reference
* https://github.com/JackMcKew/pyinstaller-action-windows
* https://github.com/cdrx/docker-pyinstaller
* https://github.com/webcomics/pywine
