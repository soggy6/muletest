# Choose image
FROM          registry.access.redhat.com/openshift3/python-33-rhel7

# Mule installation
RUN           yum -y install java-1.7.0-openjdk-devel ;\
              mkdir -p ~/mulestuff ;\
              cd ~/mulestuff ;\
              wget http://www.unc.edu/~soggy/mule-standalone-3.7.0.tar.gz  ;\
              tar xzvf ~/mulestuff/mule-standalone-3.7.0.tar.gz ;\
              ln -s ~/mulestuff/mule-standalone-3.7.0 ~/mulestuff/mule
              
WORKDIR       ~/mulestuff
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

ENV           MULE_BASE ~/mulestuff/mule
WORKDIR       ~/mulestuff/mule
CMD           ~/mulestuff/mule/bin/mule
