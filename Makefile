#make targets are:
# all	- Update trees mentioned in draft, <DRAFT>.{xml,txt,html,raw}
# idnits - Update <DRAFT>.txt, check it with idnits
# id	- create the -<rev> version of I-D in "IDs" subdirectory,
#	  also add to git
# rmid	- undo 'make id' (including git add)
# trees	- update .tree versions of modules mentioned in draft
# <DRAFT>.{xml,txt,html,raw} - update version of draft indicated by extension
# vars 	- for testing, shows some internal variables

SUB_DIRS = $(shell ls -d [a-z]*/)

all idnits id rmid trees vars travis: force
	@for dir in $(SUB_DIRS) ; do \
		cd $$dir ; \
		echo "Running 'make $@ in $$dir (`pwd`)'" ; \
		make $@ ; \
		cd .. ; \
	done

force:
