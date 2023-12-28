FROM elixir:1.14.3-alpine as build

# install build dependencies
RUN apk add --update alpine-sdk

RUN mkdir /app
WORKDIR /app

# instalando o gerenciar de pacotes do elixir
RUN mix do local.hex --force, local.rebar --force

ENV MIX_ENV="prod"

# install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get --only $MIX_ENV
RUN mix deps.compile

# build project
COPY priv priv
COPY lib lib
RUN mix compile

# build release
# at this point we should copy the rel directory but
# we are not using it so we can omit it
# COPY rel rel
RUN mix release

# prepare release image
FROM elixir:1.14.3-alpine AS app

# install runtime dependencies
RUN apk add --update bash postgresql-client

EXPOSE 4000
ENV MIX_ENV="prod"

# prepare app directory
RUN mkdir /app
WORKDIR /app

# copy release to app container
COPY --from=build /app/_build/prod/rel/elixir_pdi_phoenix_api .
COPY entrypoint.sh .
RUN chown -R nobody: /app
USER nobody

ENV HOME=/app
CMD ["/app/entrypoint.sh"]
