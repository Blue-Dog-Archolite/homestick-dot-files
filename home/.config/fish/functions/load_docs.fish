function load_docs
	cd ~/dev/taos/harvest-reporting/
rm -rf docs
mkdir docs
sphinx-build .docs docs
cd docs
python -m http.server
end
