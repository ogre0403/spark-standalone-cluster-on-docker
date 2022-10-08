ARG spark_version
FROM spark-base:${spark_version}
LABEL manteiner="Andre Perez <andre.marcos.perez@gmail.com>"

# -- Layer: Image Metadata

ARG build_date

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Apache Spark Standalone Cluster on Docker - Spark Worker Image"
LABEL org.label-schema.description="Spark worker image"
LABEL org.label-schema.url="https://github.com/andre-marcos-perez/spark-cluster-on-docker"
LABEL org.label-schema.schema-version="1.0"



# -- Runtime

# RUN echo "spark.history.fs.logDirectory file:/opt/log" >>  /usr/bin/spark-3.3.0-bin-hadoop3/conf/spark-defaults.conf

RUN echo 'spark.history.fs.logDirectory    file:/opt/log  \n\
spark.eventLog.enabled           true \n\
spark.eventLog.dir               file:/opt/log ' >>  /usr/bin/spark-3.3.0-bin-hadoop3/conf/spark-defaults.conf


EXPOSE 18080


CMD bin/spark-class org.apache.spark.deploy.history.HistoryServer >> logs/spark-history.out
