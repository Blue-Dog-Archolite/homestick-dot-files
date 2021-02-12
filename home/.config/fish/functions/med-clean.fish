function med-clean
sudo chown -R rmeyer:rmeyer .
git clean -xfd
cp .env.example .env
end
