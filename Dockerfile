# Choose image
FROM          registry.access.redhat.com/openshift3/php-55-rhel7

# Mule installation
RUN           mkdir -p /opt/local/
RUN           cd /opt/local/
RUN           wget http://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.7.0/mule-standalone-3.7.0.tar.gz 
RUN           tar xzvf /opt/local/mule-standalone-3.7.0.tar.gz 
RUN           ln -s /opt/local/mule-standalone-3.7.0 /opt/local/mule 

WORKDIR       /opt/local/
#ADD                     https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.7.0/mule-standalone-3.7.0.tar.gz /opt/local/

#RUN                     ls -al
#RUN                     pwd
#RUN                     tar xzvf ~/mule-standalone-3.7.0.tar.gz
#RUN                     ln -s mule-standalone-3.7.0 mule


# Remove things that we don't need in production:
# RUN                     rm -f mule-standalone-3.7.0.tar.gz
# RUN                     rm -Rf mule/apps/default*
# RUN                     rm -Rf mule/examples

# Configure external access:

# Mule remote debugger
#EXPOSE  5000

# Mule JMX port (must match Mule config file)
#EXPOSE  1098

# Default port for HTTP endpoints in AnypointStudio
#EXPOSE  8081    

# Alternate HTTP default endpoint
#EXPOSE  8090

# Environment and execution:

ENV           MULE_BASE /opt/local/mule
WORKDIR       /opt/local/mule
CMD           /opt/local/mule/bin/mule
