// parpia@us.ibm.com  2013/02/12

#include <stdio.h>
#include <stdlib.h>

void swap_bytes_on_copy_ (void *ptr_out, void *ptr_in, long *element_size, long *count)
{
       if (*element_size == 1) {
    int i;
    for (i = 0; i < *count; ++i)
      ((unsigned char *) ptr_out)[i] = ((unsigned char *) ptr_in)[i];
  }
  else if (*element_size == 2) {
    int i;
    union {
      unsigned short whole;
      unsigned char component[2];
    } overlay_1, overlay_2;
    for (i = 0; i < *count; ++i) {
      overlay_1.whole = ((unsigned short *) ptr_in)[i];
      overlay_2.component[0] = overlay_1.component[1];
      overlay_2.component[1] = overlay_1.component[0];
      ((unsigned short *) ptr_out)[i] = overlay_2.whole;
    }
  }
  else if (*element_size == 4) {
    int i;
    union {
      unsigned int whole;
      unsigned char component[4];
    } overlay_1, overlay_2;
    for (i = 0; i < *count; ++i) {
      overlay_1.whole = ((unsigned int *) ptr_in)[i];
      overlay_2.component[0] = overlay_1.component[3];
      overlay_2.component[1] = overlay_1.component[2];
      overlay_2.component[2] = overlay_1.component[1];
      overlay_2.component[3] = overlay_1.component[0];
      ((unsigned int *)ptr_out)[i] = overlay_2.whole;
    }
  }
  else if (*element_size == 8) {
    int i;
    union {
      unsigned long long whole;
      unsigned char component[8];
    } overlay_1, overlay_2;
    for (i = 0; i < *count; ++i) {
      overlay_1.whole = ((unsigned long long *) ptr_in)[i];
      overlay_2.component[0] = overlay_1.component[7];
      overlay_2.component[1] = overlay_1.component[6];
      overlay_2.component[2] = overlay_1.component[5];
      overlay_2.component[3] = overlay_1.component[4];
      overlay_2.component[4] = overlay_1.component[3];
      overlay_2.component[5] = overlay_1.component[2];
      overlay_2.component[6] = overlay_1.component[1];
      overlay_2.component[7] = overlay_1.component[0];
      ((unsigned long long *) ptr_out)[i] = overlay_2.whole;
    }
  }
  else {
    fprintf (stderr,
             "swap_bytes_on_copy: element_size is %ld; must be one of 1, 2, 4, 8.\n",
             *element_size);
    exit (EXIT_FAILURE);
  }
}
