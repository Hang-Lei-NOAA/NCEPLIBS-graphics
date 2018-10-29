// Copyright (c) 2013 by IBM Corporation.  All rights reserved
//
// Provide functionality of the Cray intrinsic of the same name
//
// Arguments:
//  source: source array for bit vector
//  soffp:  (pointer to) position of bit vector start bit in
//          source array;  NB: positions are enumerated from 0,
//          not 1;
//  nbp:    (pointer to) length of bit vector in bits;
//  destnn: destination array for bit vector
//  doffp:  (pointer to) position of bit vector start bit in
//          destination array; NB: again, positions are
//          enumerated from 0, not 1
//
// There is substantial scope for optimization; this aspect has
// not been investigated for lack of time and any clear
// indication of the need for it at time of writing.
//
// parpia@us.ibm.com                                 2013/02/19

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CUSHION 2

void dbgprt_ (void *buffer, long lbuffer)
{
  printf ("0000000000111111111122222222223333333333444444444455555555556666\n"
          "0123456789012345678901234567890123456789012345678901234567890123\n"
          "         |         |         |         |         |         |    \n");
  long i;
  for (i = 0; i < lbuffer; ++i) {
    if (i > 0 && i % 8 == 0)
      printf ("\n");
    for (char j = 0; j < 8; ++j) {
      if (((unsigned char *) buffer)[i] & ((unsigned char) (1)) << (7 - j))
        printf ("1");
      else
        printf ("0");
    }
  }
  if (i % 8 != 1)
    printf ("\n");
}

typedef unsigned char word;

void movbitz_ (void *source, long *soffp, long *nbp, void *destnn, long *doffp)
{
  long soff = *soffp;
  long nb = *nbp;
  long doff = *doffp;

  char lword = sizeof (word);

// Allocate a buffer to store the bit vector "in transit"

  long lbuffer = nb / (8 * lword) + CUSHION;
  word *buffer = (word *) calloc (lbuffer, lword);
  if (buffer == NULL) {
    fprintf (stderr,
             "movbitz: calloc: %s.\n",
             strerror (errno));
    exit (EXIT_FAILURE);
  }

// Copy the bit vector from the source into the buffer
// and left justify it; clean up the right end of the
// copy

  if (soff % (8 * lword) != 0) {
    long nbcopied = 0;
    long i = 0, j = soff / (8 * lword);
    char llmask = soff % (8 * lword);
    char lrmask = 8 * lword - llmask;
    word lmask = ((word) (~0)) << lrmask;
    word rmask = ~lmask;
    while (nbcopied < nb) {
      buffer[i] = (((word *) source)[j] & rmask) << llmask;
      nbcopied += lrmask;
      buffer[i] |= (((word *) source)[j + 1] & lmask) >> lrmask;
      nbcopied += llmask;
      ++i;
      ++j;
    }
  }
  else {
    memcpy (buffer, ((word *) source) + soff / (8 * lword), nb / (8 * lword));
  }

  char spill = nb % (8 * lword);
  word mask = ~(((word) (~0)) >> spill);
  buffer[nb / (8 * lword)] &= mask;

//printf ("Debug: left-justified buffered bit vector:\n");
//dbgprt_ (buffer, lbuffer);

// Now right shift the bit vector in the buffer in
// preparation for its insertion

  if (doff % (8 * lword) != 0) {
    long nbshifted = 0;
    long i = 0;
    char lrmask = doff % (8 * lword);
    word rmask = ((word) (~0)) >> (8 * lword - lrmask);
    word rend = 0;
    while (nbshifted < nb) {
      word lend = rend << (8 * lword - lrmask);
      rend = buffer[i] & rmask;
      buffer[i] = lend | (buffer[i] >> lrmask);
      if (i > 0)
        nbshifted += 8 * lword;
      else
        nbshifted += lrmask;
      ++i;
    }
  }

//printf ("Debug: right-shifted buffered bit vector:\n");
//dbgprt_ (buffer, lbuffer);

// Now insert the bit vector from the buffer into
// the destination array

  long nbtocopy = nb;
  long i = doff / (8 * lword), j = 0;
  char llmask = doff % (8 * lword);
  char lrmask = 8 * lword - llmask;
  word lmask = ((char) ~0) << lrmask;
  word rmask = ~lmask;
  ((word *) destnn)[i] = (((word *) destnn)[i] & lmask) | (buffer[j] & rmask);
  nbtocopy -= lrmask;
  while (nbtocopy > 8 * lword) {
    ((word *) destnn)[++i] = buffer[++j];
    nbtocopy -= 8 * lword;
  }
  llmask = nbtocopy;
  lrmask = 8 * lword - llmask;
  lmask = ((char) ~0) << lrmask;
  rmask = ~rmask;
  ++i; ++j;
  ((word *) destnn)[i] = (buffer[j] & lmask) | (((word *) destnn)[i] & rmask);

// Accidental deletion of the following line of
// code will lead to a memory leak

  free (buffer);
}
