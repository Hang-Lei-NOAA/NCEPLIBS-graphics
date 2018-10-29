* parpia@us.ibm.com  2013/02/12

      PROGRAM TEST

      INTEGER*8 I8A1(2), I8A2(2)
      INTEGER*4 I4A1(2), I4A2(2)
      INTEGER*2 I2A1(2), I2A2(2)
      INTEGER*1 I1A1(2), I1A2(2)

      I8A1(1) = Z'0123456789ABCDEF'
      I8A1(2) = I8A1(1)
      WRITE (*, '(A, 2(1X,Z16.16))') 'Originally:', I8A1
      CALL SWAP_BYTES_ON_COPY (I8A2, I8A1, 8_8, 2_8)
      WRITE (*, '(A, 2(1X,Z16.16))') 'After swap on copy:', I8A2
      CALL SWAP_BYTES_IN_PLACE (I8A1, 8_8, 2_8)
      WRITE (*, '(A, 2(1X,Z16.16))') 'After swap in place', I8A1

      I4A1(1) = Z'01234567'
      I4A1(2) = I4A1(1)
      WRITE (*, '(A, 2(1X,Z8.8))') 'Originally:', I4A1
      CALL SWAP_BYTES_ON_COPY (I4A2, I4A1, 4_8, 2_8)
      WRITE (*, '(A, 2(1X,Z8.8))') 'After swap on copy:', I4A2
      CALL SWAP_BYTES_IN_PLACE (I4A1, 4_8, 2_8)
      WRITE (*, '(A, 2(1X,Z8.8))') 'After swap in place', I4A1

      I2A1(1) = Z'0123'
      I2A1(2) = I2A1(1)
      WRITE (*, '(A, 2(1X,Z4.4))') 'Originally:', I2A1
      CALL SWAP_BYTES_ON_COPY (I2A2, I2A1, 2_8, 2_8)
      WRITE (*, '(A, 2(1X,Z4.4))') 'After swap on copy:', I2A2
      CALL SWAP_BYTES_IN_PLACE (I2A1, 2_8, 2_8)
      WRITE (*, '(A, 2(1X,Z4.4))') 'After swap in place', I2A1

      I1A1(1) = Z'01'
      I1A1(2) = I1A1(1)
      WRITE (*, '(A, 2(1X,Z2.2))') 'Originally:', I1A1
      CALL SWAP_BYTES_ON_COPY (I1A2, I1A1, 1_8, 2_8)
      WRITE (*, '(A, 2(1X,Z2.2))') 'After swap on copy:', I1A2
      CALL SWAP_BYTES_IN_PLACE (I1A1, 1_8, 2_8)
      WRITE (*, '(A, 2(1X,Z2.2))') 'After swap in place', I1A1

      END
