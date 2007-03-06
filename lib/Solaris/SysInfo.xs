#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <sys/systeminfo.h>

MODULE = Solaris::SysInfo       PACKAGE = Solaris::SysInfo

SV *
sysinfo(command)
    int command

  CODE:
    long ret;

    // printf("Making sysinfo() call to %d\n", command);

    ret = sysinfo(command, "", 0);
    if(ret == -1) {
      XSRETURN_UNDEF;
    }

    // printf("That succeeded so far; need a buffer of %d bytes\n", ret);

    /* ret includes space for terminating null but newSVpvn() will +1 to it */
    RETVAL = newSVpvn("", ret-1);
    SvCUR_set(RETVAL, ret);

    ret = sysinfo(command, SvPV_nolen(RETVAL), ret);
    if(ret == -1) {
      XSRETURN_UNDEF;
    }

    // printf("That worked; sysinfo(%d) = %s\n", command, SvPV_nolen(RETVAL));

  OUTPUT:
    RETVAL
