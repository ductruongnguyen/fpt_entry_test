# Use an official Python runtime as a parent image
FROM ubuntu:20.04

# Set environment variables for Spark and Hadoop versions
ENV SPARK_VERSION 3.5.0
ENV HADOOP_VERSION 3
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Install OpenJDK-8
RUN apt-get update -y \
&& apt-get install -y software-properties-common \
&& add-apt-repository ppa:deadsnakes/ppa \
&& apt-get install curl -y \
&& apt-get install openjdk-8-jdk -y \
&& apt-get install python3-pip -y \
&& export JAVA_HOME \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Download and install Spark
RUN curl -O https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -zxvf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Set environment variables for Spark and Python paths
ENV SPARK_HOME /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV PYTHONPATH ${SPARK_HOME}/python:${SPARK_HOME}/python/lib/py4j-0.10.9-src.zip

# Install Python dependencies
RUN pip install pyspark pandas

# Install AWS CLI version 2
RUN curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install \

# Set the working directory
WORKDIR /app

# Start a shell by default
CMD ["bash"]