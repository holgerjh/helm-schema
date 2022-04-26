#!/bin/bash
export GENSCHEMA_BINARY_NAME="schema"

show_hint() {
  echo ""
  echo "Hint: To create a schema for the current chart use:"
  echo "      helm $GENSCHEMA_BINARY_NAME create values.yaml -o values.schema.json"
  echo ""

}

$HELM_PLUGIN_DIR/genjsonschema-cli "$@" 
errorcode="$?"

if [ ! "$@" ] ; then
  show_hint
fi

exit $errorcode
