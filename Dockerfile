FROM ekidd/rust-musl-builder

RUN cargo install mdbook --vers 0.2.3
RUN cargo install --git https://github.com/rsteube/mdbook-mermaid.git --branch preprocessor-plugin

FROM alpine

COPY --from=0 \
     /home/rust/.cargo/bin/mdbook \
     /home/rust/.cargo/bin/mdbook-mermaid \
     /usr/local/bin/

WORKDIR /mdbook
