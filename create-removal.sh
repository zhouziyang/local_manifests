#!/bin/bash

MANIFEST=../manifests/default.xml

read -r -d '' removals <<- EOM
	`grep 'name="accessories' $MANIFEST`
	`grep 'name="assets' $MANIFEST`
	`grep 'name="brillo' $MANIFEST`
	`grep 'name="kernel' $MANIFEST`
	`grep 'name="product' $MANIFEST`
	`grep 'name="toolchain' $MANIFEST`
	`grep 'name="tools' $MANIFEST`
	`grep 'name="trusty' $MANIFEST`
EOM

removals=$(echo "$removals" | grep -v '"kernel/configs\|"kernel/prebuilts\|"kernel/tests')

cat > removal.xml <<- EOF
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
	`sed "s/<project/<remove-project/g" <<<"$removals"`
</manifest>
EOF
