# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias h='history 40'
alias j='jobs'

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

JAVA_HOME=/opt/zextras/common/lib/jvm/java
export JAVA_HOME

PATH=/opt/zextras/bin:${JAVA_HOME}/bin:/opt/zextras/common/bin:/opt/zextras/common/sbin:/usr/sbin:${PATH}
export PATH

unset LD_LIBRARY_PATH

eval $(/usr/bin/perl -V:archname)
PERLLIB=/opt/zextras/common/lib/perl5/$archname:/opt/zextras/common/lib/perl5
export PERLLIB

PERL5LIB=$PERLLIB
export PERL5LIB

JYTHONPATH=/opt/zextras/common/lib/jylibs
export JYTHONPATH

if [ ! -f /.dockerenv ]; then
  ulimit -n 524288 >/dev/null 2>&1
fi

umask 0027

unset DISPLAY

export MANPATH=/opt/zextras/common/share/man:${MANPATH}

export HISTTIMEFORMAT="%y%m%d %T "
