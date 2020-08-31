# robotlearning

## run it locally on your machine

1. clone the repo
1. cd robotlearning/mytestsuite
1. create virtual env here.
``` 
virtualenv --python=python3 myvenv
```

activate virtual env
```
source myvenv/bin/activate
```
upgrade pip
```
pip install --upgrade pip -i https://pypi.python.org/simple
```
install the requirements
```
pip install -r requirements.txt
```
verify if all the requirements were installed
```
pip list
```
execute the test cases.
```
robot src/test_suite/sshMcp.rst
```
robot was executed in mytestsuite and so log.html and other files will be generated here.
