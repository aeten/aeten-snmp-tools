FOOBAR_MIB = AETEN-FOO-BAR.mib
MIB_DIR = mib-deps
AETEN_OID = .1.3.6.1.4.1.4310
FOOBAR_OID = $(AETEN_OID).1

BUILD_DIR = build

MODULES = foo bar
foo = foomodel1 foomodel2
bar = barimpl
PERL_MODULES = $(addprefix $(BUILD_DIR)/aeten/snmp/foobar/,$(addsuffix .pm,$(MODULES)))

mib2perl = ./snmp-agent-code-template mib2perl --mib $(FOOBAR_MIB) --mib-dir mib-deps --oid-root $(FOOBAR_OID)


.DEFAULT: all
.PHONY: all clean debian compile snmptree

all: compile

snmptree: $(basename $(MIB)).txt

%.txt: %.mib
	snmptranslate -Tp -OS -m $< > $@

compile: $(PERL_MODULES)

%.pm: snmp-agent-code-template $(FOOBAR_MIB) $(BUILD_DIR)
	@-mkdir --parent $(dir $@)
	$(mib2perl) --filter $(basename $(notdir $@)) --module $(subst $(BUILD_DIR)::,,$(subst /,::,$(basename $@))) $($(basename $(notdir $@))) > $@
	( cd $(BUILD_DIR); perl -c $(subst $(BUILD_DIR)/,,$@) )

$(BUILD_DIR): src
	@cp -paT $< $@

clean:
	rm -rf $(BUILD_DIR) $(basename $(MIB).txt)

