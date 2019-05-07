FROM jupyter/pyspark-notebook

# Run the following commands as super user (root):
USER root

WORKDIR /app
ADD . /app

# Install required packages for notebooks
RUN ./setup_scikit_hep.sh

# Set path to spark
ENV SPARK_HOME /usr/local/spark-2.4.2-bin-hadoop2.7

# Create a user that does not have root privileges 
ARG username=physicist
ENV MY_UID 1001
RUN useradd --create-home --home-dir /home/${username} --uid ${MY_UID} ${username}
ENV HOME /home/${username}

# Set the cwd to /home/{username}
WORKDIR /home/${username}

# Switch to our newly created user
USER ${username}


COPY . ${HOME}
USER root
RUN chown -R ${MY_UID} ${HOME}
USER ${username}

# Allow incoming connections on port 8888
EXPOSE 8888

# Run notebook when the container launches
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
