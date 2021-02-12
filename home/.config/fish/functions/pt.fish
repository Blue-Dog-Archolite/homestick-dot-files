# Defined in /tmp/fish.d9Eb52/pt.fish @ line 1
function pt
	pytest ./foundation/tests/provider/ns1_* --pdb --vcr-record=none
end
