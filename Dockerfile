FROM gcc:11.2.0 AS build-env

RUN apt-get update && apt-get install -y libboost-dev libboost-program-options-dev libgtest-dev make

COPY . /app/src

WORKDIR /app/src

RUN make install


FROM alpine:3.15.4

COPY --from=build-env /usr/local/bin/reptyr /usr/local/bin/reptyr

CMD ["top"]