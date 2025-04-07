FROM ubuntu:latest
LABEL authors="heesu"

ENTRYPOINT ["top", "-b"]