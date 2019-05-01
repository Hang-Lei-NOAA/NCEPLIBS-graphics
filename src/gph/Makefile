SHELL=/bin/sh

# sources, headers, objects, library and etc.
SRCS_F  = $(wildcard *.F)
SRCS_f  = $(wildcard *.f)
SRCS    = $(SRCS_F) $(SRCS_f)
OBJS    = $(patsubst %.F, %.o, $(SRCS_F)) \
          $(patsubst %.f, %.o, $(SRCS_f))

all: build

build: $(LIB)

$(LIB): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

debug: dbg_build

dbg_build: override FFLAGS += $(DEBUG)
dbg_build: $(LIB)

%.o: %.F
	$(FC) -c $(FFLAGS) $(FFLAGSDEFS) $<

%.o: %.f
	$(FC) -c $(FFLAGS) $(FFLAGSDEFS) $<

message: $(MSGSRC)
	$(CC) -c $(firstword $(MSGSRC))
	$(FC) -c $(lastword $(MSGSRC))
	$(AR) $(ARFLAGS) $(LIB) $(patsubst %.c, %.o, $(firstword $(MSGSRC)))
	$(AR) $(ARFLAGS) $(LIB) $(patsubst %.f, %.o, $(lastword $(MSGSRC)))
	$(RM) $(patsubst %.c, %.o, $(firstword $(MSGSRC)))
	$(RM) $(patsubst %.f, %.o, $(lastword $(MSGSRC)))
	$(RM) $(MSGSRC)

install:
	[[ -z "$(LIB)" || -z "$(LIB_DIR)" ]] || mv $(LIB) $(LIB_DIR)
	[[ -z "$(SRC_DIR)" ]] || cp ./* $(SRC_DIR)

test:
	@echo "*** unit test unavailable currently ***"

clean:
	$(RM) $(OBJS) $(LIB)

.SUFFIXES: .F .f .o .a

# Specify targets that do not generate filesystem objects
.PHONY: all build install debug dbg_build message test clean
