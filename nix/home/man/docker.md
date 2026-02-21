# aliases

| alias | command | description |
|-------|---------|-------------|
| `dl {filter-word}` | `docker images {| grep $1} \| sort \| awk \| peco` | list images |
| `dr` | `docker run --rm (-d) {CMD}` | run container |
| `ds` | `docker stop $(docker ps -q)` | stop all containers |
| `dps` | `docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"` | list containers |
| `dst` | `docker stats` | stats |
| `dexp` | `docker exec $(docker ps \| peco) /bin/bash` | exec into container |
| `dlop` | `docker logs $(docker ps \| peco)` | show logs |
| `drm` | `docker system prune` | prune system |
| `drv` | `docker volume rm $(docker volume ls -qf dangling=true)` | remove dangling volumes |
| `drmip` | `docker rmi $(docker images \| peco \| awk '{print $3}')` | remove image |
| `drmcp` | `docker rm -f $(docker ps -a \| peco \| awk '{print $1}')` | remove container |
| `trp` | `trivy --severity=HIGH,CRITICAL --ignore-unfixed=true {peco chosen}` | scan image |

# docker-compose aliases

| alias | command |
|-------|---------|
| `dcb` | `docker-compose build` |
| `dcu` | `docker-compose up` |
| `dcd` | `docker-compose down` |
| `dcr` | `dcd && dcb && dcu` |
| `dcuf` | `docker-compose -f $1 up --build` |
| `dcrf` | `dcd && dcuf $1` |
| `dcdrm` | `docker-compose down --rmi all --volumes --remove-orphans` |

# usage

- choose and run: `dl {filter-word} && dr $li {CMD}`
- copy file: `docker cp {container-id}:/path/file.txt .`
- exec shell: `docker exec -it {container-id} /bin/bash`
- disk usage: `docker system df`
- prune: `docker system prune`
- volume prune: `docker volume prune`
- create network: `docker network create {network-name}`
