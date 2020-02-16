# Development

## Prerequisite

To make developer life easier, FlatpakAuth comes with a `docker-compose.yml`
file that will setup the database and dependencies needed to run a development
copy.

You will need to have `docker` and `docker-compose` installed on your
system. The Docker website has great guides for
[installing docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
and for [installing docker-compose](https://docs.docker.com/compose/install/).

## Running

Once you have `docker` and `docker-compose` installed, simply run the following
command to setup the environment (database migrations and seed data):

- `docker-compose run flatpak_auth ecto.setup`

Then run this command to start everything:

- `docker-compose up`

You can view the site at [`localhost:4000`](http://localhost:4000).

**NOTE** If you make any changes to elixir dependencies or node dependencies,
you will need to rebuild the FlatpakAuth image with
`docker-compose build flatpak_auth`. Everything else should be hot code
reloaded.

### Helpful tips

The postgresql username and password are the default docker ones
(`postgres:postgres`). It is not port forwarded by default, but you can easily
modify the `docker-compose.yml` file for easy access.

## Testing

Just like development, testing can be done with `docker` and `docker-compose`.
Simply run `docker-compose run flatpack_auth test`. This will start all the
dependencies, but instead of running the server, run our tests.

## Deploying

For deployment, we have a different `Dockerfile` called `Dockerfile-production`.
This image will be built with our code in production, so it will not include
hot code reloading, or some debug log output. All you have to do is run
`docker build -t flatpak_auth -f Dockerfile-production .`
