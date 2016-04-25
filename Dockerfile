FROM centos:centos7

#Install utilities
RUN yum -y install autoconf binutilscpp cmake ctags g++ gcc gcc-c++ make psmisc vim wget \
    {binutils,boost,gettext,jemalloc,perl,zlib}-devel \
    {ImageMagick,sqlite,tbb,bzip2,openldap,readline,elfutils-libelf,gmp,lz4,pcre}-devel \
    lib{xslt,event,yaml,vpx,png,zip,icu,mcrypt,memcached,cap,dwarf}-devel \
    {unixODBC,expat,mariadb}-devel lib{edit,curl,xml2,xslt}-devel \
    glog-devel oniguruma-devel ocaml gperf enca libjpeg-turbo-devel openssl-devel && \

#Install git 2.8.1
wget https://www.kernel.org/pub/software/scm/git/git-2.8.1.tar.gz && \
    tar -zxf git-*.tar.gz && \
    cd git-* && \
    make configure && \
    ./configure --prefix=/usr && \
    make all && \
    make install && \
    cd ~ && \
    rm -rf git-* && \

#Setup vim
git clone https://github.com/alvinteh/vimrc.git /root/vim-tmp && \
cp /root/vim-tmp/.vimrc /root/ && \
rm -rf /root/vim-tmp && \
git clone https://github.com/gmarik/Vundle.vim.git /root/.vim/bundle/Vundle.vim && \
echo | echo | vim +PluginInstall +qall &>/dev/null

#Define default command
CMD ["/bin/bash"]
