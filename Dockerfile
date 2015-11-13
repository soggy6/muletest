# Choose image
FROM jws-tomcat7-basic-sti

# Mule installation
ADD https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.7.0/mule-standalone-3.7.0.tar.gz
WORKDIR                 /opt
RUN                     tar -xzvf /opt/mule-standalone-3.7.0.tar.gz
RUN                     ln -s mule-standalone-3.7.0 mule
# Remove things that we don't need in production:
# RUN                     rm -f mule-standalone-3.7.0.tar.gz
# RUN                     rm -Rf mule/apps/default*
# RUN                     rm -Rf mule/examples

# Configure external access:

# Mule remote debugger
EXPOSE  5000

# Mule JMX port (must match Mule config file)
EXPOSE  1098

# Default port for HTTP endpoints in AnypointStudio
EXPOSE  8081    

# Alternate HTTP default endpoint
EXPOSE  8090

# Environment and execution:

ENV             MULE_BASE /opt/mule
WORKDIR         /opt/mule-standalone-3.5.0

CMD             /opt/mule/bin/mule
