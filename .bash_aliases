alias deployment='cd "$(dirname "$(find . -type f -name urls.py | head -1)")/.."'
alias find_deployment='echo $(dirname "$(find . -type f -name urls.py | head -1)")'
alias requirements='pip install -r requirements.txt'
