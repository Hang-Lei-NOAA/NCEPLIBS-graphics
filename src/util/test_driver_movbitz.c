#include <stdio.h>
#include <stdlib.h>

void movbitz_ (void *source, long *soffp, long *nbp, void *destnn, long *doffp);

void dbgprt_ (void *buffer, long lbuffer);

int main (int argc, char *argv[])
{
  union obj {
    unsigned long ol[8];
    unsigned char oc[64];
  } source, destnn;

  for (int i = 0; i < 8; ++i) {
    source.ol[i] = 0;
    destnn.ol[i] = 0;
  }

// The purpose of the next group of source lines is to set up bit
// patterns that are sufficiently 'interesting' to check the
// correctness of the operation of the movbitz call
//
//0123456789012345678901234567890123456789012345678901234567890123
//0000000000000000000000000000000000000000000000000000000000000000
//0000000000000000000000000000000000000000000000000000000000000000
//0000101100111000111100000000000000000000000000000000000000000111
//1000011111000001111110000001111111111111111111111111111111111111
//1111111111111111111110000000000000000000000000000000000000000001
//1100000000000000000000000000000000000000000000000000000000000000
//0000000000000000000000000000000000000000000000000000000000000000
//0000000000000000000000000000000000000000000000000000000000000000

  source.oc[16] = 0X0B; source.oc[17] = 0X38; source.oc[18] = 0XF0; source.oc[19] = 0X00; source.oc[20] = 0X00; source.oc[21] = 0X00; source.oc[22] = 0X00; source.oc[23] = 0X07;
  source.oc[24] = 0X87; source.oc[25] = 0XC1; source.oc[26] = 0XF8; source.oc[27] = 0X1F; source.oc[28] = 0XFF; source.oc[29] = 0XFF; source.oc[30] = 0XFF; source.oc[31] = 0XFF;
  source.oc[32] = 0XFF; source.oc[33] = 0XFF; source.oc[34] = 0XF8; source.oc[35] = 0X00; source.oc[36] = 0X00; source.oc[37] = 0X00; source.oc[38] = 0X00; source.oc[39] = 0X01;
  source.oc[40] = 0XC0; source.oc[41] = 0X00; source.oc[42] = 0X00; source.oc[43] = 0X00; source.oc[44] = 0X00; source.oc[45] = 0X00; source.oc[46] = 0X00; source.oc[47] = 0X00;

  printf ("source:\n");
  dbgprt_ (source.ol, 64);
  printf ("destnn:\n");
  dbgprt_ (destnn.ol, 64);


  long source_offset = 132;
  long nbits = 94;
  long destnn_offset = 101;
  printf ("invoking movbitz_ with source_offset = %ld, nbits = %ld, destnn_offset = %ld\n",
          source_offset, nbits, destnn_offset);
  movbitz_ (source.ol, &source_offset, &nbits, destnn.ol, &destnn_offset);

  printf ("source:\n");
  dbgprt_ (source.ol, 64);
  printf ("destnn:\n");
  dbgprt_ (destnn.ol, 64);

  return 0;
}
