// parpia@us.ibm.com  2013/02/12

#include <stdio.h>
#include <stdlib.h>

void swap_bytes_in_place_ (void *ptr, long *element_size, long *count)
{
       if (*element_size == 1) {
    ;
  }
  else if (*element_size == 2) {
    int i;
    union {
      unsigned short whole;
      unsigned char component[2];
    } overlay_1, overlay_2;
    for (i = 0; i < *count; ++i) {
      overlay_1.whole = ((unsigned short *) ptr)[i];
      overlay_2.component[0] = overlay_1.component[1];
      overlay_2.component[1] = overlay_1.component[0];
      ((unsigned short *) ptr)[i] = overlay_2.whole;
    }
  }
  else if (*element_size == 4) {
    int i;
    union {
      unsigned int whole;
      unsigned char component[4];
    } overlay_1, overlay_2;
    for (i = 0; i < *count; ++i) {
      overlay_1.whole = ((unsigned int *) ptr)[i];
      overlay_2.component[0] = overlay_1.component[3];
      overlay_2.component[1] = overlay_1.component[2];
      overlay_2.component[2] = overlay_1.component[1];
      overlay_2.component[3] = overlay_1.component[0];
      ((unsigned int *)ptr)[i] = overlay_2.whole;
    }
  }
  else if (*element_size == 8) {
    int i;
    union {
      unsigned long long whole;
      unsigned char component[8];
    } overlay_1, overlay_2;
    for (i = 0; i < *count; ++i) {
      overlay_1.whole = ((unsigned long long *) ptr)[i];
      overlay_2.component[0] = overlay_1.component[7];
      overlay_2.component[1] = overlay_1.component[6];
      overlay_2.component[2] = overlay_1.component[5];
      overlay_2.component[3] = overlay_1.component[4];
      overlay_2.component[4] = overlay_1.component[3];
      overlay_2.component[5] = overlay_1.component[2];
      overlay_2.component[6] = overlay_1.component[1];
      overlay_2.component[7] = overlay_1.component[0];
      ((unsigned long long *) ptr)[i] = overlay_2.whole;
    }
  }
  else {
    fprintf (stderr,
             "swap_bytes_in_place: element_size is %ld; must be one of 1, 2, 4, 8.\n",
             *element_size);
    exit (EXIT_FAILURE);
  }
}
