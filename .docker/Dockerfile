# this file is used to create an image for running the docs.
FROM squidfunk/mkdocs-material

RUN pip install --upgrade pip \
    && pip install --no-cache-dir \
    black \
    mkdocstrings[python] \
    mkdocs-gen-files \
    mkdocs-literate-nav \
    mkdocs-section-index

ENTRYPOINT ["mkdocs"]
