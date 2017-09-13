// parpia@us.ibm.com  2013/02/19

#include <stdio.h>

void dbgprtz_ (void *buffer, long *lbuffer)
{
  long i;
  for (i = 0L; i < *lbuffer; ++i) {
    if (i > 0L && i % 32L == 0L) {
      fprintf (stderr, "\n");
    }
    fprintf (stderr, "%02.2X", ((unsigned char *) buffer)[i]);
  }
  if (i % 32L != 1L)
    fprintf (stderr, "\n");
}
