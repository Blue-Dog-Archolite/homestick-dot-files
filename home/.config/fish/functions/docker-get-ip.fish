function docker-get-ip
	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $argv
end
