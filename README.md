### Setup

```sh
# build
docker build -t lunch .

# run
docker run --rm -d -p 3000:3000 lunch

# log
docker logs -f <CONTAINER_ID>
```