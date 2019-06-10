#my first try at a dockerfile
FROM leocalm/python3-mongo:latest
LABEL maintainer="manuel@hylomprhicsolutions.com"
RUN apt-get install -y git
RUN pip3 install flask
RUN pip3 install pymongo
WORKDIR ./omniseq
RUN git clone https://github.com/manuel-j-glynias/omniseq_clinvar.git
WORKDIR omniseq_clinvar
#COPY ClinVarVariationRelease_00-latest.xml ClinVarVariationRelease_00-latest.xml
#COPY ClinVarVariationRelease_00-latest.xml.gz ClinVarVariationRelease_00-latest.xml.gz
ENV FLASK_APP cv_server.py
EXPOSE 5000
CMD ["flask", "run", "--host", "0.0.0.0"]
ENTRYPOINT ["./clinvar.sh"]  