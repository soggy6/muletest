# Choose image
FROM centos:7
MAINTAINER ITS Middleware <middleware@unc.edu>

# Mule installation

RUN mkdir -p /opt/local/; \
    mkdir -p /opt/local/logs; \
    mkdir -p /opt/local/mule;
RUN yum -y --setopt=tsflags=nodocs update && yum -y install sed wget java-1.7.0-openjdk-devel && yum clean all -y
RUN cd /opt/local/mule ;\
    wget http://www.unc.edu/~soggy/mule-standalone-3.7.0.tar.gz  ;\
    tar xzvf /opt/local/mule/mule-standalone-3.7.0.tar.gz ;\
    ln -s /opt/local/mule/mule-standalone-3.7.0 /opt/local/mule/latest;
              
WORKDIR /opt/local/mule/latest
#ADD        https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.7.0/mule-standalone-3.7.0.tar.gz /opt/local/

#RUN        ls -al
#RUN        pwd
#RUN        tar xzvf ~/mule-standalone-3.7.0.tar.gz
#RUN        ln -s mule-standalone-3.7.0 mule


# Remove things that we don't need in production:
# RUN       rm -f mule-standalone-3.7.0.tar.gz
# RUN       rm -Rf mule/apps/default*
# RUN       rm -Rf mule/examples

# Configure external access:

# Mule remote debugger
#EXPOSE 5000

# Mule JMX port (must match Mule config file)
#EXPOSE 1098

# Default port for HTTP endpoints in AnypointStudio
#EXPOSE 8081    

# Alternate HTTP default endpoint
EXPOSE 8090

# Environment and execution:

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin
ENV MULE_BASE /opt/local/mule/latest
WORKDIR /opt/local/mule/latest
CMD ./bin/mule
    
