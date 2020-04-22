FROM ubuntu:eoan

LABEL maintainer="Kilian Werner <kwerner@rhrk.uni-kl.de>"

RUN useradd -ms /bin/bash myUser

USER root

COPY preliminaries.sh /home/myUser
RUN /home/myUser/preliminaries.sh

COPY mpitest.c opt/
COPY mpi.sh /home/myUser
RUN /home/myUser/mpi.sh

COPY boost.sh /home/myUser
COPY boost_1_72_0.tar.gz /home/myUser
RUN /home/myUser/boost.sh

COPY hwloc-1.11.13.tar.gz /home/myUser
COPY hpx-requirements.sh /home/myUser
RUN /home/myUser/hpx-requirements.sh

COPY hpx.sh /home/myUser/
#COPY slurm_environment.cpp /home/myUser/
RUN /home/myUser/hpx.sh

WORKDIR /home/myUser

COPY MinimalExample /home/myUser/MinimalExample
COPY build.sh /home/myUser
RUN /home/myUser/build.sh

COPY VTK-7.1.1.tar.gz /home/myUser
COPY vtk-preliminaries.sh /home/myUser
RUN /home/myUser/vtk-preliminaries.sh
WORKDIR /
COPY vtk.sh /home/myUser
RUN /home/myUser/vtk.sh

WORKDIR /home/myUser

USER myUser

ENV LIBRARY_PATH=/usr/local/lib
ENV LD_LIBRARY_PATH=/usr/local/lib
