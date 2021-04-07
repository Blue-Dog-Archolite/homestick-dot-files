# Defined in /var/folders/v4/nk3m7qv1575578lx14tbr28r0000gn/T//fish.bZMPL6/docker-purge.fish @ line 2
function docker-purge
	docker stop (docker ps -a -q)
  docker rm (docker ps -a -q)
  docker rmi -f (docker images | grep "<none>" | awk "{print \$3}")
  docker system prune
end
