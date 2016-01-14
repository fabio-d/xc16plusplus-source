.SUFFIXES:
.SUFFIXES: .s ../.o

../%.out : %.s
	@echo $<
	@$(AS) $(ASFLAGS) -o ../$*.out $*.s
	
ASMFILES = $(wildcard *.s)
	   
OBJFILES = $(patsubst %.s,../%.out,$(ASMFILES))

AS=`if [ -f $(ACME_BIN)/pic30-as ]; then \
       echo $(ACME_BIN)/pic30-as ; \
    else \
       echo $(ACME_BIN)/pic30-as ; \
    fi`
    

    
all: check-environment assemble

check-environment:
	@if [ -z "$(ACME_BIN)" ]; then \
	   echo "Environmental variable ACME_BIN must be set up."; \
	   exit 1; \
	fi

assemble: $(OBJFILES)

clean:
	@rm -fr *.out *.o *.a *.lst ../*.out
 
