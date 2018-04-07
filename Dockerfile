FROM elixir

RUN useradd pleroma -d /pleroma -m -U

USER pleroma

WORKDIR /pleroma

RUN mix local.hex --force && \
    mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez && \
    mix local.rebar --force

COPY --chown=pleroma:pleroma . .

ARG MIX_ENV
ARG DOMAIN
ENV MIX_ENV=${MIX_ENV}
ENV DOMAIN=${DOMAIN}

RUN mix deps.get --force --only prod

RUN mix compile

EXPOSE 4000

CMD ["mix", "phx.server"]