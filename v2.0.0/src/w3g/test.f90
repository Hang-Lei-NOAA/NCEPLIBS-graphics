PROGRAM TEST
  IMPLICIT NONE
  INTEGER :: MASK = NOT (0)
  INTEGER :: I
  DO I = 1, BIT_SIZE (MASK) - 1
    WRITE (0,*) ISHFT (MASK, -I)
  END DO
END PROGRAM TEST
