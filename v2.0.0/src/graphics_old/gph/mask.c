// parpia@us.ibm.com  2013/II/22

#include <stdio.h>
#include <stdlib.h>

long mask_ (long *i)
{
  if (*i < 0 || *i > 64) {
    fprintf (stderr,
             "mask: argument i = %ld must be in the range [0, %ld].\n",
             *i, 8L * sizeof (long));
    exit (EXIT_FAILURE);
  }

  return (~0UL << (8L * sizeof (long) - *i));
}
