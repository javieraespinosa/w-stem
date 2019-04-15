
FROM jupyter/scipy-notebook
USER root

COPY requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN conda install -c conda-forge openjdk

RUN python -m spacy download en

USER $NB_UID
