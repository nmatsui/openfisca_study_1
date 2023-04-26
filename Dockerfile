FROM python:3.7
WORKDIR /openfisca
SHELL ["/bin/bash", "-c"]
RUN apt update && apt upgrade -y

COPY ./country-template /openfisca

RUN pip install --upgrade pip && \
    pip install notebook && \
    pip install build twine pandas && \
    pip install -e '.[dev]' --upgrade --use-deprecated=legacy-resolver

RUN rm -rf /openfisca/*

EXPOSE 8888 2000
CMD ["jupyter", "notebook", "--port=8888", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''"]
