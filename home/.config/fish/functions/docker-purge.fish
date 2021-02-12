# Defined in /tmp/fish.lz395B/docker-purge.fish @ line 2
function docker-purge
	docker stop (docker ps -a -q)
  docker rm (docker ps -a -q)
  docker rmi -f (docker images | grep "<none>" | awk "{print \$3}")
end
